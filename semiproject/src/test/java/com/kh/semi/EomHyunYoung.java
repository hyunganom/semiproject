package com.kh.semi;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.semi.repository.InquireDao;
import com.kh.semi.repository.ProductDao;

@SpringBootTest
public class EomHyunYoung {
	
	// 의존성 주입
	@Autowired
	ProductDao productDao;
	
	@Autowired
	InquireDao inquireDao;
	
//	@Test
//	public void test() {	
//		
//	}
	
	// 문의글 수정(UPDATE)
//	@Test
//	public void test() {	
//		boolean result = inquireDao.updateInquire(InquireDto.builder()
//				.inquireTitle("테스트제목")
//				.inquireContent("테스트내용")
//				.inquireNo(312)
//				.build());
//		System.out.println(result);
//	}

//	// 문의글 등록(INSERT)
//	@Test
//	public void test() {
//		for(int i = 1 ; i <= 300 ; i ++) {
//			int inquireNo = inquireDao.nextSequence();		
//			inquireDao.writeInquire(InquireDto.builder()
//					.inquireNo(inquireNo)
//					.inquireId("hello111")
//					.inquireTitle("테스트용 문의글 "+ inquireNo +"번")
//					.inquireContent("테스트용 문의글 "+ inquireNo +"번")
//					.build()
//					);
//		}
//	}

	// 문의글 조회(SELECT)
//	@Test
//	public void test() {	
//		List<InquireDto> result = inquireDao.selectInquire();
//		System.out.println(result);
//	}

	// 문의글 상세(DETAIL)
//	@Test
//	public void test() {	
//		InquireDto result = inquireDao.selectOneInquire(12);
//		System.out.println(result);
//	}
	
	// 문의글 수정(UPDATE)
//	@Test
//	public void test() {	
//		boolean result = inquireDao.updateInquire(InquireDto.builder()
//				.inquireTitle("테스트제목")
//				.inquireContent("테스트내용")
//				.inquireNo(312)
//				.build());
//		System.out.println(result);
//	}
	
//	// 문의글 삭제(DELETE)
//	@Test
//	public void test() {	
//		boolean result = inquireDao.deleteInquire(309);
//		System.out.println(result);
//	}
	
	// 문의글 삭제(UPDATE)
	@Test
	public void test() {	
		boolean result = inquireDao.inactiveInquire(304);
		System.out.println(result);
	}

	// 관리자 상품 등록(INSERT)
//	@Test
//	public void test() {	
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
}
