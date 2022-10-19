package com.kh.semi.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class PaymentDto {
	private int payment_no;
	private String payment_order_no;
	private int payment_product_no;
	private int payment_count, payment_price;
} 
