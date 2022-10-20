package com.kh.semi;

import org.junit.jupiter.api.BeforeEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.semi.entity.ProductDto;
import com.kh.semi.repository.ProductDao;

@SpringBootTest
public class EomHyunYoung {
	
	@Autowired
	ProductDao productDao;

	@BeforeEach
	public void testInsert() {	
		// 상품 등록
		for(int i = 1 ; i <= 16 ; i ++) {
			int productNo = productDao.nextSequence();		
			productDao.insertProduct(ProductDto.builder()
										.productNo(productNo)
										.categoryHighNo(24)
										.categoryLowNo(5)
										.productName("테스트 상품" + i)
										.productPrice(10000)
										.productInformation("테스트 상품 "+ i +"의 정보")
										.productInventory(100)
									.build()
									);
		}
	}
//	
//	@Test
//	public void testdelete() {
//		
//		
//	}

//	@AfterEach
	
//	}
}
