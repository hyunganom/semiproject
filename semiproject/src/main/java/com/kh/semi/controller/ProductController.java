package com.kh.semi.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.semi.constant.SessionConstant;
import com.kh.semi.entity.AttachmentDto;
import com.kh.semi.entity.BasketDto;
import com.kh.semi.entity.ProductDto;
import com.kh.semi.repository.AttachmentDao;
import com.kh.semi.repository.BasketDao;
import com.kh.semi.repository.ProductDao;
import com.kh.semi.repository.ReviewDao;
import com.kh.semi.vo.ProductCategoryListVO;
import com.kh.semi.vo.ProductListSearchCategoryVO;
import com.kh.semi.vo.ProductListSearchVO;

@Controller
@RequestMapping("/product")
public class ProductController {

	// 의존성 주입
	@Autowired
	private ProductDao productDao;
	
	// 리뷰 의존성 주입
	@Autowired
	private ReviewDao reviewDao;
	
	//장바구니 의존성 주입
	@Autowired
	private BasketDao basketDao;
	
	//첨부파일 의존성 주입
	@Autowired
	private AttachmentDao attachmentDao;
	
	//첨부파일 업로드 경로
	private final File tumbnailDirectory = new File("D:\\saluv\\productTumbnail");
	private final File detailDirectory = new File("D:\\saluv\\productDeatail");
	
	// 상위 카테고리 생셩 Mapping
	@PostMapping("/createCategoryHigh")
	public String createCategoryHigh(@ModelAttribute ProductCategoryListVO productCategoryListVO) {
		
		// 상위 카테고리 등록을 위한 다음 시퀀스 번호 반환
		int categoryHighNo = productDao.sequencecategoryHigh();
		
		// 구독 상품인지를 판정
		if(productCategoryListVO.isCateghoryHighSub()) {
			// 구독 상품용 상위 카테고리 등록
			productDao.createCategoryHigh(categoryHighNo, productCategoryListVO.getCategoryHighName(), productCategoryListVO.getCategoryHighSub());
			return "redirect:insert";
		}
		else {
			// 일반 상품용 상위 카테고리 등록
			productDao.createCategoryHigh(categoryHighNo, productCategoryListVO.getCategoryHighName());
			return "redirect:insert";
		}
	}
	
	// *. 하위 카테고리 생성 Mapping - 상품 등록 Mapping에서 연결됨
	@PostMapping("/createCategoryLow")
	public String createCategoryLow(@ModelAttribute ProductCategoryListVO productCategoryListVO) {
		
		// 하위 카테고리 등록을 위한 다음 시퀀스 번호 반환
		int categoryLowNo = productDao.sequencecategoryLow();
		
		System.out.println(productCategoryListVO.getCategoryHighNo());
		
		// 하위 카테고리 등록
		productDao.createCategoryLow(productCategoryListVO.getCategoryHighNo(), categoryLowNo, productCategoryListVO.getCategoryLowName());
		
		// 상위 카테고리와 하위 카테고리 등록 후 상품 등록 Mapping으로 강제 이동(redirect)
		return "redirect:insert";
	}
	
	// 1. 상품 등록 Mapping
	// 1) 상품 등록 페이지로 연결
	@GetMapping("/insert")
	public String insert(Model model) {
		
		// 상위 카테고리 항목을 조회하여 Model에 첨부
		model.addAttribute("categoryHighList", productDao.selectCategoryHighList());
		
		// 상품 등록 페이지(insert.jsp) 연결
		return "product/insert";
	}
	
	// 2) 상품 등록 처리
	@PostMapping("/insert")
	public String insert(@ModelAttribute ProductDto productDto,
			@RequestParam MultipartFile attachmentMainImg, // 상품 이미지 첨부파일에 대한 List
			@RequestParam List<MultipartFile> attachmentSubImg, // 상품 상세 이미지 첨부파일에 대한 List
			RedirectAttributes attr) throws IllegalStateException, IOException {
		
		// 관리자 상품 등록(INSERT)을 위한 다음 시퀀스 번호 반환
		int productNo = productDao.nextSequence();
		
		// 반환한 시퀀스 번호를 View에서 입력받은 ProductDto의 productNo로 설정
		productDto.setProductNo(productNo);
		
		// productNo가 설정된 productDto로 DB 처리 - 관리자 상품 등록(INSERT)
		productDao.insertProduct(productDto);
		
		
		
		//첨부파일 썸네일 이미지 등록
			//1)첨부파일 시퀀스 발급
			int attachmentNo1 = attachmentDao.sequence();
			//첨부 DB등록
			attachmentDao.insert(AttachmentDto.builder()
					.attachmentNo(attachmentNo1)
					.attachmentName(attachmentMainImg.getOriginalFilename())
					.attachmentType(attachmentMainImg.getContentType())
					.attachmentSize(attachmentMainImg.getSize())
				.build());
			
			//2)파일저장
			File target1 = new File(tumbnailDirectory, String.valueOf(attachmentNo1));
			tumbnailDirectory.mkdirs();//3)폴더 생성 명령
			attachmentMainImg.transferTo(target1);
			//4)product_attachment 연결테이블 정보 저장
			attachmentDao.productConnectAttachment(productNo, attachmentNo1);
		
		//상품설명이미지 등록
		for(MultipartFile file : attachmentSubImg) {
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
			File target = new File(detailDirectory, String.valueOf(attachmentNo));
			detailDirectory.mkdirs();//폴더 생성 명령
			file.transferTo(target);
			//product_explaim 연결테이블 정보 저장
			attachmentDao.explainConnectAttachment(productNo, attachmentNo);
			}
		}
		
		// 관리자 상품 등록(INSERT) 처리 후 해당 상품 페이지로 강제 이동(redirect)
		attr.addAttribute("productNo", productNo);
		return "redirect:detail";
	}
	
	// 2. 상품 목록 Mapping (모든 상품)
	@GetMapping("/list")
	public String selectListAdmin(Model model, @ModelAttribute ProductListSearchVO productListSearchVO) {
		
		// View에서 입력받은 ProductListSearchVO를 매개변수로 조회 결과에 따른 상품의 총 수 반환
		// - 검색 조회일 경우 검색 조회의 결과에 대한 count(*)의 값 반환
		// - 전체 조회일 경우 전체 조회의 결과에 대한 count(*)의 값 반환
		int countTotalProduct = productDao.countTotalProduct(productListSearchVO);
		
		// 반환한 상품의 총 수를 다시 ProductListSearchVO의 등록된 상품의 총 수(countTotalProduct) 필드의 값으로 설정
		productListSearchVO.setCountTotalProduct(countTotalProduct);
		
		// 설정된 ProductListSearchVO로 통합 조회를 실행한 후 그 결과를 Model에 첨부
		model.addAttribute("productList", productDao.selectListProduct(productListSearchVO));
		
		// 상품 수정 페이지(list.jsp)로 연결
		return "product/list";
	}
	
	// 3. 상품 목록 Mapping (카테고리 상품)
	@GetMapping("/category")
	public String selectList(Model model, @ModelAttribute ProductListSearchCategoryVO productListSearchCategoryVO) {
		
		// View에서 입력받은 ProductListSearchVO를 매개변수로 조회 결과에 따른 상품의 총 수 반환
		// - 검색 조회일 경우 검색 조회의 결과에 대한 count(*)의 값 반환
		// - 전체 조회일 경우 전체 조회의 결과에 대한 count(*)의 값 반환
		int countTotalCategory = productDao.countAllCategory(productListSearchCategoryVO);
		
		// 반환한 상품의 총 수를 다시 ProductListSearchVO의 등록된 상품의 총 수(countTotalProduct) 필드의 값으로 설정
		productListSearchCategoryVO.setCountTotalProduct(countTotalCategory);
		
		// 설정된 ProductListSearchVO로 통합 조회를 실행한 후 그 결과를 Model에 첨부
		model.addAttribute("productList", productDao.selectListCategory(productListSearchCategoryVO));
		
		// 상품 수정 페이지(list.jsp)로 연결
		return "product/category";
	}
	
	// 2. 상품 상세 Mapping
	// 1) 상품 상세페이지로 이동
	@GetMapping("/detail")
	public String detail(Model model, @RequestParam int productNo, @RequestParam boolean categoryHighSub) {
		
		// 하이퍼링크로 받은 productNo로 상세 조회 실행 후 그 결과를 Model에 첨부
		model.addAttribute("productDto", productDao.selectOneProduct(productNo));
		
		//상품썸네일 이미지 뷰테이블 조회
		model.addAttribute("productTumbnailList",attachmentDao.selectProductAttachmentList(productNo));
		
		//상품썸네일 이미지 뷰테이블 조회
		model.addAttribute("productDetailList",attachmentDao.selectProductExplainList(productNo));
		
		// 모든 상품 번호와 이름을 조회하고 첨부
		model.addAttribute("productNoNameList", productDao.selectNoName());
		
		// 해당 상품에 달린 모든 리뷰 조회
		model.addAttribute("productReviewList", reviewDao.selectProductAllReview(productNo));
		
		if(categoryHighSub) {
			// 상품 상세 페이지(detail.jsp)로 연결
			return "product/detailSub";
		}
		else {
			// 상품 상세 페이지(detail.jsp)로 연결
			return "product/detail";
		}
	}

	//2) 장바구니로 이동
	   @PostMapping("/detail")
	   public String detail(@ModelAttribute BasketDto basketDto,
	         @RequestParam int productNo,
	         @RequestParam int productCount,
	         HttpServletRequest request, HttpSession session) {
	      // 세션아이디 꺼내와서 세팅
	      String memberId = (String)session.getAttribute(SessionConstant.ID);
	      basketDto.setBasketId(memberId);
	      //상품번호 세팅
	      basketDto.setBasketProductNo(productNo);
	      //상품 수량 세팅
	      basketDto.setBasketCountNumber(productCount);
	      //장바구니 번호 세팅
	      int basketNo = basketDao.sequence();
	      basketDto.setBasketNo(basketNo);
	      // 바로구매 시 사용할 장바구니 번호 세션에 저장
	      session.setAttribute("basketNo", basketNo);
	      // 파라미터 옵션항목값 배열로 가져오기(옵션값)
	      String[] arrayParam = request.getParameterValues("productOption");
	      //동일한 상품이 있는지 확인 후 없으면 등록, 있으면 수량 증가
	      if(basketDao.sameItem(memberId, productNo)==null) {
	         if(arrayParam==null) { //단일상품 및 옵션없음
	            basketDto.setBasketProductOption(""); //옵션에 빈값넣기
	            
	         }else { //구독상품 및 옵션있음
	            // 상품번호로 상품명 조회 후 가져오기(상품명만 나오게 toString 재정의)
	            String option = "";
	            for(int i=0; i<arrayParam.length; i++) {
	               int no = Integer.parseInt(arrayParam[i]);
	               option = option+productDao.selectName(no)+" / ";
	            }
	            //마지막 / 구분자 문자열 자르기
	            option= option.substring(0, option.length()-2);
	            //장바구니 옵션 컬럼에 들어갈 데이터 세팅
	            basketDto.setBasketProductOption(option);
	         }
	         // 등록
	         basketDao.insert(basketDto);
	      }else {
	         // 수량 수정
	         basketDao.changeCount(basketDto);
	      }
	      return "redirect:/basket/list";
	   }
	
	
	// 3. 상품 수정 Mapping
	// 1) 상품 수정 페이지로 연결
	@GetMapping("/edit")
	public String edit(Model model, @RequestParam int productNo) {
		
		// 하이퍼링크로 받은 productNo로 상세 조회 실행
		ProductDto productDto = productDao.selectOneProduct(productNo);
//		만약 해당 productNo의 상세 조회 결과가 없는 경우
//		if(productDto == null) {
//			//예외 발생
//		}
		
		// 상세 조회 실행 후 그 결과를 Model에 첨부
		model.addAttribute("productDto", productDto);
		
		// 상품 수정 페이지(edit.jsp)로 연결
		return "product/edit";		
	}
	
	// 2) 상품 수정 DB 처리
	@PostMapping("/edit")
	public String edit(@ModelAttribute ProductDto productDto, RedirectAttributes attr) {
		 
		// View에서 입력받은 productDto로 DB 처리 - 관리자 상품 수정(UPDATE)
		// 상품 정보 수정 처리가 되었는지 판정
		boolean isUpdated = productDao.updateProduct(productDto);
		if(isUpdated) { // 상품 정보가 수정되었다면
			// 상품의 상품 정보 수정 시간 갱신
			productDao.updateProductRegistTime(productDto.getProductNo());
			
			// 수정한 상품의 상품 상세 Mapping으로 강제 이동(redirect)
			// - View에서 입력받은 productDto에는 hidden으로 설정했던 productNo가 포함되어 있다
			attr.addAttribute("productNo", productDto.getProductNo());
			return "redirect:detail";
		}
		else {
			// 상품 수정 Mapping으로 강제 이동(임시)
			return "redirect:edit";
		}
	}
	
	// 3. 상품 삭제(비활성화) Mapping
	@GetMapping("/delete")
	public String delete(@RequestParam int productNo) {
		
		// 하이퍼링크로 받은 productNo로 상세 조회 실행
		ProductDto productDto = productDao.selectOneProduct(productNo);
		
		// 상세 조회한 ProductDto의 현재 상품 비활성화 상태의 반대값으로 상품 비활성화 상태 수정(UPDATE)
		productDao.inactiveProduct(productNo, !productDto.isProductInactive());
		
		// 상품 목록 Mapping으로 강제 이동(redirect)
		return "redirect:list";
	}
	
	// 4. 상품 삭제(DELETE) Mapping (임시)
	@GetMapping("/deleteAdmin")
	public String deleteAdmin(@RequestParam int productNo) {
		
		// 하이퍼링크로 받은 productNo로 상품 삭제(DELETE) 실행
		productDao.deleteProduct(productNo);
		
		// 상품 삭제 후 상품 목록 Mapping으로 강제 이동(redirect)
		return "redirect:list";
	}
}