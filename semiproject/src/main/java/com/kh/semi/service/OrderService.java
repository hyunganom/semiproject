package com.kh.semi.service;

import java.util.ArrayList;

import com.kh.semi.entity.OrdersDto;
import com.kh.semi.entity.PaymentDto;

public interface OrderService {
	void buy(OrdersDto ordersDto, ArrayList<PaymentDto> paymentDto);
}
