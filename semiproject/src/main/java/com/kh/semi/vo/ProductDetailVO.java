package com.kh.semi.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class ProductDetailVO {

	// 리뷰 작성시 해당 페이지에 상품 정보와 이미지를 표시하기 위함
	
	// 필드
	int productNo; // 상품 번호
	String productName; // 상품 이름
	int productPrice; // 상품 가격
	int productGood; // 상품 	별점
	boolean productInactive; // 상품 비활성화
	int productAttachmentNo; // 상품 첨부파일
}
