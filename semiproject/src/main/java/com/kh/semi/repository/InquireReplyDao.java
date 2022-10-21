package com.kh.semi.repository;

import java.util.List;

import com.kh.semi.entity.InquireReplyDto;

public interface InquireReplyDao {
	void replyWrite(InquireReplyDto inquireReplyDto);
	List<InquireReplyDto> selectList(int inquireNo);
}
	