package com.kh.semi.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MypagePaymentInfoVO {
	private int productNo;
	private String productName;
	private int paymentNo;
	private int paymentOrderNo;
	private int paymentProductNo;
	private int paymentCount;
	private int paymentPrice;
	private String paymentOption;
	private String orderId;
	private Date orderDate;
	private int productOriginNo;
	private int productAttachmentNo;
}
