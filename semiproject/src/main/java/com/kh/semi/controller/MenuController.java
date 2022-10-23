package com.kh.semi.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.semi.constant.SessionConstant;
import com.kh.semi.entity.BasketDto;
import com.kh.semi.entity.Week2Dto;
import com.kh.semi.repository.BasketDao;
import com.kh.semi.repository.ProductDao;
import com.kh.semi.repository.Week2Dao;

@Controller
public class MenuController {
	
	@Autowired
	private BasketDao basketDao;
	@Autowired
	private ProductDao productDao;
	@Autowired
	private Week2Dao week2Dao;
	
	//구독상품 전체목록으로 이동
	@GetMapping("/subscription")
	public String subs() {
		return "subscription/list";
	}
	
	//구독상품 상세페이지로 이동
	@GetMapping("/subscription/detail")
	public String detail() {
		return "subscription/detail";
	}
	
	//옵션 선택 후 장바구니로 이동
	//2주, 장바구니 테이블 각각 등록 필요
	@PostMapping("/subscription/detail")
	public String detail(HttpServletRequest request, 
			@ModelAttribute BasketDto basketDto,
			HttpSession session) {
		
		// 파라미터 옵션항목값 배열로 가져오기
		String[] arrayParam = request.getParameterValues("basketProductOption");
		
		// 상품번호로 상품명 조회 후 가져오기(상품명만 나오게 toString 재정의)
		String option = "";
		for(int i=0; i<arrayParam.length; i++) {
			int productNo = Integer.parseInt(arrayParam[i]);
			option = option+productDao.selectName(productNo)+" / ";
		}
		
		//장바구니에 있는 상품이면 개수 증가, 없으면 등록
//		if(있으면) {
//		}else {
//		}
		
		//장바구니 옵션 컬럼에 데이터 세팅
		basketDto.setBasketProductOption(option);

		//장바구니 테이블 데이터 등록
		basketDao.insert(basketDto);
		
		//2주 테이블에 데이터 등록
		//필요한 데이터 수집,, 노가다ㅠㅠㅠㅠㅠ 이렇게 하는게 맞는지 모르겠지만 돌아가긴 함
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		int sequnece = week2Dao.sequence();
		
		Week2Dto week2Dto = new Week2Dto();
		week2Dto.setWeek2Combi(sequnece);
		week2Dto.setWeek2ProducNo(basketDto.getBasketProductNo());
		week2Dto.setWeek2MemberId(memberId);
		week2Dto.setWeek2Option1(Integer.parseInt(arrayParam[0]));
		week2Dto.setWeek2Option2(Integer.parseInt(arrayParam[1]));
		week2Dto.setWeek2Option3(Integer.parseInt(arrayParam[2]));
		week2Dto.setWeek2Option4(Integer.parseInt(arrayParam[3]));
		week2Dto.setWeek2Option5(Integer.parseInt(arrayParam[4]));
		week2Dto.setWeek2Option6(Integer.parseInt(arrayParam[5]));
		week2Dto.setWeek2Option7(Integer.parseInt(arrayParam[6]));
		week2Dto.setWeek2Option8(Integer.parseInt(arrayParam[7]));
		
		week2Dao.insert(week2Dto);		

		return "redirect:/order/basket";
	}

}
