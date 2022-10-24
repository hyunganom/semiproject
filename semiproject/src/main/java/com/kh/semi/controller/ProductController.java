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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.semi.constant.SessionConstant;
import com.kh.semi.entity.AttachmentDto;
import com.kh.semi.entity.BasketDto;
import com.kh.semi.entity.ProductDto;
import com.kh.semi.repository.AttachmentDao;
import com.kh.semi.repository.BasketDao;
import com.kh.semi.repository.ProductDao;
import com.kh.semi.vo.ProductListSearchVO;

@Controller
@RequestMapping("/product")
public class ProductController {

	// 의존성 주입
	@Autowired
	private ProductDao productDao;
	
	//장바구니 의존성 주입
	@Autowired
	private BasketDao basketDao;
	
	//첨부파일 의존성 주입
	@Autowired
	private AttachmentDao attachmentDao;
	
	//첨부파일 업로드 경로
	private final File tumbnailDirectory = new File("D:\\saluv\\productTumbnail");
	private final File detailDirectory = new File("D:\\saluv\\productDeatail");
	
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
			@RequestParam List<MultipartFile> attachmentMainImg, // 상품 이미지 첨부파일에 대한 List
			@RequestParam List<MultipartFile> attachmentSubImg, // 상품 상세 이미지 첨부파일에 대한 List
			RedirectAttributes attr) throws IllegalStateException, IOException {
		
		// 관리자 상품 등록(INSERT)을 위한 다음 시퀀스 번호 반환
		int productNo = productDao.nextSequence();
		
		// 반환한 시퀀스 번호를 View에서 입력받은 ProductDto의 productNo로 설정
		productDto.setProductNo(productNo);
		
		// productNo가 설정된 productDto로 DB 처리 - 관리자 상품 등록(INSERT)
		productDao.insertProduct(productDto);
		
		
		
		//첨부파일 썸네일 이미지 등록
		for(MultipartFile file : attachmentMainImg) {
			if(!file.isEmpty()) {
			//1)첨부파일 시퀀스 발급
			int attachmentNo = attachmentDao.sequence();
			//첨부 DB등록
			attachmentDao.insert(AttachmentDto.builder()
					.attachmentNo(attachmentNo)
					.attachmentName(file.getOriginalFilename())
					.attachmentType(file.getContentType())
					.attachmentSize(file.getSize())
				.build());
			
			//2)파일저장
			File target = new File(tumbnailDirectory, String.valueOf(attachmentNo));
			tumbnailDirectory.mkdirs();//3)폴더 생성 명령
			file.transferTo(target);
			//4)product_attachment 연결테이블 정보 저장
			attachmentDao.productConnectAttachment(productNo, attachmentNo);
			}
		}
		
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
	
	// 3) 상품 목록 Mapping
	@GetMapping("/list")
	public String selectList(Model model, @ModelAttribute ProductListSearchVO productListSearchVO) {
		
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
	
	
	// 2. 상품 상세 Mapping
	// 1) 상품 상세페이지로 이동
	@GetMapping("/detail")
	public String detail(Model model, @RequestParam int productNo) {
		
		// 하이퍼링크로 받은 productNo로 상세 조회 실행 후 그 결과를 Model에 첨부
		model.addAttribute("productDto", productDao.selectOneProduct(productNo));
		
		//상품썸네일 이미지 뷰테이블 조회
		model.addAttribute("productTumbnailList",attachmentDao.selectProductAttachmentList(productNo));
		
		//상품썸네일 이미지 뷰테이블 조회
		model.addAttribute("productDetailList",attachmentDao.selectProductExplainList(productNo));
		
		// 상품 상세 페이지(detail.jsp)로 연결
		return "product/detail";
	}
	
	//2) 장바구니로 이동
	@PostMapping("/detail")
	public String detail(@ModelAttribute BasketDto basketDto,
			HttpSession session) {
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		basketDto.setBasketId(memberId);
		basketDto.setBasketProductOption(""); //옵션에 빈값넣기
		basketDao.insert(basketDto);
		return "redirect:/order/basket";
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