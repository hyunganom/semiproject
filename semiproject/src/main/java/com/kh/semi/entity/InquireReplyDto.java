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
@ToString
@Builder
public class InquireReplyDto {
	private int inqurerReplyNo;
	private String inqurerReplyId;
	private int inqurerOriginNo;
	private Date inqurerReplyWritedate;
	private Date inqurerReplyUpdatedate;
	private String inqurerReplyContent;
	
}
