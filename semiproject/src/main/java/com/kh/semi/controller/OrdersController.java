package com.kh.semi.controller;

import java.util.ArrayList;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.semi.entity.OrdersDto;
import com.kh.semi.entity.PaymentDto;
import com.kh.semi.repository.OrdersDao;
import com.kh.semi.repository.PaymentDao;
import com.kh.semi.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrdersController {

	@Autowired
	private OrdersDao ordersDao;
	@Autowired
	private PaymentDao paymentDao;
	@Autowired
	private OrderService orderService;
	
	@PostConstruct
	public void prepare() {
		System.out.println("초기화 메소드!!");
	}
	
	
	//장바구니
	@GetMapping("/basket")
	public String basket() {
		//아이디, 상품번호, 상품수량, 추가일(sysdate)로 등록
		//상세페이지에서 넘어오는 값 확인 후 등록해야함
		
		return "order/basket";
	}


	//장바구니에서 주문서로 넘어가는 화면
	@GetMapping("/order_ck")
	public String order() {
		//주문서 작성 페이지로 들어감!
		//회원아이디로 장바구니 정보 조회 및 model 출력준비
		//주문자정보(이름, 전화번호, 이메일 등) model 출력준비
		//배송정보(기본배송지) model 출력준비
//		@ModelAttribute MemberDto memberDto, HttpSession session) {
//		String memberId = (String)session.getAttribute();
		return "order/order_ck";
	}
	
	@PostMapping("/order_ck")
	public String order(@ModelAttribute OrdersDto ordersDto, 
			@ModelAttribute ArrayList<PaymentDto> paymentDto
			) {
		
		// View에서 전달받은 OrdersDto에 포함된 정보
		// orderName, orderTel, orderPost, orderBaseAddress, orderDetailAddress, 
		// orderMemo, orderId, orderStatus, orderPrice, orderPayPrice
		
		// View에서 전달받은 List<PaymentDto>에 포함된 정보
		// paymentProductNo, paymentCount, paymentPrice, paymentOption
		
		orderService.buy(ordersDto, paymentDto);
		return "redirect:_1";
		
		//입력된 주문정보 orderDto에 저장
		//입력된 결제정보 paymentDto에 저장
//		if(주문실패할 경우) { 
//			return "redirect:order/_2";
//		}else { //주문성공할 경우
//			return "redirect:order/_1";
//		}
		
	}
	
	//주문성공
	@GetMapping("/_1")
	public String success() {
		return "order/order_success";
	}
	
	//주문실패
	@GetMapping("/_2")
	public String fail() {
		return "order/order_fail";
	}

}