package com.kh.semi.vo;

import java.sql.Date;

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
public class ReviewMypageVO {
	
	// 필드
	private int paymentOrderNo; // 상품 주문 번호
	private String productName; // 상품명
	private int paymentCount; // 결제 수량
	private String paymentOption; // 결제 옵션(구독 상품일 경우 선택한 옵션)
	private int reviewGood;
	private int reviewAttachmentNo; // 리뷰 이미지 첨부파일
	private String reviewTitle; // 리뷰 제목
	private String reviewContent; // 리뷰 내용
	private Date reviewWritetime; // 리뷰 작성일
}
