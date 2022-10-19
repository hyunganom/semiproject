package com.kh.semi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CategoryLowDto {

	// 필드
	int categoryLowNo; // 하위 카테고리 번호
	int categoryHighNo; // 상위 카테고리 번호 (상위 카테고리 번호 참조)
	String categoryLowName; // 하위 카테고리 이름
}
