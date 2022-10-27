package com.kh.semi.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.semi.entity.ReviewDto;

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

}
