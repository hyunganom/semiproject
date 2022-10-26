package com.kh.semi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.semi.repository.BasketDao;
import com.kh.semi.repository.OrdersDao;
import com.kh.semi.repository.PaymentDao;
import com.kh.semi.repository.ProductDao;
import com.kh.semi.vo.BasketNoVO;
import com.kh.semi.vo.OrderVO;
import com.kh.semi.vo.PaymentVO;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrdersDao ordersDao;
	@Autowired
	private PaymentDao paymentDao;
	@Autowired
	private ProductDao productDao;
	@Autowired
	private BasketDao basketDao;

	@Override
	public void buy(OrderVO orderVO) {
		// 주문번호 시퀀스로 미리 생성 후 세팅
		int orderNo = ordersDao.sequence();
		orderVO.setOrderNo(orderNo);

		// 주문테이블에 데이터 등록
		ordersDao.insert(orderVO);

		//결제테이블에 데이터 등록
		for(PaymentVO dto : orderVO.getPayment()) {
			// 결제번호 시퀀스 생성
			int paymentNo = paymentDao.sequence();
			paymentDao.insert(PaymentVO.builder()
					.paymentNo(paymentNo)
					.paymentOrderNo(orderNo)
					.paymentProductNo(dto.getPaymentProductNo())
					.paymentCount(dto.getPaymentCount())
					.paymentPrice(dto.getPaymentPrice())
					.paymentOption(dto.getPaymentOption())
					.build());
			
			//결제테이블에 해당하는 결제상품 
			productDao.updateProductInventory(dto);
			
			// 결제상품 장바구니에서 제거(옵션 있는지 없는지 검사 후 delete 구문 다르게 실행)
			basketDao.clearbasket(dto.getBasketNo());
		}
	
		
		// 쿠폰사용했을 경우 쿠폰사용내역, 보유쿠폰 테이블 정보 변경
		
		// 적립금 사용했을 경우 회원테이블 정보 변경
		
	}

}
