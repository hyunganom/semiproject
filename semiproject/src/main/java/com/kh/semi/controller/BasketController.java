package com.kh.semi.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.semi.constant.SessionConstant;
import com.kh.semi.repository.BasketDao;
import com.kh.semi.repository.CouponDao;
import com.kh.semi.vo.BasketVO;

@Controller
public class BasketController {
	
	@Autowired
	private BasketDao basketDao;

	
	//장바구니 페이지로 이동
	@GetMapping("/basket")
	public String basket(HttpSession session, Model model) {
		//장바구니 조회
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		//모델로 전달
		model.addAttribute("basketVO", basketDao.selectList(memberId));
		return "order/basket";
	}
	
	//주문서 페이지로 이동
	@PostMapping("/basket")
	public String basket(@ModelAttribute ArrayList<BasketVO> basketVO,
			HttpServletRequest request, HttpSession session) {
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		
		//1. 체크된 상품의 상품번호가 넘어가야함
		String[] arr = request.getParameterValues("basketProductNo");
		
		//2. 상품번호로 장바구니 조회 후 새로 생성한 result 배열에 
		//	BasketVO 형태로 담기(상품이 여러개일 수 있으므로 반복문으로 처리)
		List<BasketVO> result = new ArrayList<>();
		for(int i=0; i<arr.length; i++) {
			BasketVO list = basketDao.orderBeforeList(memberId, Integer.parseInt(arr[i]));
			result.add(list);
		}
		//3. 세션에 리스트값 저장
		session.setAttribute("basket", result);
		
		//추가로 해야할 것!!!
		//(+심화:체크된 것만 넘어오게 처리하기, js 체크박스 필요)
		return "redirect:/order/order_ck";
	}
		
	//장바구니 상품 삭제
	@GetMapping("/delete")
	public String delete(@RequestParam int productNo) {
		basketDao.delete(productNo);
		return "redirect:/basket";
	}

}
