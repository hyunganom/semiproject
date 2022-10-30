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

	//첨부파일
	@Autowired
	private AttachmentDao attachmentDao;
	
	//리뷰 첨부파일 업로드 경로
	private final File reviewImg = new File("D:\\saluv\\reviewImg");
	
	// 1. 리뷰 작성
	// - 리뷰 작성 Mapping
	@GetMapping("/write")
	public String write(Model model, @ModelAttribute ReviewPaymentNoVO reviewPaymentNoVO) {
		
		// 전달받은 reviewPaymentNoVO로 단일 조회 실행 후 그 결과를 model에 첨부
		model.addAttribute("productDto", productDao.selectOneProductUser(reviewPaymentNoVO.getPaymentProductNo()));
		
		// 전달받은 reviewPaymentNoVO를 model에 첨부
		model.addAttribute("reviewPaymentNoVO", reviewPaymentNoVO);
		
		// 리뷰 작성 페이지(wrtie.jsp)로 이동
		return  "review/write";
	}
	
	// - DB 처리 및 강제 이동
	@PostMapping("/write")
	public String write(HttpSession session, @ModelAttribute ReviewDto reviewDto, 
			@ModelAttribute ReviewPaymentNoVO reviewPaymentNoVO,
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
		
		// 리뷰 작성 jsp에서 받아온 reviewPaymentNoVO의 paymentNo를 리뷰의 결제 번호(reviewPaymentNo)로 설정
		reviewDto.setReviewPaymentNo(reviewPaymentNoVO.getPaymentNo());
		
		// 리뷰 작성 전 리뷰의 총 갯수 반환
		int beforeCount = reviewDao.countBeforeWrite(reviewPaymentNoVO.getPaymentProductNo());
				
		// 현재 해당 상품의 리뷰 갯수가 0인지에 따라 다른 처리릃 하도록 구현 (0 나누기 0을 하면 에러가 발생하기 때문)
		if(beforeCount == 0) {
			
			// 작성자가 입력한 리뷰 점수 반환
			int scoreNow = reviewDto.getReviewGood();
			
			// 1)과 2)를 사용하여 새로 평균낸 리뷰 평점 구하기
			double insertScore = (scoreNow * 10) / 10.0;
			
			// 새로 평균낸 리뷰 평점을 해당 상품의 리뷰 평점으로 수정
			reviewDao.updateProductGood(insertScore, reviewPaymentNoVO.getPaymentProductNo());
			
			// DB에 등록(INSERT) 처리
			reviewDao.writeReview(reviewDto);
		}
		else {
			
			// 리뷰 등록 전 리뷰 총점 반환
			int scroeBefore = reviewDao.scoreBeforeWrite(reviewPaymentNoVO.getPaymentProductNo());
			
			// 작성자가 입력한 리뷰 점수 반환
			int scoreNow = reviewDto.getReviewGood();
			
			// 1) 기존의 리뷰 총점과 작성자가 입력한 리뷰 점수의 합을 double로 형 변환
			int scoreSum = scroeBefore + scoreNow;
			
			// 리뷰 등록 전 리뷰의 총 갯수 반환
			int countBefore = reviewDao.countBeforeWrite(reviewPaymentNoVO.getPaymentProductNo());
			
			// 2) 작성자가 등록하면서 리뷰의 수가 1만큼 증가하므로 이 때의 총 리뷰 수 반환
			int countSum = countBefore + 1;
			
			// 1)과 2)를 사용하여 새로 평균낸 리뷰 평점 구하기
			double insertScore = (scoreSum * 10) / countSum / 10.0;
			
			// 새로 평균낸 리뷰 평점을 해당 상품의 리뷰 평점으로 수정
			reviewDao.updateProductGood(insertScore, reviewPaymentNoVO.getPaymentProductNo());
			
			// 리뷰를 DB에 등록(INSERT) 처리
			reviewDao.writeReview(reviewDto);
		}
		
		// 리뷰 등록 후 결제 테이블(payment)의 리뷰 등록 여부(payment_review)를 'Y'로 수정
		reviewDao.updatePaymentReview(reviewPaymentNoVO.getPaymentNo());
		
		//리뷰 첨부파일 이미지 등록처리
		//1. 시퀀스 발급
			//첨부파일 시퀀스 발급
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
			file.transferTo(target);
			//reviewConnectAttachment 연결테이블 정보 저장
			attachmentDao.reviewConnectAttachment(reviewNo, attachmentNo);
			}
		}
		
		return "redirect:/mypage/order_list";
	}
	
	// 2. 리뷰 수정
	// 1) 리뷰 수정 페이지로 연결
	@GetMapping ("/edit")
	public String reviewEdit(Model model, @ModelAttribute ReviewPaymentNoVO reviewPaymentNoVO) {
		
		// 리뷰 번호 존재 여부 판정
		// - 마이페이지의 결제 내역 jsp에서 연결된 것이라면 리뷰 번호는 없으며 결제 번호와 상품 번호 존재
		if(reviewPaymentNoVO.getReviewNo() != null) { // 리뷰 번호(reviewNo)가 존재한다면 (마이페이지의 상품 후기 jsp에서 연결된 경우라면)
		
			// 리뷰 번호(reviewNo)로 단일 조회 실행 후 그 결과를 Model에 첨부
			model.addAttribute("reviewVO", reviewDao.selectOneReview(reviewPaymentNoVO.getReviewNo()));
		}
		
		else { // 리뷰 번호(reviewNo)가 존재하지 않는다면 (마이 페이지의 결제 내역 jsp에서 연결된 경우라면)
			
			// 결제 번호(paymentNo)로 단일 조회 실행 후 그 결과를 Model에 첨부
			model.addAttribute("reviewVO", reviewDao.selectOneReviewMyPage(reviewPaymentNoVO.getPaymentNo()));
		}
		// 리뷰 수정 jsp로 연결
		return "review/edit";
	}
	
	// 2) 리뷰 수정 jsp에서 받은 값으로 DB 수정
	@PostMapping("/edit")
	public String reviewEdit(@ModelAttribute ReviewDto reviewDto) {
		reviewDao.updateReview(reviewDto);
		return "redirect:/mypage/review_list";
	}
	
	@GetMapping("/delete")
	public String reviewDelete(@RequestParam int reviewNo) {
		reviewDao.delete(reviewNo);
		return "redirect:/mypage/review_list";
	}
	
	// ** 특정 상품에 대해 작성된 전체 리뷰 목록은 ProductController를 통해 표시
	
	// ** 로그인 한 회원이 작성한 전체 리뷰 목록은 MypageController를 통해 표시 
	
}
