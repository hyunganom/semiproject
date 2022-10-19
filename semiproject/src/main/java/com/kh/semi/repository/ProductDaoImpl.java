package com.kh.semi.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.semi.entity.ProductDto;

@Repository
public class ProductDaoImpl implements ProductDao {

	// 의존성 주입
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	// 추상 메소드 오버라이딩 - 상품 등록을 위한 다음 시퀀스 번호 반환
	@Override
	public int nextSequence() {
		String sql = "select product_seq.nextval from dual";
		int productNo = jdbcTemplate.queryForObject(sql, int.class);
		return productNo;
	}

	// 추상 메소드 - 관리자 상품 등록
	@Override
	public void insertProduct(ProductDto productDto) {
		
		// 다음 시퀀스 번호 반환
		int productNo = nextSequence();
		
		// 상품 등록 SQL
		String sql = "insert into product(product_no, category_high_no, category_low_no, product_name, product_price, product_information, product_inventory) values(?, ?, ?, ?, ?, ?, ?)";
		Object[] param = new Object[] {productNo, productDto.getCategoryHighNo(), productDto.getCategoryLowNo(), productDto.getProductName(), productDto.getProductPrice(), productDto.getProductInformation(), productDto.getProductInventory()};
		jdbcTemplate.update(sql, param);
	}

}
