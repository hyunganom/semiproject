package com.kh.semi.entity;

import java.sql.Date;

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
public class InquireDto {

	// 필드
	private int inquireNo;	// 문의글 번호
	private String inquireId;	// 문의글 작성자
	private String inquireTitle;	// 문의글 제목
	private String inquireContent;	// 문의글 내용
	private Date inquireWritetime;	// 문의글 작성일
	private Date inquireUpdatetime; // 문의글 수정일
}
