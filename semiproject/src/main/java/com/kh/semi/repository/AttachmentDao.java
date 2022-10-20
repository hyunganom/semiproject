package com.kh.semi.repository;

import java.util.List;

import com.kh.semi.entity.AttachmentDto;

//첨부파일 DAO
public interface AttachmentDao {
	//시퀀스 발급
	int sequence();
	//첨부파일 등록
	void insert(AttachmentDto attachmentDto); 
	// 첨부파일 리스트 조회
	List<AttachmentDto> selectList(); 
	//첨부파일 하나만
	AttachmentDto selectOne(int attachmentNo); 
	// 첨부파일 삭제
	boolean delete(int attachmentNo); 
	//첨부파일 관련 기능
	void productConnectAttachment(int productNo, int attachmentNo);
	//상품 첨부파일 관련(product_attachment_view)
	List<AttachmentDto> selectProductAttachmentList(int productOriginNo);
}
