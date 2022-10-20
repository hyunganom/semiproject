package com.kh.semi;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;

import com.kh.semi.repository.AttachmentDao;
import com.kh.semi.repository.ProductDao;

@SpringBootTest
public class Hyunjae {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	
	@Autowired
	ProductDao productDao;
	
	@Autowired
	AttachmentDao attachmentDao;
	
	//건들지 마셈
	@Test
	public void test01() {
	int productNo = productDao.nextSequence();
	int AttachmentNo = attachmentDao.sequence();
	System.out.println(productNo);
	System.out.println(AttachmentNo);
	
		
	}
	
	
}
