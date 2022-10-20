package com.kh.semi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.semi.entity.MemberDto;
import com.kh.semi.repository.MemberDao;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberDao memberDao;
	
	@GetMapping("/join")
	public String join() {
		return "member/join";
	}
	
	@PostMapping("/join")
	public String join(@ModelAttribute MemberDto memberDto) {
		memberDao.insert(memberDto);
		return "redirect:join_finish";
	}
	
	@GetMapping("/join_finish")
	public String joinFinish() {
		return "member/joinFinish";
	}
	
	@GetMapping("/list")
	public String list(Model model, 
			@RequestParam(required = false)	String type, 
			@RequestParam(required = false) String keyword) {
		boolean isSearch = type != null && keyword != null;
		if(isSearch) {
			model.addAttribute("list", memberDao.selectList(type, keyword));
		}
		else {
			model.addAttribute("list", memberDao.selectList());
		}
		return "member/list";
	}
	
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
//	@PostMapping("/login")
//	public String login(@ModelAttribute MemberDto inputDto, 
//			HttpSession session) {
//		MemberDto findDto = memberDao.
//	}
}
