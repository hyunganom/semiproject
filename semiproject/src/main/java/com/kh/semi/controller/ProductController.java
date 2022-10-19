package com.kh.semi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.semi.entity.ProductDto;
import com.kh.semi.repository.ProductDao;
import com.kh.semi.vo.ProductListSearchVO;

@Controller
@RequestMapping("/product")
public class ProductController {

	// 의존성 주입
	@Autowired
	private ProductDao productDao;
	
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
	public String insert(@ModelAttribute ProductDto productDto, RedirectAttributes attr) {
		
		// 관리자 상품 등록(INSERT)을 위한 다음 시퀀스 번호 반환
		int productNo = productDao.nextSequence();
		
		// View에서 입력받은 productDto로 DB 처리 - 관리자 상품 등록(INSERT)
		productDao.insertProduct(productDto);
		
		// 관리자 상품 등록(INSERT) 처리 후 해당 상품 페이지로 강제 이동(redirect)
		attr.addAttribute("productNo", productNo);
		return "redirect:product/detail";
	}
	
	// 3. 상품 목록 Mapping
	@GetMapping("/list")
	public String selectList(Model model, @ModelAttribute ProductListSearchVO productListSearchVO) {
		
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
}
