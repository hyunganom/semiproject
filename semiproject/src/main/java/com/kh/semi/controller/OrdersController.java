package com.kh.semi.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.semi.constant.SessionConstant;
import com.kh.semi.entity.PaymentDto;
import com.kh.semi.repository.CouponDao;
import com.kh.semi.repository.MemberDao;
import com.kh.semi.service.OrderService;
import com.kh.semi.vo.OrderVO;

@Controller
@RequestMapping("/order")
public class OrdersController {

	@Autowired
	private OrderService orderService;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private CouponDao couponDao;

	//장바구니에서 주문서로 넘어오는 화면
	@GetMapping("/order_ck")
	public String order(HttpSession session, Model model) {
		//주문자정보(이름, 전화번호, 이메일 등) model 출력준비
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		model.addAttribute("memberDto", memberDao.selectOne(memberId));
		
		//session에 저장된 장바구니 항목 model 출력준비
		model.addAttribute("basketList", session.getAttribute("basket"));		
		
		//사용가능한 쿠폰 출력하기 위한 model 출력준비
		//model.addAttribute("coupon", couponDao.selectList(memberId));
		return "order/order_ck";
	}
	
	@PostMapping("/order_ck")
	public String order(@ModelAttribute OrderVO orderVO, 
			HttpSession session) {
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		orderVO.setOrderId(memberId);
		
		// 전체 변수 orderVO로 받아 등록처리
		orderService.buy(orderVO);
		return "redirect:_1";

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