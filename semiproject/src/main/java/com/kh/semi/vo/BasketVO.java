package com.kh.semi.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class BasketVO {
	private int basketNo;
	private String basketId;
	private int basketProductNo, basketCountNumber;
	private Date basketAddDate;
	private String basketProductOption;
	private String productName;
	private int productPrice;
}
