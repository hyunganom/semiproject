package com.kh.semi.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.semi.entity.OrdersDto;
import com.kh.semi.entity.PaymentDto;
import com.kh.semi.repository.OrdersDao;
import com.kh.semi.repository.PaymentDao;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrdersDao ordersDao;
	@Autowired
	private PaymentDao paymentDao;

	@Override
	public void buy(OrdersDto ordersDto, ArrayList<PaymentDto> paymentDto) {
		int orderNo = ordersDao.sequence();
		ordersDto.setOrderNo(orderNo);
		ordersDao.insert(ordersDto);
		
		for(PaymentDto dto : paymentDto) {
			int paymentNo = paymentDao.sequence();
			paymentDao.insert(PaymentDto.builder()
					.paymentNo(paymentNo)
					.paymentOrderNo(orderNo)
					.paymentProductNo(dto.getPaymentProductNo())
					.paymentPrice(dto.getPaymentPrice())
					.paymentOption(dto.getPaymentOption())
					.build());
		}
	}

}
