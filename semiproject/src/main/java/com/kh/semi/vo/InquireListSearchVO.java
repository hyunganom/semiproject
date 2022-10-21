package com.kh.semi.vo;

import lombok.Data;

@Data
public class InquireListSearchVO {

	// 필드
	private String type;	// 분류
	private String keyword; // 검색어
	
	// 검색 조회인지 반환
	boolean isSearch() {
		// 분류와 검색어가 모두 존재한다면(둘 다 null이 아니라면)
		return type != null && keyword != null;
	};
}
