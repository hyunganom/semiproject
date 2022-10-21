package com.kh.semi.service;

import java.util.List;

import com.kh.semi.entity.OrdersDto;
import com.kh.semi.entity.PaymentDto;

public interface OrderService {
	void buy(OrdersDto ordersDto, List<PaymentDto> paymentDto);
}
