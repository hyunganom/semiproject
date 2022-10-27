package com.kh.semi.repository;

import com.kh.semi.entity.ReviewDto;

public interface ReviewDao {

	// 추상 메소드 - 리뷰 등록을 위한 다음 시퀀스 번호 반환
	public int nextSequence();
	
	// 추상 메소드 - 리뷰 작성
	public void writeReview(ReviewDto reviewDto);
	
	// 추상 메소드 - 리뷰 작성 전 상품의 총 별점
	public int scoreBeforeWrite(int productNo);
	
	// 추상 메소드 - 리뷰 작성 전 리뷰의 총 갯수
	public int countBeforeWrite(int productNo);
	
	// 추상 메소드 - 리뷰 등록시 해당 상품의 리뷰 점수 수정(UPDATE)
	public boolean updateProductGood(double insertScore, int productNo);
}
