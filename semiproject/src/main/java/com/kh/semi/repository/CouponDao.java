package com.kh.semi.repository;

import java.util.List;

import com.kh.semi.entity.CouponDto;
import com.kh.semi.vo.CouponCountVO;

public interface CouponDao {
	//회원 개인이 보유하는 쿠폰
	
	//1. 보유쿠폰 추가
	void insert(CouponDto couponDto);
	
	//2. 보유쿠폰 수정(쿠폰번호로 수정)
	boolean update(CouponDto couponDto);
	
	//3-1. 사용한 쿠폰 조회(회원아이디로 조회)
	List<CouponDto> usedCoupon(String memberId);
	//3-2. 미사용 보유쿠폰 조회(회원아이디로 조회)
	List<CouponDto> unUsedCoupon(String memberId);
	//3-3. 보유쿠폰 개수조회(회원아이디로 조회)
	CouponCountVO selectOne(String memberId);
	
	//4. 보유쿠폰 삭제(쿠폰번호로 삭제)
	boolean delete(int couponNo);
	
	List<CouponCountVO> selectCountList();
	
}
