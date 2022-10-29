package com.kh.semi.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.RowMapperResultSetExtractor;
import org.springframework.stereotype.Repository;

import com.kh.semi.entity.InquireReplyDto;
import com.kh.semi.entity.ReviewDto;
import com.kh.semi.vo.ReviewMypageVO;
import com.kh.semi.vo.ReviewProductVO;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	
	// 의존성 주입
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	// 추상 메소드 오버라이딩 - 리뷰 등록을 위한 다음 시퀀스 번호 반환
	@Override
	public int nextSequence() {
		String sql = "select review_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	
	// 추상 메소드 오버라이딩 - 리뷰 작성
	@Override
	public void writeReview(ReviewDto reviewDto) {
		String sql = "insert into review(review_no, review_payment_no, review_id, review_title, review_content, review_good) values(?, ?, ?, ?, ?, ?)";
		Object[] param = new Object[] {reviewDto.getReviewNo(), reviewDto.getReviewPaymentNo(), reviewDto.getReviewId(), reviewDto.getReviewTitle(), reviewDto.getReviewContent(), reviewDto.getReviewGood()};
		jdbcTemplate.update(sql, param);
	}

	// 추상 메소드 오버라이딩 - 리뷰 작성 전 상품의 총 별점
	@Override
	public int scoreBeforeWrite(int productNo) {
		String sql = "select sum(review_good) from review r inner join (select * from product pd inner join payment pm on pd.product_no = pm.payment_product_no) ppm on r.review_payment_no = ppm.payment_no where ppm.product_no = ?";
		Object[] param = new Object[] {productNo};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}

	// 추상 메소드 오버라이딩 - 리뷰 작성 전 리뷰의 총 갯수
	@Override
	public int countBeforeWrite(int productNo) {
		String sql = "select count(*) from review r inner join (select * from product pd inner join payment pm on pd.product_no = pm.payment_product_no) ppm on r.review_payment_no = ppm.payment_no where ppm.product_no = ?";
		Object[] param = new Object[] {productNo};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}

	// 추상 메소드 오버라이딩 - 리뷰 등록시 해당 상품의 리뷰 점수 수정(UPDATE)
	@Override
	public boolean updateProductGood(double insertScore, int productNo) {
		String sql = "update product set product_good = ? where product_no = ?";
		Object[] param = new Object[] {insertScore, productNo};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	// ReviewProductVO에 대한 RowMapper
	private RowMapper<ReviewProductVO> mapperReviewProduct = new RowMapper<>() {
		@Override
		public ReviewProductVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			return ReviewProductVO.builder()
						.reviewId(rs.getString("review_id"))
						.reviewWritetime(rs.getDate("review_writetime"))
						.paymentOption(rs.getString("payment_option"))
						.reviewGood(rs.getInt("review_good"))
						.reviewTitle(rs.getString("review_title"))
						.reviewContent(rs.getString("review_content"))
						.reviewAttachmentNo(rs.getInt("review_attachment_no"))
					.build();
		}
	};
	
	
	// 추상 메소드 오버라이딩 - 상품에 표시될 리뷰 조회 : 작성자, 작성일, 옵션, 별점, 제목, 내용, 리뷰 첨부파일 번호
	@Override
	public List<ReviewProductVO> selectProductAllReview(int productNo) {
		String sql = "select rra.review_id, rra.review_writetime, pa.payment_option, rra.review_good, rra.review_title, rra.review_content, rra.review_attachment_no from payment pa inner join (select * from review r inner join review_attachment ra on r.review_no = ra.review_attachment_origin_no) rra on pa.payment_no = rra.review_payment_no where pa.payment_product_no = ? order by rra.review_writetime desc";
		Object[] param = new Object[] {productNo};
		return jdbcTemplate.query(sql, mapperReviewProduct, param);
	}
	
	// ReviewMypageVO에 대한 RowMapper
	private RowMapper<ReviewMypageVO> mapperReviewMypage = new RowMapper<>() {
		@Override
		public ReviewMypageVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			return ReviewMypageVO.builder()
						.reviewNo(rs.getInt("review_no"))
						.paymentOrderNo(rs.getInt("payment_order_no"))
						.productName(rs.getNString("product_name"))
						.paymentCount(rs.getInt("payment_count"))
						.paymentOption(rs.getString("payment_option"))
						.reviewGood(rs.getInt("review_good"))
						.reviewAttachmentNo(rs.getInt("review_attachment_no"))
						.reviewTitle(rs.getString("review_title"))
						.reviewContent(rs.getString("review_content"))
						.reviewWritetime(rs.getDate("review_writetime"))
						.paymentReview(rs.getString("payment_review") != null)
					.build();
		}
	};

	// 추상 메소드 오버라이딩 - 내가 작성한 리뷰 목록 : 리뷰 번호(수정, 삭제를 위해), 주문 번호, 상품명, 수량, 옵션, 별점, 리뷰 첨부파일 번호, 제목, 내용, 작성일, 리뷰 작성 여부
	@Override
	public List<ReviewMypageVO> selectMypageAllReview(String reviewId) {
		String sql = "select rra.review_no, ppa.payment_order_no, ppa.product_name, ppa.payment_count, ppa.payment_option, rra.review_good, rra.review_attachment_no, rra.review_title, rra.review_content, rra.review_writetime, ppa.payment_review from (select * from review r inner join review_attachment ra on r.review_no = ra.review_attachment_origin_no) rra inner join (select * from product p inner join payment pa on p.product_no = pa.payment_product_no) ppa on rra.review_payment_no = ppa.payment_no where rra.review_id = ? order by ppa.payment_order_no desc, ppa.payment_no asc";
		Object[] param = new Object[] {reviewId};
		return jdbcTemplate.query(sql, mapperReviewMypage, param);
	}

	//회원이 작성한 리뷰 수정기능
	@Override
	public boolean updateReview(ReviewDto reviewDto) {
		String sql ="update review set review_payment_no= ? , review_title= ? , review_content= ? , review_updatetime= sysdate , review_good= ?  where review_no= ? ";
		Object[] param = {reviewDto.getReviewPaymentNo(), reviewDto.getReviewTitle(), reviewDto.getReviewContent(), reviewDto.getReviewGood(), reviewDto.getReviewNo()};
		return jdbcTemplate.update(sql, param) > 0;
	}

	@Override
	public ReviewDto selectOneReview(int reviewNo) {
		String sql ="select * from review where review_no = ?";
		Object[] param = {reviewNo};
		return jdbcTemplate.query(sql, extractor, param);
	}
	
	ResultSetExtractor<ReviewDto> extractor = (rs)->{
		if(rs.next()) {
			return ReviewDto.builder()
					.reviewNo(rs.getInt("review_no"))
					.reviewId(rs.getString("review_id"))
					.reviewPaymentNo(rs.getInt("review_payment_no"))
					.reviewTitle(rs.getString("review_title"))
					.reviewContent(rs.getString("review_content"))
					.reviewWritetime(rs.getDate("review_writetime"))
					.reviewUpdatetime(rs.getDate("review_updatetime"))
					.reviewGood(rs.getInt("review_good"))
					.reviewInactive(rs.getString("review_inactive"))
					.build();
		}
		else return null;
	};
}
