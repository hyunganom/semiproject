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
	private int inqurer_reply_no;
	private String inqurer_reply_id;
	private int inqurer_origin_no;
	private Date inqurer_reply_writedate;
	private Date inqurer_reply_updatedate;
	private String inqurer_reply_content;
	
}
