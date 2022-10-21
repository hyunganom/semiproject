package com.kh.semi.repository;

import java.util.List;

import com.kh.semi.entity.CategoryHighDto;
import com.kh.semi.entity.CategoryLowDto;
import com.kh.semi.entity.ProductDto;
import com.kh.semi.vo.ProductListSearchVO;

public interface ProductDao {

	// 추상 메소드 - 상위 카테고리 항목 조회
	List<CategoryHighDto> selectCategoryHighList();
	
	// 추상 메소드 - 상위 카테고리 항목에 연결된 하위 카테고리 항목 조회
	List<CategoryLowDto> selectCategoryLowList(int categoryHighNo);
	
	// 추상 메소드 - 상품 등록을 위한 다음 시퀀스 번호 반환
	int nextSequence();
	
	// 추상 메소드 - 관리자 상품 등록(INSERT)
	void insertProduct(ProductDto productDto);
	
	// 추상 메소드 - 상품 이미지 첨부파일 기록 등록(INSERT)
	void connectAttachment(int productNo, int attachmentNo);
	
	// 추상 메소드 - 관리자 상품 조회(SELECT)
	// 1) 통합 조회
	List<ProductDto> selectListProduct(ProductListSearchVO productListSearchVO);
	
	// 2) 전체 조회
	List<ProductDto> allListProduct(ProductListSearchVO productListSearchVO);
	
	// 3) 검색 조회
	List<ProductDto> searchListProduct(ProductListSearchVO productListSearchVO);
	
	// 추상 메소드 - 관리자 상품 상세(DETAIL)
	ProductDto selectOneProduct(int productNo);
	
	// 추상 메소드 - 관리자 상품 수정(UPDATE)
	boolean updateProduct(ProductDto productDto);
	
	// 추상 메소드 - 관리자 상품 삭제(비활성화로 UPDATE)
	boolean deleteProduct(int productNo, boolean isProductInactive);
	
	// 추상 메소드 - 상품 수정시 수정시간 갱신
	void updateProductRegistTime(int productNo);
	
	// 추상 메소드 - 관리자 상품 삭제(DELETE)
	boolean deleteProduct(int productNo);
	
	// 추상 메소드 - 상품 총 갯수
	// 1) 통합 조회시 상품의 총 갯수
	int countTotalProduct(ProductListSearchVO productListSearchVO);
	
	// 2) 전체 조회시 상품의 총 갯수
	int countAllProduct();
	
	// 3) 검색 조회시 상품의 총 갯수
	int countSearchProduct(ProductListSearchVO productListSearchVO);
}
