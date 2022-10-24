package com.kh.semi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.semi.constant.SessionConstant;
import com.kh.semi.repository.BasketDao;
import com.kh.semi.vo.BasketVO;

@Controller
public class BasketController {
	
	@Autowired
	private BasketDao basketDao;
	
	//장바구니 페이지로 이동
	@GetMapping("/basket")
	public String basket(HttpSession session, Model model) {
		//장바구니 조회
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		//모델로 전달
		model.addAttribute("basketVO", basketDao.selectList(memberId));
		return "order/basket";
	}
	
	//주문서 페이지로 이동
	@PostMapping("/basket")
	public String basket(@ModelAttribute BasketVO basketVO,
			HttpSession session, Model model) {
		//1. 체크된 상품의 상품번호, 수량 넘어가야함
		

		return "redirect:/order/order_ck";
	}
		
	//장바구니 상품 삭제
	@GetMapping("/delete")
	public String delete(@RequestParam int productNo) {
		basketDao.delete(productNo);
		return "redirect:/basket";
	}

}
