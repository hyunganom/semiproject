package com.kh.semi.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class PaymentDto {
	private int paymentNo;
	private String paymentOrderNo;
	private int paymentProductNo;
	private int paymentCount, paymentPrice;
} 
