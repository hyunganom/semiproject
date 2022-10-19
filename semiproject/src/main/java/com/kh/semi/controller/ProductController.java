package com.kh.semi.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.semi.entity.AttachmentDto;
import com.kh.semi.entity.ProductDto;
import com.kh.semi.repository.AttachmentDao;
import com.kh.semi.repository.ProductDao;

@Controller
@RequestMapping("/product")
public class ProductController {

	// 의존성 주입
	@Autowired
	private ProductDao productDao;
	
	//첨부파일 의존성 주입
	@Autowired
	private AttachmentDao attachmentDao;
	
	//첨부파일 업로드 다운로드 경로
	private final File directory = new File("D:\\test");
	
	// 상품 등록 Mapping
	// 1. 상품 등록 페이지로 연결
	@GetMapping("/insert")
	public String insert() {
		
		// 상품 등록 페이지(insert.jsp) 연결
		return "product/insert";
	}
	
	// 2. 상품 등록 처리
	@PostMapping("/insert")
	public String insert(@ModelAttribute ProductDto productDto,
			List<MultipartFile> attachment,
			RedirectAttributes attr) throws IllegalStateException, IOException {
		
		// 관리자 상품 등록(INSERT)을 위한 다음 시퀀스 번호 반환
		int productNo = productDao.nextSequence();
		
		// View에서 입력받은 productDto로 DB 처리 - 관리자 상품 등록(INSERT)
		productDao.insertProduct(productDto);
		
		// 관리자 상품 등록(INSERT) 처리 후 해당 상품 페이지로 강제 이동(redirect)
		attr.addAttribute("productNo", productNo);
		
		//첨부파일 DB연결
		for(MultipartFile file : attachment) {
			if(!file.isEmpty()) {
				
				//첨부파일 시퀀스 발급
				int attachmentNo = attachmentDao.sequence();
				//DB등록
				attachmentDao.insert(AttachmentDto.builder()
						.attachmentNo(attachmentNo)
						.attachmentName(file.getOriginalFilename())
						.attachmentType(file.getContentType())
						.attachmentSize(file.getSize())
					.build());
				
				//파일저장
				File target = new File(directory, String.valueOf(attachmentNo));
				System.out.println(target.getAbsolutePath());
				file.transferTo(target);
				
				//product_attachment 연결테이블 정보 저장
				attachmentDao.connectAttachment(productNo, attachmentNo);
			}
			
		}
		
		return "redirect:product/detail";
	}
	
	// 3. 상품 
}
