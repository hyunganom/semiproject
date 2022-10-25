package com.kh.semi.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ProductListVO {

	// 필드
	private int productNo;
	private String productName;
	private int productPrice;
	private int productGood;
	private boolean productInactive;
	private int attachmentNo;
}
