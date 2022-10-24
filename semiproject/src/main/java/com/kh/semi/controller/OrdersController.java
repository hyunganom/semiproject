package com.kh.semi.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.semi.constant.SessionConstant;
import com.kh.semi.entity.OrdersDto;
import com.kh.semi.entity.PaymentDto;
import com.kh.semi.repository.BasketDao;
import com.kh.semi.repository.MemberDao;
import com.kh.semi.service.OrderService;
import com.kh.semi.vo.BasketVO;

@Controller
@RequestMapping("/order")
public class OrdersController {

	@Autowired
	private OrderService orderService;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private BasketDao basketDao;
	
//	@PostConstruct
//	public void prepare() {
//		System.out.println("초기화 메소드!!");
//	}

	//장바구니에서 주문서로 넘어오는 화면
	@GetMapping("/order_ck")
	public String order(HttpSession session, Model model) {
		//@ModelAttribute ArrayList<BasketVO> basketVO,
		
		//주문자정보(이름, 전화번호, 이메일 등) model 출력준비
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		model.addAttribute("memberDto", memberDao.selectOne(memberId));
		//model.addAttribute("list", basketVO);
		
		return "order/order_ck";
	}
	
	@PostMapping("/order_ck")
	public String order(@ModelAttribute OrdersDto ordersDto, 
			@ModelAttribute ArrayList<PaymentDto> paymentDto,
			HttpSession session
			) {
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		ordersDto.setOrderId(memberId);
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