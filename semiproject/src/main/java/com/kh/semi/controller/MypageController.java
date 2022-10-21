package com.kh.semi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.semi.entity.MemberDto;
import com.kh.semi.repository.MemberDao;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	private MemberDao memberDao;
	
	//마이페이지
	@GetMapping("/order_list")
	public String mypage(HttpSession session, Model model) {
		//1. 세션에 들어있는 아이디를 꺼낸다
		//(참고) 세션에 데이터는 Object 형태로 저장되므로 꺼내려면 다운캐스팅 필요
		String loginId = (String) session.getAttribute("loginId");
		
		//2. 아이디를 이용하여 회원 정보를 불러온다
		MemberDto memberDto = memberDao.selectOne(loginId);
		
		//3. 불러온 회원 정보를 모델에 첨부한다
		model.addAttribute("memberDto", memberDto);
		
		return "mypage/order_list";		
	}
	

}
