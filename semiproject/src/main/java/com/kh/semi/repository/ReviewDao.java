package com.kh.semi.repository;

import com.kh.semi.entity.ReviewDto;

public interface ReviewDao {

	// 추상 메소드 - 리뷰 등록을 위한 다음 시퀀스 번호 반환
	public int nextSequence();
	
	// 추상 메소드 - 리뷰 작성
	public void writeReview(ReviewDto reviewDto);
}
