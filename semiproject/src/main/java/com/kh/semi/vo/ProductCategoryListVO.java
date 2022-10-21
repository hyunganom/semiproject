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
public class ProductCategoryListVO {

	// 필드
	private int categoryHighNo;  // 상위 카테고리 번호
	private String categoryHighName;  // 상위 카테고리 이름
	private int categoryLowNo; 			// 하위 카테고리 번호
	private String categoryLowName; 	// 하위 카테고리명
}
