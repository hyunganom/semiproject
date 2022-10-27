package com.kh.semi.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.semi.entity.AttachmentDto;
import com.kh.semi.entity.ReviewDto;
import com.kh.semi.repository.AttachmentDao;
import com.kh.semi.repository.ReviewDao;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	// 의존성 주입
	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	private final File reviewImg = new File("D:\\saluv\\reviewImg");
	
	// 1. 리뷰 작성
	// - 리뷰 작성 Mapping
	@GetMapping("/write")
	public String write() {
		
		// 리뷰 작성 페이지(wrtie.jsp)로 이동
		return  "review/write";
	}
	
	// - DB 처리 및 강제 이동
	@PostMapping("/write")
	public String write(@ModelAttribute ReviewDto reviewDto,
			@RequestParam List<MultipartFile> attachmentReviewImg//리뷰이미지 첨부파일에 관한 파라미터
			) throws IllegalStateException, IOException {
		
		// 리뷰 등록을 위해 다음 시퀀스 번호 반환
		int reviewNo = reviewDao.nextSequence();
		
		// 반환한 시퀀스 번호를 reviewDto의 reviewNo로 설정
		reviewDto.setReviewNo(reviewNo);
		
		// DB에 등록(INSERT) 처리
		reviewDao.writeReview(reviewDto);
		
		//리뷰 첨부파일 이미지 등록처리
		//1. 시퀀스 발급
		for(MultipartFile file : attachmentReviewImg) {
			if(!file.isEmpty()) {
			//첨부파일 시퀀스 발급
			int attachmentNo = attachmentDao.sequence();
			//첨부 DB등록
			attachmentDao.insert(AttachmentDto.builder()
					.attachmentNo(attachmentNo)
					.attachmentName(file.getOriginalFilename())
					.attachmentType(file.getContentType())
					.attachmentSize(file.getSize())
				.build());
			
			//파일저장
			File target = new File(reviewImg, String.valueOf(attachmentNo));
			reviewImg.mkdirs();//폴더 생성 명령
			file.transferTo(target);//해당폴더에 변환과정을 거쳐서 파일등록
			//review_attachment 연결테이블 정보 저장
			attachmentDao.reviewConnectAttachment(reviewNo, attachmentNo);
			}
		}
		
		return "redirect:/";
	}
	
	// 2. 리뷰 
}
