package com.kh.semi.controller;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.semi.entity.AttachmentDto;
import com.kh.semi.repository.AttachmentDao;

@RequestMapping("/attachment")
@RestController
public class AttachmentController {
	
	
	@Autowired
	AttachmentDao attachmentDao;
	
	//상품썸네일 이미지 다운로드 주소
	@GetMapping("/download/productTumbnail")
	public ResponseEntity<ByteArrayResource> productDowuload(
			@RequestParam int attachmentNo) throws IOException{
		//[1] 파일탐색(DB)
		AttachmentDto dto = attachmentDao.selectOne(attachmentNo);
		if(dto==null) {//파일이 없으면
			return ResponseEntity.notFound().build();//404 error 전송
		}
		//[2]파일 불러오기
		File directory = new File("D:\\saluv\\productTumbnail");
		File target = new File(directory, String.valueOf(attachmentNo));
		directory.mkdir();//폴더 생성 명령
		byte[] data = FileUtils.readFileToByteArray(target);
		ByteArrayResource resource = new ByteArrayResource(data);
		
		//[3]응답 객체를 만들어 데이터 전송
		return ResponseEntity.ok()
//				.header("Content-Encoding","UTF-8")
				.header(HttpHeaders.CONTENT_ENCODING, 
						StandardCharsets.UTF_8.name())
//				.header("Content-Length",String.valueOf(dto.getAttachmentSize()))
				.contentLength(dto.getAttachmentSize())
//				.header("Content-Disposition", "attachment; filename="+dto.getAttachmentName())
				.header(HttpHeaders.CONTENT_DISPOSITION,
						ContentDisposition.attachment().
						filename(
						dto.getAttachmentName(),
						StandardCharsets.UTF_8)
						.build().toString())
//				.header("Content-Type", dto.getAttachmentType())
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(resource);
	}
	//상품 상세이미지 다운로드 주소
	@GetMapping("/download/productDetail")
	public ResponseEntity<ByteArrayResource> productDetailDowuload(
			@RequestParam int attachmentNo) throws IOException{
		//[1] 파일탐색(DB)
		AttachmentDto dto = attachmentDao.selectOne(attachmentNo);
		if(dto==null) {//파일이 없으면
			return ResponseEntity.notFound().build();//404 error 전송
		}
		//[2]파일 불러오기
		File directory = new File("D:\\saluv\\productDeatail");
		File target = new File(directory, String.valueOf(attachmentNo));
		directory.mkdir();//폴더 생성 명령
		byte[] data = FileUtils.readFileToByteArray(target);
		ByteArrayResource resource = new ByteArrayResource(data);
		
		//[3]응답 객체를 만들어 데이터 전송
		return ResponseEntity.ok()
//				.header("Content-Encoding","UTF-8")
				.header(HttpHeaders.CONTENT_ENCODING, 
						StandardCharsets.UTF_8.name())
//				.header("Content-Length",String.valueOf(dto.getAttachmentSize()))
				.contentLength(dto.getAttachmentSize())
//				.header("Content-Disposition", "attachment; filename="+dto.getAttachmentName())
				.header(HttpHeaders.CONTENT_DISPOSITION,
						ContentDisposition.attachment().
						filename(
						dto.getAttachmentName(),
						StandardCharsets.UTF_8)
						.build().toString())
//				.header("Content-Type", dto.getAttachmentType())
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(resource);
	}
}
