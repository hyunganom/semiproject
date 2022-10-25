package com.kh.semi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.semi.entity.PaymentDto;
import com.kh.semi.repository.OrdersDao;
import com.kh.semi.repository.PaymentDao;
import com.kh.semi.vo.OrderVO;
import com.kh.semi.vo.PaymentVO;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrdersDao ordersDao;
	@Autowired
	private PaymentDao paymentDao;

	@Override
	public void buy(OrderVO orderVO) {
		int orderNo = ordersDao.sequence();
		orderVO.setOrderNo(orderNo);
		System.out.println(orderVO);
		ordersDao.insert(orderVO);

		//결제테이블에 데이터 등록
		for(PaymentVO dto : orderVO.getPayment()) {
			int paymentNo = paymentDao.sequence();
			paymentDao.insert(PaymentVO.builder()
					.paymentNo(paymentNo)
					.paymentOrderNo(orderNo)
					.paymentProductNo(dto.getPaymentProductNo())
					.paymentPrice(dto.getPaymentPrice())
					.paymentOption(dto.getPaymentOption())
					.build());
		}
		System.out.println(orderVO);
		
		// 주문테이블에 데이터 등록
		
		
		// 결제상품 장바구니에서 제거
		
		// 결제상품 상품재고 마이너스
		
		// 쿠폰사용했을 경우 쿠폰사용내역, 보유쿠폰 테이블 정보 변경
		
		// 적립금 사용했을 경우 회원테이블 정보 변경
		
	}

}
