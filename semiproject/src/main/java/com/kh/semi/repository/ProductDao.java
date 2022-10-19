package com.kh.semi.repository;

import com.kh.semi.entity.ProductDto;

public interface ProductDao {

	// 추상 메소드 - 상품 등록을 위한 다음 시퀀스 번호 반환
	int nextSequence();
	
	// 추상 메소드 - 관리자 상품 등록(INSERT)
	void insertProduct(ProductDto productDto);
	
	// 추상 메소드 - 관리자 상품 조회
	
	
	// 추상 메소드 - 관리자 상품 상세
	
	// 추상 메소드 - 관리자 상품 수정
	
	// 추상 메소드 - 관리자 상품 비활성화
}
