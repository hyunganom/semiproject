package com.kh.semi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ProductDto {

	// 필드
	private int productNo;
	private int categoryHighNo;
	private int categoryLowNo;
	private String productName;
	private int productPrice;
	private String productInformation;
	private int productInventory;
	private int productGood;
}
