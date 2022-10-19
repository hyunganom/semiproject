package com.kh.semi.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.semi.entity.PaymentDto;

@Repository
public class PaymentDaoImpl implements PaymentDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//1. 등록(추가)
	@Override
	public void insert(PaymentDto paymentDto) {
		// TODO Auto-generated method stub
		
	}

	//2. 수정(상품번호로 조회 후 수량/가격을 변경)
	@Override
	public boolean update(PaymentDto paymentDto) {
		// TODO Auto-generated method stub
		return false;
	}

	//3. 조회
	@Override
	public List<PaymentDto> selectList() {
		// TODO Auto-generated method stub
		return null;
	}

	//4. 삭제(상품번호로 조회 후 삭제)
	@Override
	public boolean delete(int payment_product_no) {
		// TODO Auto-generated method stub
		return false;
	}

}
