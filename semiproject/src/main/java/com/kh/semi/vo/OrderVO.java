package com.kh.semi.vo;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class OrderVO {
	private int orderNo;
	private String orderId;
	private String orderName;
	private String orderPost;
	private String orderBaseAddress;
	private String orderDetailAddress;
	private String orderTel;
	private String orderMemo;
	private Date orderDate;
	private String orderStatus;
	private Date orderChangeDate;
	private int orderPrice, orderPayPrice;
	private String orderType;
	private int orderUsePoint, orderPoint;
	
	private List<PaymentVO> payment;
	
	
	
	
}