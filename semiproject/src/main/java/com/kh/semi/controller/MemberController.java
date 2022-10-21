package com.kh.semi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	@GetMapping("/detail")
	public String detail(Model model, @RequestParam String memberId) {
		MemberDto memberDto = memberDao.selectOne(memberId);
		model.addAttribute("memberDto", memberDto);
		return "member/detail";
	}
	
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	@PostMapping("/login")
	public String login(@ModelAttribute MemberDto inputDto, 
			HttpSession session) {
		MemberDto findDto = memberDao.selectOne(inputDto.getMemberId());
		if(findDto == null) {
			return "redirect:login?error";
		}
		
		boolean passwordMatch = inputDto.getMemberPw().equals(findDto.getMemberPw());
		if(passwordMatch) {
			session.setAttribute("loginId", inputDto.getMemberId());
			session.setAttribute("mg", findDto.getMemberGrade());
			return "redirect:/";
		}
		else {
			return "redirect:login?error";
		}
	}
	
	@GetMapping("/change")
	public String change(Model model, @RequestParam String memberId) {
		model.addAttribute("memberDto", memberDao.selectOne(memberId));
		return "member/change";
	}
	
	@PostMapping("/change")
	public String change(@ModelAttribute MemberDto memberDto, RedirectAttributes attr) {
		boolean result = memberDao.update(memberDto);
		if(result) {
			attr.addAttribute("memberId", memberDto.getMemberId());
			return "redirect:detail";
		}
		else {
			return "redirect:change_fail";
		}
	}
	
	@GetMapping("/change_fail")
	public String changeFail() {
		return "member/changeFail";
	}
	
	@GetMapping("/change_pw")
	public String changePw() {
		return "member/changePw";
	}
	
	@PostMapping("/change_pw")
	public String changePw(HttpSession session, @RequestParam String memberPw) {
		String memberId = (String)session.getAttribute("loginId");
		try {
			memberDao.changePassword(memberId, memberPw);
			return "redirect:change_pw_success";
		}
		catch (Exception e) {
			return "redirect:change_pw?error";
		}
	}
	
	@GetMapping("/change_pw_success")
	public String changePwSuccess() {
		return "member/changePwSuccess";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginId");
		session.removeAttribute("mg");
		return "redirect:/";
	}
	
	@GetMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		String loginId = (String) session.getAttribute("loginId");
		MemberDto memberDto = memberDao.selectOne(loginId);
		model.addAttribute("memberDto", memberDto);
		return "member/detail";
	}
	
	
}
