package com.kh.semi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.semi.constant.SessionConstant;
import com.kh.semi.repository.BasketDao;

@Controller
@RequestMapping("/basket")
public class BasketController {
	
	@Autowired
	private BasketDao basketDao;
	
	//장바구니 페이지로 이동
	@GetMapping("/list")
	public String basket(
			HttpSession session, Model model) {
		//세션 아이디 가져옴
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		// basketVO(장바구니와 상품테이블 이너조인) model로 출력준비
		model.addAttribute("basketVO", basketDao.selectList(memberId));
		
		//추가로 해야할 것!!!
		//(+심화:체크된 것만 넘어오게 처리하기, js 체크박스 필요)
		return "order/basket";
	}

	//장바구니 상품 삭제
	@GetMapping("/delete")
	public String delete(@RequestParam int productNo) {
		basketDao.delete(productNo);
		return "redirect:/basket/list";
	}

}
