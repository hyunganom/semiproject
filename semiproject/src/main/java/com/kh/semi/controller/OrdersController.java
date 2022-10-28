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
import com.kh.semi.repository.BasketDao;
import com.kh.semi.repository.CouponDao;
import com.kh.semi.repository.MemberDao;
import com.kh.semi.service.OrderService;
import com.kh.semi.vo.BasketVO;
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
	@Autowired
	private BasketDao basketDao;

	//@ModelAttribute ArrayList<Integer> basketNoList, // 여러 개의 장바구니 번호가 들어옴
	//장바구니에서 주문서로 넘어오는 화면
	@GetMapping("/order_ck")
	public String order(HttpServletRequest request,
			HttpSession session, Model model) {
		// 회원 아이디 꺼내옴
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		// 주문자 정보 model로 출력준비
		model.addAttribute("memberDto", memberDao.selectOne(memberId));
		
		// basketNo로 넘어오는 값 처리
		String[] arr = request.getParameterValues("basketNo");
		List<BasketVO> orderList = new ArrayList<>();
		for(int i=0; i<arr.length; i++) {
			BasketVO vo = basketDao.orderList(Integer.parseInt(arr[i]));
			orderList.add(vo);
		}
		// 넘어오는 상품만 model로 출력준비
		model.addAttribute("basketList", orderList);
				
		// 미사용 쿠폰 model로 출력준비
		//model.addAttribute("unusedCoupon", couponDao.unUsedCoupon(memberId));		
		model.addAttribute("couponUsable" , couponDao.selectUsable(memberId));	
		
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