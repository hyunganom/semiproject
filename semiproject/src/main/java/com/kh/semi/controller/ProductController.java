package com.kh.semi.controller;

import java.io.File;
import java.io.IOException;

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

import com.kh.semi.entity.AttachmentDto;
import com.kh.semi.entity.ProductDto;
import com.kh.semi.repository.AttachmentDao;
import com.kh.semi.repository.ProductDao;
import com.kh.semi.vo.ProductListSearchVO;

@Controller
@RequestMapping("/product")
public class ProductController {

	// 의존성 주입
	@Autowired
	private ProductDao productDao;
	
	//첨부파일 의존성 주입
	@Autowired
	private AttachmentDao attachmentDao;
	
	//첨부파일 업로드 다운로드 경로
	private final File directory = new File("D:\\test");
	
	// 상품 등록 Mapping
	// 1. 상품 등록 페이지로 연결
	@GetMapping("/insert")
	public String insert(Model model) {
		
		// 모든 상품 카테고리 항목 조회 결과를 Model에 첨부 (아직 해결하지 못한 문제)
//		model.addAttribute("categoryList", productDao.selectCategoryList());
		
		// 상품 등록 페이지(insert.jsp) 연결
		return "product/insert";
	}
	
	// 2. 상품 등록 처리
	@PostMapping("/insert")
	public String insert(@ModelAttribute ProductDto productDto,
			MultipartFile attachment,
			RedirectAttributes attr) throws IllegalStateException, IOException {
		
		// 관리자 상품 등록(INSERT)을 위한 다음 시퀀스 번호 반환
		int productNo = productDao.nextSequence();
		// View에서 입력받은 productDto로 DB 처리 - 관리자 상품 등록(INSERT)
		productDao.insertProduct(productDto);
		
		
		//첨부파일 DB연결
		//첨부파일 시퀀스 발급
		
		//DB등록
		attachmentDao.insert(AttachmentDto.builder()
				.attachmentNo(productNo+1)
				.attachmentName(attachment.getOriginalFilename())
				.attachmentType(attachment.getContentType())
				.attachmentSize(attachment.getSize())
			.build());
		
		//파일저장
		File target = new File(directory, String.valueOf(productNo+1));
		System.out.println(target.getAbsolutePath());
		attachment.transferTo(target);
		//product_attachment 연결테이블 정보 저장
		attachmentDao.productConnectAttachment(productNo+1, productNo+1);
		
		
		// 관리자 상품 등록(INSERT) 처리 후 해당 상품 페이지로 강제 이동(redirect)
		attr.addAttribute("productNo", productNo);
				
		return "redirect:product/detail";
	}
	
	// 3. 상품 목록 Mapping
	@GetMapping("/list")
	public String selectList(Model model, @ModelAttribute ProductListSearchVO productListSearchVO
			) {
		
		// 검색 조회인지 전체 조회인지 판정 - 검색 조회이면 true, 전체 조회이면 false를 반환
		if(productListSearchVO.isSearch()) { // 검색 조회라면
			// ProductListSearchVO의 type과 keyword를 매개변수로 검색 조회 실행 결과를 model에 첨부
			model.addAttribute("productList", productDao.searchListProduct(productListSearchVO.getType(), productListSearchVO.getKeyword()));
		}
		else { // 검색 조회가 아니라면(전체 조회라면)
			// 전체 조회 실행 결과를 model에 첨부
			model.addAttribute("productList", productDao.allListProduct());
		}
		return "product/list";
	}
	
	
	// 상품 상세 Mapping
	@GetMapping("/detail")
	public String detail(Model model, @RequestParam int productNo) {
		
		// 하이퍼링크로 받은 productNo로 상세 조회 실행 후 그 결과를 Model에 첨부
		model.addAttribute("productDto", productDao.selectOneProduct(productNo));
		
		// 상품 상세 페이지(detail.jsp)로 연결
		return "product/detail";
	}
	
	// 상품 수정 Mapping
	// 1. 상품 수정 페이지로 연결
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
	
	// 2. 상품 수정 DB 처리
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
			// 상품 수정 페이지로 강제 이동(임시)
			return "redirect:edit";
		}
	}
}
