package com.kh.semi.repository;

import java.util.List;

import com.kh.semi.entity.InquireDto;
import com.kh.semi.entity.NoticeDto;
import com.kh.semi.vo.InquireListSearchVO;
import com.kh.semi.vo.NoticeListSearchVO;

public interface NoticeDao {
	//공지 게시판
	
	//추상 메소드 - 공지글 등록(INSERT)
	void write(NoticeDto noticeDto);
	
	// 추상 메소드 - 공지 등록을 위한 시퀀스 번호 반환
	int noticeSequence();
	
	//추상 메소드 - 공지글 수정(UPDATE)
	boolean update(NoticeDto noticeDto);
	
	//****** 공지 조회(공지 제목, 내용으로 조회) **** 수정예정
	List<NoticeDto> selectList(String noticeTitle, String noticeContent);
	
	// 추상 메소드 - 문의글 통합 조회(SELECT) 관리자용
	// - 통합 조회
	List<NoticeDto> selectListNotice(NoticeListSearchVO noticeListSearchVO);
	
	// - 검색 조회
	List<NoticeDto> searchListNotice(NoticeListSearchVO noticeListSearchVO);
	
	// - 전체 조회
	List<NoticeDto> allListNotice();
	
	// 추상 메소드 - 공지글 상세(DETAIL)
	NoticeDto selectOne(int noticeNo);
	
	// 추상 메소드 오버라이딩 - 공지글 삭제(DELETE)
	boolean delete(int NoticeNo);
	
	// 추상 메소드  - 공지글 조회수 증가(UPDATE)
	NoticeDto read(int NoticeNo);	
	boolean updateReadcount(int noticeNo);	
	
	// 추상 메소드  - 공지글 첨부파일 관련()
	void noticeAttachment(int NoticeNo, int attachmentNo);

}
