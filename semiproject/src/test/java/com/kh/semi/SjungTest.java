package com.kh.semi;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.semi.constant.SessionConstant;
import com.kh.semi.repository.BasketDao;

@SpringBootTest
public class SjungTest {
	
	@Autowired
	private BasketDao basketDao;

	@Test
	public void test1() {
		basketDao.selectList("admin1234");
	}
}