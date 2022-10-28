package com.kh.semi.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.semi.entity.ReviewDto;
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
	
	
	// 추상 메소드 오버라이딩 - 상품에 표시될 리뷰 조회
	@Override
	public List<ReviewProductVO> selectProductAllReview(int productNo) {
		String sql = "select rra.review_id, rra.review_writetime, pa.payment_option, rra.review_good, rra.review_title, rra.review_content, rra.review_attachment_no from payment pa inner join (select * from review r inner join review_attachment ra on r.review_no = ra.review_attachment_origin_no) rra on pa.payment_no = rra.review_payment_no where pa.payment_product_no = ? order by rra.review_writetime desc";
		Object[] param = new Object[] {productNo};
		return jdbcTemplate.query(sql, mapperReviewProduct, param);
	}
	
	//회원이 작성한 리뷰 수정기능
	@Override
	public boolean updateReview(ReviewDto reviewDto) {
		String sql ="update review set review_id= ? , review_payment_no= ? , review_title= ? , review_content= ? , review_updatetime= sysdate , review_good= ?  where review_no= ? ";
		Object[] param = {reviewDto.getReviewId(), reviewDto.getReviewPaymentNo(), reviewDto.getReviewTitle(), reviewDto.getReviewContent(), reviewDto.getReviewGood(), reviewDto.getReviewNo()};
		return jdbcTemplate.update(sql, param) > 0;
	}

	// 
}
