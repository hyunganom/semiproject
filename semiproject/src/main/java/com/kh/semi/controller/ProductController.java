package com.kh.semi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.semi.entity.ProductDto;
import com.kh.semi.repository.ProductDao;

@Controller
@RequestMapping("/product")
public class ProductController {

	// 의존성 주입
	private ProductDao productDao;
	
	// 상품 등록 Mapping
	// 1. 상품 등록 페이지로 연결
	@GetMapping("/insert")
	public String insert() {
		
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
	
	// 3. 상품 
}
