package com.kh.semi;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;

@SpringBootTest
public class Hyunjae {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	//건들지 마셈
	@Test
	public void test01() {
		String sql ="INSERT into product "
				+ " VALUES(PRODUCT_SEQ.nextval, 24, 5,'닭가슴살샐러드',10000,'헬창추천 닭가슴살 샐러드',100,3)";
		jdbcTemplate.update(sql);
	}
	
	
}
