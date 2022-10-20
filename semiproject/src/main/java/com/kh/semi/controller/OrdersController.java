package com.kh.semi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.semi.entity.MemberDto;
import com.kh.semi.entity.OrdersDto;
import com.kh.semi.repository.OrdersDao;

@Controller
@RequestMapping("/order")
public class OrdersController {
	
	private OrdersDao ordersDao;
	
	@GetMapping("/insert")
	public String insert(@ModelAttribute OrdersDto ordersDto) {
		ordersDao.insert(ordersDto);
		return "order/insert";
	}

	@GetMapping("/basket")
	public String basket() {
		//회원아이디로 조회 후 해당 장바구니 테이블에
		//들어있는 정보를 찍어주는 기능필요
		return "basket";
	}

	
	@GetMapping("/order_ck")
	public String order() {
//		@ModelAttribute MemberDto memberDto, HttpSession session) {
//		String memberId = (String)session.getAttribute();
		
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
