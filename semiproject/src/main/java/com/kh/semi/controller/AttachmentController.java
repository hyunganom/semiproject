package com.kh.semi.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.semi.service.AttachmentServiceImpl;

@RequestMapping("/attachment")
@RestController
public class AttachmentController {
	
	@Autowired
	AttachmentServiceImpl serviceImpl;
	@GetMapping("/download/{attachmentNo}")
	public ResponseEntity<ByteArrayResource> download(
			@PathVariable int attachmentNo) throws IOException{
		return serviceImpl.load(attachmentNo);
	}
	
}
