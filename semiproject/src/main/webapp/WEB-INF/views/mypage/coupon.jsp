<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="쿠폰 리스트" name="title"/>
	</jsp:include>
	
	<html>			
<head>
</head>
<body>
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
    <div class="container-750">
        <div class="row mt-40">
            <h2>쿠폰</h2>
        </div>        

        <div class="row float-container">
            <div class="float-left w-15">번호</div>
            <div class="float-left w-20">쿠폰명</div>
            <div class="float-left w-20">할인금액</div>
            <div class="float-left w-15">발급일</div>
            <div class="float-left w-15">만료일</div>
            <div class="float-left w-10">사용일자</div>
        </div>
       

    </div>
</body>
</html>
    
    <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>