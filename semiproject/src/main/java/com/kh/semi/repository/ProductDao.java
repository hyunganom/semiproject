package com.kh.semi.repository;

import java.util.List;

import com.kh.semi.entity.ProductDto;
import com.kh.semi.vo.ProductCategoryListVO;

public interface ProductDao {

	// 추상 메소드 - 모든 상품 카테고리 항목 조회
	List<ProductCategoryListVO> selectCategoryList();
	
	// 추상 메소드 - 상품 등록을 위한 다음 시퀀스 번호 반환
	int nextSequence();
	
	// 추상 메소드 - 관리자 상품 등록(INSERT)
	void insertProduct(ProductDto productDto);
	
	// 추상 메소드 - 관리자 상품 조회
	// 1) 통합 조회
	List<ProductDto> selectListProduct();
	
	// 2) 전체 조회
	List<ProductDto> allListProduct();
	
	// 3) 검색 조회
	List<ProductDto> searchListProduct(String type, String keyword);
	
	// 추상 메소드 - 관리자 상품 상세
	ProductDto selectOneProduct(int productNo);
	
	// 추상 메소드 - 관리자 상품 수정
	boolean updateProduct(ProductDto productDto);
	
	// 추상 메소드 - 관리자 상품 비활성화
	
	void connectAttachment(int productNo, int attachmentNo);
	// 추상 메소드 - 상품 수정시 수정시간 갱신
	void updateProductRegistTime(int productNo);
	
	// 추상 메소드 - 관리자 상품 삭제(비활성화)
	boolean deleteProduct(int productNo, boolean isProductInactive);
}
