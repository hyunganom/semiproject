package com.kh.semi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order")
public class OrdersController {
	
	@GetMapping("/order_ck")
	public String order() {
		//주문서 작성 페이지로 들어감!
		//회원아이디로 장바구니 정보 조회 및 model 출력준비
		//주문자정보(이름, 전화번호, 이메일 등) model 출력준비
		//배송정보(기본배송지) model 출력준비
		return "order";
	}
	
	@PostMapping("/order_ck")
	public String order(Model model) {
		//입력된 주문정보 orderDto에 저장
		//입력된 결제정보 paymentDto에 저장
		//저장된 정보 model 출력준비
//		if(주문실패할 경우) {
//			return "redirect:order_2";
//		}else { //주문성공할 경우
//			return "redirect:order_1";
//		}
		return "redirect:order_1";
	}
	
	
	
	
	
}
