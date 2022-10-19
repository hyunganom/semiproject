package com.kh.semi.repository;

import java.util.List;

import com.kh.semi.entity.AttachmentDto;

//첨부파일 DAO
public interface AttachmentDao {
	int sequence(); //시퀀스 발급
	void insert(AttachmentDto attachmentDto); //첨부파일 등록
	List<AttachmentDto> selectList(); // 첨부파일 리스트 조회
	AttachmentDto selectOne(int attachmentNo); //첨부파일 하나만
	boolean delete(int attachmentNo); // 첨부파일 삭제
	
	
	//2022-10-19 sql 뷰생성 권한안줘서 생성불가 일단
	//상품 첨부파일 관련(product_attachment_view)
//	List<AttachmentDto> selectProductAttachmentList(int productNo);
}
