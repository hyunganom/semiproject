package com.kh.semi.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.semi.entity.AttachmentDto;
import com.kh.semi.entity.InquireDto;
import com.kh.semi.entity.NoticeDto;
import com.kh.semi.repository.AttachmentDao;
import com.kh.semi.repository.NoticeDao;
import com.kh.semi.vo.InquireListSearchVO;

@Controller
@RequestMapping("/notice")

public class NoticeController {
	
	// 의존성 주입
	@Autowired
	private NoticeDao noticeDao;
	
	// 의존성 주입
	@Autowired
	private AttachmentDao attachmentDao;
	
	// 공지글 이미지 첨부파일 업로드를 위한 상위 경로(parent) 설정(상위 경로에 대한 File 클래스의 인스턴스 추가)
		private final File noticeDirectory = new File("D:\\saluv\\noticeImg");
		
	// 상위 경로 생성
	// - 상위 경로 설정(File 클래스의 인스턴스 생성 = 의존성 주입) 후 설정한 상위 경로를 실제로 생성
	@PostConstruct
	public void createDirectory() {
		noticeDirectory.mkdirs();
	}
	
	// 1. 공지 글 등록 Mapping
	// 1) 공지 글 등록 페이지(write.jsp)로 연결
	@GetMapping("/write")
	public String write(HttpSession session) {
		return "/notice/write";
	
	}
	
	// 2) 공지글 등록(INSERT) 처리 (관리자)
	@PostMapping("/write")
	public String write(@ModelAttribute NoticeDto noticeDto,
						RedirectAttributes attr,
						HttpSession session,
						List<MultipartFile> attachmentNoticeImg) throws  IllegalStateException, IOException {
		
		//HttpSession에서 로그인 중인 회원 아이디를 반환
		String noticeId = (String)session.getAttribute("loginId");
		
		//반환한 회원 아이디를 문의글 작성자로 설정
		noticeDto.setNoticeId(noticeId);
		
		//공지글 번호(noticeNo)를 위해 다음 시퀀스 번호 반환
		int noticeNo = noticeDao.noticeSequence();
		
		//반환한 시퀀스 번호를 View에서 입력받은 NoticeDto의 noticeNo로 설정
		noticeDto.setNoticeNo(noticeNo);
		
		//설정한 noticeDto를 매개변수롤 공지글 등록(INSERT) 실행
		noticeDao.write(noticeDto);
		
		//공지글 이미지 첨부파일 업로드
		for(MultipartFile file : attachmentNoticeImg) {
			if(!file.isEmpty()) { //첨부파일이 존재한다면
				
				//첨부파일 등록(INSERT)을 위해 다음 시퀀스 번호 반환
				int attachmentNoticeNo = attachmentDao.sequence();
				
				//Builder 패턴으로 AttachmentDto의 인스턴스 생성 후 첨부파일 테이블(attachment)에 등록 실행
				attachmentDao.insert(AttachmentDto.builder()
						.attachmentNo(attachmentNoticeNo)
						.attachmentName(file.getOriginalFilename())
						.attachmentType(file.getContentType())
						.attachmentSize(file.getSize())
					.build());
				
				// 첨부파일 업로드 경로 생성
				// - 상위 경로(parent)에 대한 File 클래스의 인스턴스와 하위 경로(child)를 나타내는 문자열(String)으로 파일을 업로드할 경로 설정
				// - 첨부파일이 실제로 저장될 때 파일 이름을 첨부파일의 시퀀스 번호로 저장하도록 한다
				File target = new File(noticeDirectory, String.valueOf(attachmentNoticeNo));
				
				// 해당 경로에 업로드한 첨부파일 저장
				file.transferTo(target);
				
				// 첨부파일 업로드 후 문의글 첨부파일 테이블(notice_attachment)에도 등록(INSERT) 실행
				attachmentDao.inquireConnectAttachment(noticeNo, attachmentNoticeNo);
			}
		}
		
		// 반환한 시퀀스 번호를 redirect시 파라미터의 값(value)으로 설정
		attr.addAttribute("noticeNo", noticeNo);
		
		// 작성한 문의글 상세 Mapping으로 강제 이동(redirect)
		return "redirect:detail";
	}
	
	//2. 공지글 목록 Mapping
	@GetMapping("/list")
	public String selectList(Model model, @ModelAttribute InquireListSearchVO inquireListSearchVO, HttpSession session) {		
		
		//공지글 목록(list.jsp)으로 연결
		return "notice/list";
	
	}
	
	//3. 공지글 상세 Mapping
	@GetMapping("/detail")
	public String detail(@RequestParam int noticeNo, Model model) {
		
		// 공지글 상세 페이지(detail.jsp)로 연결
		return "notice/detail";
	
	}
	
	//4. 공지글 수정 Mapping(UPDATE) (관리자)
	@PostMapping("/editAdmin")
	public String edit(@ModelAttribute NoticeDto noticeDto, RedirectAttributes attr) {
		
		// View에서 입력받은 inquireDto를 매개변수로 문의글 수정(UPDATE) 실행
		noticeDao.update(noticeDto);
		
		// inquireDto에서 문의글 번호(inquireNo) 반환
		int inquireNo = noticeDto.getNoticeNo();
		
		// 반환한 문의글 번호(inquireNo)를 redirect시 파라미터의 값(value)으로 설정
		attr.addAttribute("inquireNo", inquireNo);
		
		// 수정한 해당 문의글 상세 Mapping으로 강제 이동(redirect)
		return "redirect:detail";
	}	
	
	//5. 공지글 삭제 Mapping (관리자)
	@GetMapping("/deleteAdmin")
	public String delete(@RequestParam int noticeNo, HttpSession session) {
		
		// 하이퍼링크로 입력받은 공지글 번호(boardNo)로 공지글 삭제(DELETE) 실행
		noticeDao.delete(noticeNo);
		
		// 공지글 삭제 후 공지글 목록 Mapping으로 강제 이동(redirect)
		return "redirect:list";
	}
	

}








