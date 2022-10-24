package com.kh.semi.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.semi.entity.NoticeDto;
import com.kh.semi.repository.AttachmentDao;
import com.kh.semi.repository.NoticeDao;

@Controller
@RequestMapping("/notice")

public class NoticeController {
	
	@Autowired
	private NoticeDao noticedao;
	
	@Autowired
	private NoticeDto noticeDto;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	private final File directory = new File("D:/upload");
	
	

}
