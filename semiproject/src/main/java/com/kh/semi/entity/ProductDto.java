package com.kh.semi.entity;

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
public class ProductDto {

	// 필드
	private int productNo; // 상품 번호 - 시퀀스
	private int categoryHighNo; // 상위 카테고리 번호
	private int categoryLowNo; // 하위 카테고리 번호
	private String productName; // 상품 이름
	private int productPrice; // 상품 가격
	private String productInformation; // 상품 정보
	private int productInventory; // 상품 재고
	private int productGood; // 상품 별점
}
