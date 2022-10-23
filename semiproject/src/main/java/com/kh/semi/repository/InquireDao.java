package com.kh.semi.repository;

import java.util.List;

import com.kh.semi.entity.InquireDto;

public interface InquireDao {

	// 추상 메소드 - 문의글 등록을 위한 다음 시퀀스 번호 반환
	int nextSequence();
	
	// 추상 메소드 - 문의글 등록(INSERT)
	void writeInquire(InquireDto inquireDto);
	
	// 추상 메소드 - 문의글 조회(SELECT)
	List<InquireDto> selectInquire();
	
	// 추상 메소드 - 문의글 조회(SELECT) - 회원용
	List<InquireDto> selectInquire(String inquireId);
	
	// 추상 메소드 - 문의글 상세(DETAIL)
	InquireDto selectOneInquire(int inquireNo);
	
	// 추상 메소드 - 문의글 수정(UPDATE)
	boolean updateInquire(InquireDto inquireDto);
	
	// 추상 메소드 - 문의글 삭제(DELETE)
	boolean deleteInquire(int inquireNo);
	
	// 추상 메소드 - 문의글 삭제(UPDATE)
	boolean inactiveInquire(int inquireNo);
}
