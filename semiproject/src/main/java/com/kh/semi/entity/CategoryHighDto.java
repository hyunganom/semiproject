package com.kh.semi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CategoryHighDto {

	// 필드
	int categoryHighNo;  // 상위 카테고리 번호
	String categoryHighName;  // 상위 카테고리 이름
}
