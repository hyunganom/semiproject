package com.kh.semi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.semi.entity.MemberDto;
import com.kh.semi.repository.CouponDao;
import com.kh.semi.repository.MemberDao;
import com.kh.semi.vo.CouponCountVO;
import com.kh.semi.vo.CouponListVO;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private CouponDao couponDao;
	
//	@Autowired
//	private CouponDao couponDao;
	
	//마이페이지
	@GetMapping("/order_list")
	public String orderList(HttpSession session, Model model) {
		//1. 세션에 들어있는 아이디를 꺼낸다
		//(참고) 세션에 데이터는 Object 형태로 저장되므로 꺼내려면 다운캐스팅 필요
		String loginId = (String) session.getAttribute("loginId");
		//2. 아이디를 이용하여 회원 정보를 불러온다
		CouponCountVO couponMember = couponDao.selectOne(loginId);
		//3. 불러온 회원 정보를 모델에 첨부한다
		model.addAttribute("memberDto", couponMember);	
		model.addAttribute("couponUsable" , couponDao.selectUsable(loginId));	

		return "mypage/order_list";	
	}
	
	//마이페이지 내 위시리스트
	@GetMapping("/wish_list")
	public String wishlist(HttpSession session, Model model) {
		//1. 세션에 들어있는 아이디를 꺼낸다
		//(참고) 세션에 데이터는 Object 형태로 저장되므로 꺼내려면 다운캐스팅 필요
		String loginId = (String) session.getAttribute("loginId");
		//2. 아이디를 이용하여 회원 정보를 불러온다
		MemberDto memberDto = memberDao.selectOne(loginId);
		//3. 불러온 회원 정보를 모델에 첨부한다
		model.addAttribute("memberDto", memberDto);
		
    
		return "mypage/wish_list";			
	}
	
	//마이페이지 내 배송지관리
	@GetMapping("/delivery_list")
	public String deliveryList(HttpSession session, Model model) {
			//1. 세션에 들어있는 아이디를 꺼낸다
			//(참고) 세션에 데이터는 Object 형태로 저장되므로 꺼내려면 다운캐스팅 필요
			String loginId = (String) session.getAttribute("loginId");
			//2. 아이디를 이용하여 회원 정보를 불러온다
			MemberDto memberDto = memberDao.selectOne(loginId);
			//3. 불러온 회원 정보를 모델에 첨부한다
			model.addAttribute("memberDto", memberDto);
		
		return "mypage/delivery_list";			
	}
	
	//마이페이지 내 주문상세
	@GetMapping("/detail")
	public String detail() {
		
		
		return "mypage/detail";			
	}
	
	//마이페이지 내 쿠폰 보기
	@GetMapping("/coupon")
	public String coupon(Model model,  HttpSession session) {
		String memberId = (String)session.getAttribute("loginId");	
		
		model.addAttribute("couponList", couponDao.couponList(memberId));
		
		String loginId = (String) session.getAttribute("loginId");
		CouponCountVO couponMember = couponDao.selectOne(loginId);
		//3. 불러온 회원 정보를 모델에 첨부한다
		model.addAttribute("memberDto", couponMember);	
		model.addAttribute("couponUsable" , couponDao.selectUsable(loginId));	
		
		
		//쿠폰 페이지로(coupon.jsp) 연결
		return "mypage/coupon";
	}
	

	
	//마이페이지 내 주문취소
	@GetMapping("/cancle")
	public String cancel() {
		
		return "mypage/cancel";			
	}
	
	//마이페이지 내 교환
	@GetMapping("/exchange")
	public String exchange() {
		
		return "mypage/exchange";			
	}
	
	//마이페이지 내 반품
	@GetMapping("/returns")
	public String returns() {
		
		return "mypage/returns";			
	}
		

}

