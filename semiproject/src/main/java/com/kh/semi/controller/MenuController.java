package com.kh.semi.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.semi.entity.BasketDto;
import com.kh.semi.repository.BasketDao;
import com.kh.semi.repository.ProductDao;

@Controller
public class MenuController {
	
	@Autowired
	private BasketDao basketDao;
	@Autowired
	private ProductDao productDao;
	
	@GetMapping("/subscription")
	public String subs() {
		return "subscription/list";
	}
	
	@GetMapping("/subscription/detail")
	public String detail() {
		return "subscription/detail";
	}
	
	@PostMapping("/subscription/detail")
	public String detail(HttpServletRequest request, 
			@ModelAttribute BasketDto basketDto) {
		
		// 파라미터 옵션항목값 배열로 가져오기
		String[] arrayParam = request.getParameterValues("basketProductOption");
		
		// 상품번호로 상품명 조회 후 가져오기(상품명만 나오게 toString 재정의)
		String option = "";
		for(int i=0; i<arrayParam.length; i++) {
			int productNo = Integer.parseInt(arrayParam[i]);
			option = option+productDao.selectName(productNo)+" / ";
		}
		
		//장바구니에 있는 상품이면 개수 증가, 없으면 등록
//		if(있으면) {
//		}else {
//		}
		
		//장바구니 옵션 컬럼에 데이터 세팅
		basketDto.setBasketProductOption(option);

		//장바구니 테이블 데이터 등록
		basketDao.insert(basketDto);

		return "redirect:/order/basket";
	}

}
