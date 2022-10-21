<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="주문 내역" name="title"/>
	</jsp:include>	
	
	<div class="container-1100 mt-40 mb-40">
	<div class="row center">
	<hr>
	<h3>${memberDto.memberName}님 환영합니다</h3>
	<h3>등급 : ${memberDto.memberGrade}  / 적립금 : ${memberDto.memberPoint}원 / 쿠폰 : ${couponCountVo.cnt}개  
	 </h3>
	 <hr>

	</div>
	
	<div class="row float-container">
	
		<div class="float-left w-40 p-20">
			<div class="row">
				<h2>마이샐러브</h2>
				<hr>
					<h3><a href="/mypage/order_list">주문내역</a></h3>
					<h3><a href="/mypage/wish_list">찜한상품</a></h3>
					<h3><a href="/mypage/delivery_list">배송지관리</a></h3>
					<h3><a href="">상품후기</a></h3>
					<h3><a href="/mypage/point">적립금</a></h3>
					<h3><a href="/mypage/coupon">쿠폰</a></h3>
					<h3><a href="/member/change">내정보수정</a></h3>				
				<h4>도움이 필요하신가요?<br><small><a href="/mypage/qna">1:1문의하기</a></small></h4>		
			</div>
		</div>
			
			
	<div class="row float-container">
		<div class="row left">
			<h2>주문내역</h2>
			</div>
				<div class="row center w-40 p-20">	
				<hr>
				<div class="row order">
					<div class="row left">
					날짜 0000-00-00(hh시 mm분)
					</div>
					<div class="row left">
					상품명 : ㅇㅇㅇㅇㅇㅇ 외 ㅇ건<br>
					주문번호 : ㅇㅇㅇㅇㅇㅇ<br>
					결제방법 : ㅇㅇㅇㅇㅇㅇ<br>
					결제금액 : ㅇㅇㅇㅇㅇㅇ<br>
					</div>				
				</div>
				
				<hr>
								
				<div class="row order">
					<div class="row left">
					날짜 0000-00-00(hh시 mm분)
					</div>
					<div class="row left">
					상품명 : ㅇㅇㅇㅇㅇㅇ 외 ㅇ건<br>
					주문번호 : ㅇㅇㅇㅇㅇㅇ<br>
					결제방법 : ㅇㅇㅇㅇㅇㅇ<br>
					결제금액 : ㅇㅇㅇㅇㅇㅇ<br>
					</div>				
				</div>
				
				<hr>
				
			<div class="row order">
					<div class="row left">
					날짜 0000-00-00(hh시 mm분)
					</div>
					<div class="row left">
					상품명 : ㅇㅇㅇㅇㅇㅇ 외 ㅇ건<br>
					주문번호 : ㅇㅇㅇㅇㅇㅇ<br>
					결제방법 : ㅇㅇㅇㅇㅇㅇ<br>
					결제금액 : ㅇㅇㅇㅇㅇㅇ<br>
					</div>				
				</div>
				
				<hr>			
	
				
	
			</div>
			</div>

			
			
			

	
<!-- 	<div class="row left">
	<h2><a href="/mypage/order_list">주문내역</a></h2>
	<h2><a href="/mypage/wish_list">찜한상품</a></h2>
	<h2><a href="/mypage/delivery_list">배송지관리</a></h2>
	<h2><a href="">상품후기</a></h2>	
	<h2><a href="/mypage/point">적립금</a></h2>
	<h2><a href="/mypage/coupon">쿠폰</a></h2>
	<h2><a href="/member/change">내정보수정</a></h2>
	<hr>
	<h3>도움이 필요하신가요?</h3>
	<h4><a href="/mypage/qna">1:1문의하기</a></h4>
	</div>
	</div> -->
	
    
    <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>