package com.kh.semi.repository;

import java.util.List;

import com.kh.semi.entity.BasketDto;
import com.kh.semi.vo.BasketVO;

public interface BasketDao {
	//장바구니
	//1. 상품 추가
	void insert(BasketDto basketDto);
	
	//2. 상품수량 수정
	boolean update(BasketDto basketDto);
	
	//3-1 조회(회원아이디로 조회)
	//List<BasketDto> selectList(String memberId);
	//3-2. VO(회원아이디로 조회)
	List<BasketVO> selectList(String memberId);
	
	//3-3 조회(장바구니에 추가할 상품이 있는지 확인)
	boolean checkItem(BasketDto basketDto);
	
	//4. 삭제(상품번호로 삭제)
	// 나중에 넘어오는 값 확인 후 매개변수 수정 예정
	boolean delete(int productNo);

	
	
}
