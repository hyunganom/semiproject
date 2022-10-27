package com.kh.semi.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ReviewPaymentNoVO {

	// 필드
	private int paymentNo; // 결제 번호
	private int paymentProductNo; // 결제 상품 번호
}
