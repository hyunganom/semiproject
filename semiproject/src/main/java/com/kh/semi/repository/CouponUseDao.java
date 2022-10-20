package com.kh.semi.repository;

import java.util.List;

import com.kh.semi.entity.CouponUseDto;

public interface CouponUseDao {
	//쿠폰 사용내역
	
	//1. 쿠폰 사용내역 추가
	void insert(CouponUseDto couponUseDto);
	
	//2. 쿠폰 사용내역 삭제
	boolean delete(int couponUseNo);
	
	//3. 쿠폰 사용내역 조회(회원아이디로 조회)
	List<CouponUseDto> selectList(String couponUseId);

}
