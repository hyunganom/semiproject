package com.kh.semi.repository;

import java.util.List;

import com.kh.semi.entity.PaymentDto;

public interface PaymentDao {
	//결제(&통계)
	
	//1. 등록(추가)
	void insert(PaymentDto paymentDto);
	
	//2. 수정(상품번호로 조회 후 수량/가격을 변경)
	boolean update(PaymentDto paymentDto); 
	
	//3. 조회
	List<PaymentDto> selectList();
	
	//4. 삭제(상품번호로 조회 후 삭제)
	// 나중에 넘어오는 값 확인 후 매개변수 수정 예정
	boolean delete(int payment_product_no);
}
