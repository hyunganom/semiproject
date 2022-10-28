package com.kh.semi.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.semi.entity.AttachmentDto;
import com.kh.semi.entity.ReviewDto;
import com.kh.semi.repository.AttachmentDao;
import com.kh.semi.repository.ProductDao;
import com.kh.semi.repository.ReviewDao;
import com.kh.semi.vo.ReviewPaymentNoVO;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	// 의존성 주입
	@Autowired
	private ReviewDao reviewDao;

	// 의존성 주입
	@Autowired
	private ProductDao productDao;

	@Autowired
	private AttachmentDao attachmentDao;
	
	private final File reviewImg = new File("D:\\saluv\\reviewImg");
	
	// 1. 리뷰 작성
	// - 리뷰 작성 Mapping
	@GetMapping("/write")
	public String write(Model model, @ModelAttribute ReviewPaymentNoVO reviewPaymentNoVO) {
		
		// 전달받은 reviewPaymentNoVO로 단일 조회 실행 후 그 결과를 model에 첨부
		model.addAttribute("productDto", productDao.selectOneProductUser(reviewPaymentNoVO.getPaymentProductNo()));
		
		// 전달받은 reviewPaymentNoVO를 model에 첨부
		model.addAttribute("reviewPaymentNo", reviewPaymentNoVO.getPaymentNo());
		
		// 리뷰 작성 페이지(wrtie.jsp)로 이동
		return  "review/write";
	}
	
	// - DB 처리 및 강제 이동
	@PostMapping("/write")
	public String write(HttpSession session, @ModelAttribute ReviewDto reviewDto, @RequestParam int productNo,
			@RequestParam List<MultipartFile> attachmentReviewImg//리뷰이미지 첨부파일에 관한 파라미터
			) throws IllegalStateException, IOException {
		
		// 리뷰 등록을 위해 로그인 중인 아이디 반환
		String reviewId = (String) session.getAttribute("loginId");
		
		// 반환한 아이디를 리뷰 작성자로 설정
		reviewDto.setReviewId(reviewId);
		
		// 리뷰 등록을 위해 다음 시퀀스 번호 반환
		int reviewNo = reviewDao.nextSequence();
		
		// 반환한 시퀀스 번호를 리뷰 번호로 설정
		reviewDto.setReviewNo(reviewNo);
		
		// 리뷰 작성 전 리뷰의 총 갯수 반환
		int beforeCount = reviewDao.countBeforeWrite(productNo);
				
		// 현재 해당 상품의 리뷰 갯수가 0인지에 따라 다른 처리릃 하도록 구현 (0 나누기 0을 하면 에러가 발생하기 때문)
		if(beforeCount == 0) {
			
			// DB에 등록(INSERT) 처리
			reviewDao.writeReview(reviewDto);
		}
		else {
			
			// 리뷰 등록 전 리뷰 총점 반환
			int scroeBefore = reviewDao.scoreBeforeWrite(productNo);
			
			// 작성자가 입력한 리뷰 점수 반환
			int scoreNow = reviewDto.getReviewGood();
			
			// 1) 기존의 리뷰 총점과 작성자가 입력한 리뷰 점수의 합을 double로 형 변환
			int scoreSum = scroeBefore + scoreNow;
			
			// 리뷰 등록 전 리뷰의 총 갯수 반환
			int countBefore = reviewDao.countBeforeWrite(productNo);
			
			// 2) 작성자가 등록하면서 리뷰의 수가 1만큼 증가하므로 이 때의 총 리뷰 수 반환
			int countSum = countBefore + 1;
			
			// 1)과 2)를 사용하여 새로 평균낸 리뷰 평점 구하기
			double insertScore = (scoreSum * 10) / countSum / 10.0;
			
			// 새로 평균낸 리뷰 평점을 해당 상품의 리뷰 평점으로 수정
			reviewDao.updateProductGood(insertScore, productNo);
			
			// 리뷰를 DB에 등록(INSERT) 처리
			reviewDao.writeReview(reviewDto);
		}
		
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