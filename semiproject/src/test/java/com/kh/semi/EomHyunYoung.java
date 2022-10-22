package com.kh.semi;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.semi.entity.InquireDto;
import com.kh.semi.repository.InquireDao;
import com.kh.semi.repository.ProductDao;

@SpringBootTest
public class EomHyunYoung {
	
	// 의존성 주입
	@Autowired
	ProductDao productDao;
	
	@Autowired
	InquireDao inquireDao;

	// 상품 등록 테스트
//	@Test
//	public void testInsert() {	
//		// 상품 등록
//		for(int i = 1 ; i <= 30 ; i ++) {
//			int productNo = productDao.nextSequence();		
//			productDao.insertProduct(ProductDto.builder()
//										.productNo(productNo)
//										.categoryHighNo(27)
//										.categoryLowNo(19)
//										.productName("테스트 상품" + i)
//										.productPrice(10000)
//										.productInformation("테스트 상품 "+ i +"의 정보")
//										.productInventory(100)
//									.build()
//									);
//		}
//	}
	
	// 문의글 등록 테스트
	@Test
	public void testInsert() {	
		// 문의글 등록
		for(int i = 1 ; i <= 300 ; i ++) {
			int inquireNo = inquireDao.nextSequence();		
			inquireDao.writeInquire(InquireDto.builder()
					.inquireNo(inquireNo)
					.inquireId("hello111")
					.inquireTitle("테스트용 문의글 "+ inquireNo +"번")
					.inquireContent("테스트용 문의글 "+ inquireNo +"번")
					.build()
					);
		}
	}
}
