package com.kh.semi.repository;

import java.util.List;

import com.kh.semi.entity.NoticeDto;

public interface NoticeDao {
	//공지 게시판
	
	//1. 공지 등록
	void insert(NoticeDto noticeDto);
	
	//2. 공지 수정
	boolean update(NoticeDto noticeDto);
	
	//3. 공지 조회(공지 제목, 내용으로 조회)
	List<NoticeDto> selectList();
	List<NoticeDto> selectList(String noticeTitle, String noticeContent);
	
	//4. 공지 삭제(공지글 번호로 삭제)
	boolean delete(int NoticeNo);

}
