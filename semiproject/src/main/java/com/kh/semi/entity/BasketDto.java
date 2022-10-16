package com.kh.semi.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class BasketDto {
	private String basketId;
	private int basketProductNo, basketCount;
	private Date basketAddDate;
	
}
