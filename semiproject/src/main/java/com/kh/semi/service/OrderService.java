package com.kh.semi.service;

import com.kh.semi.vo.OrderVO;

public interface OrderService {
	void buy(OrderVO orderVO, int CouponIssue);
}
