package com.kh.semi.vo;

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
public class ProductListSearchVO {

	// 필드
	private String type;		// 분류
	private String keyword;		// 검색어
	
	// 검색 조회인지 전체 조회인지 판정하여 boolean 반환
	public boolean isSearch() {
		return type != null && keyword != null;
	}
}
