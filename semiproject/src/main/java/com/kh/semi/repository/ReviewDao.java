package com.kh.semi.repository;

import java.util.List;

import com.kh.semi.entity.ReviewDto;
import com.kh.semi.vo.ReviewProductVO;

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
	
	// 추상 메소드 - 상품에 표시될 리뷰 조회
	public List<ReviewProductVO> selectProductAllReview(int productNo);
	
	// 추상 메소드 - 내가 작성한 리뷰 목록
	
	//리뷰 작성 수정(UPDATE)
	boolean updateReview(ReviewDto reviewDto);
}
