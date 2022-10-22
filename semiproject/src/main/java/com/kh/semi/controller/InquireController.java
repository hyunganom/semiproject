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

import com.kh.semi.entity.InquireDto;
import com.kh.semi.repository.InquireDao;

@Controller
@RequestMapping("/inquire")
public class InquireController {

	// 의존성 주입
	@Autowired
	private InquireDao inquireDao;
	
	// 1. 문의글 등록 Mapping
	// 1) 문의글 등록 페이지(write.jsp)로 연결
	@GetMapping("/write")
	public String write() {
		
		// 문의글 등록 페이지(write.jsp)로 연결
		return "inquire/write";
	}
	
	// 2) 문의글 등록(INSERT) 처리
	@PostMapping("/write")
	public String write(@ModelAttribute InquireDto inquireDto, RedirectAttributes attr, HttpSession session) {
		
		// HttpSession에서 로그인 중인 회원 아이디를 반환
		String inquireId = (String)session.getAttribute("loginId");
		
//		if(inquireId == null) {
//			return "redirect:list";
//		}
		// 반환한 회원 아이디를 문의글 작성자로 설정
		inquireDto.setInquireId(inquireId);
		
		// 문의글 번호(inquireNo)를 위해 다음 시퀀스 번호 반환
		int inquireNo = inquireDao.nextSequence();
		
		// 반환한 시퀀스 번호를 View에서 입력받은 InquireDto의 inquireNo로 설정
		inquireDto.setInquireNo(inquireNo);
		
		// 설정한 InquireDto를 매개변수로 문의글 등록(INSERT) 실행
		inquireDao.writeInquire(inquireDto);
		
		// 반환한 시퀀스 번호를 redirect시 파라미터의 값(value)으로 설정
		attr.addAttribute("inquireNo", inquireNo);
		
		// 작성한 문의글 상세 Mapping으로 강제 이동(redirect)
		return "redirect:detail";
	}
	
	// 2. 문의글 조회 Mapping
	@GetMapping("/list")
	public String selectList(Model model) {
		
		// 문의글 조회(SELECT) 실행 후 그 결과를 Model에 첨부
		model.addAttribute("inquireList", inquireDao.selectInquire());
		
		return "inquire/list";
	}
	
	// 3. 문의글 상세 Mapping
	@GetMapping("/detail")
	public String detail(@RequestParam int inquireNo, Model model) {
	
		// 하이퍼링크로 입력받은 inquireNo로 상세 조회 실행 후 그 결과를 Model에 첨부
		model.addAttribute("inquireDto", inquireDao.selectOneInquire(inquireNo));
		
		// 문의글 상세 페이지(detail.jsp)로 연결
		return "inquire/detail";
	}
	
	// 4. 문의글 수정
	// 1) 문의글 수정 페이지(edit.jsp)로 연결
	@GetMapping("/edit")
	public String edit(HttpSession session, @RequestParam int inquireNo, Model model, RedirectAttributes attr) {
		
		// HttpSession에서 로그인 중인 회원 아이디를 반환
		String loginId = (String)session.getAttribute("loginId");
		
		// 반환한 inquireNo를 매개변수로 상세 조회 실행 후 그 결과를 변수 inquireDto에 저장
		InquireDto inquireDto = inquireDao.selectOneInquire(inquireNo);
		
		// inquireDto에서 문의글 작성자(inquireId) 반환
		String inquireId = inquireDto.getInquireId();
		
		// 수정 Mapping의 접근자가 해당 문의글 작성자인지 확인
		if(loginId.equals(inquireId)) { // 작성자라면
			// inquireDto를 Model에 첨부
			model.addAttribute("inquireDto", inquireDto);
			
			// 문의글 수정 페이지(edit.jsp)로 연결
			return "inquire/edit";
		}
		else {
			// inquireNo를 redirect시 파라미터의 값(value)으로 설정
			attr.addAttribute("inquireNo", inquireNo);
			
			// 해당 문의글의 상세 Mapping으로 강제 이동
			return "redirect:detail";
		}
	}
	
	// 2) 문의글 수정(UPDATE) 처리
	@PostMapping("/edit")
	public String edit(@ModelAttribute InquireDto inquireDto, RedirectAttributes attr) {
		
		// View에서 입력받은 inquireDto를 매개변수로 문의글 수정(UPDATE) 실행
		inquireDao.updateInquire(inquireDto);
		
		// inquireDto에서 문의글 번호(inquireNo) 반환
		int inquireNo = inquireDto.getInquireNo();
		
		// 반환한 문의글 번호(inquireNo)를 redirect시 파라미터의 값(value)으로 설정
		attr.addAttribute("inquireNo", inquireNo);
		
		// 수정한 해당 문의글 상세 Mapping으로 강제 이동(redirect)
		return "redirect:detail";
	}
	
}
