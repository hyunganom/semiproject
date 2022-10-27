<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    <jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="주문 내역" name="title"/>
	</jsp:include>	
	<!DOCTYPE html>
	<html lang="ko">
	<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Table design</title>
    
     <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="reset.css">
    <link rel="stylesheet" type="text/css" href="commons.css">
    <link rel="stylesheet" type="text/css" href="layout.css">
    

    <link rel="stylesheet" type="text/css" href="commons.css">
	<style>

	        /* 확장스타일 : 마우스에 반응하는 테이블 */
        .table.table-hover > thead > tr:hover, 
        .table.table-hover > tbody > tr:hover, 
        .table.table-hover > tfoot > tr:hover{
            background-color: #ebf7f2;
            color : #29995d;
            font-weight: bolder;
            font-size: medium;
        }	
        a { text-decoration:none;
        	color:#525252
	    }

        
	</style>
	<body>
	<div class="container-1100 mt-40 mb-40">
	<div class="row center">
	<hr>
	<h3>${memberDto.memberName}님 환영합니다</h3>
	<h3>등급 : ${memberDto.memberGrade}  / 적립금 : ${memberDto.memberPoint}원 / 쿠폰 : ${memberDto.cnt}개  
	 </h3>
	 <hr>

	</div>
	
	<div class="row float-container">	
		<div class="float-left w-40 p-20">
			<table class="table table-hover">
				<thead>
					<h2>마이샐러브</h2>
				</thead>
				<hr>
				<tbody class = "center" >
					<tr>
						<td><h3 class = "font"><a href="/mypage/order_list">주문내역</a></h3></td>
					</tr>
					<tr>
						<td><h3 class = "font"><a href="/mypage/delivery_list">배송지관리</a></h3></td>
					</tr>
					<tr>
						<td><h3 class = "font"><a href="">상품후기</a></h3></td>
					</tr>
					<tr>
						<td><h3 class = "font"><a href="/mypage/point" >적립금</a></h3></td>
					</tr>
					<tr>
						<td><h3 class = "font"><a href="/mypage/coupon">쿠폰</a></h3></td>
					</tr>
					<tr>
						<td><h3 class = "font"><a href="/member/change">내정보수정</a></h3></td>		
					<tr>
					</tr>			
					<tr>
					<td>도움이 필요하신가요?<br><a href="/inquire/list">1:1문의하기</a></h3></td>
					</tr>		
				</tbody>
				</table>
			</div>
		</div>
		</body>
		
		<a href = "/review/write?reviewPaymentNo=134">hello111의 paymentNo=134에 대한 리뷰 작성하기</a>
			

    <c:forEach var="paymentListVO" items="${paymentListVO}">
    주문번호 : ${paymentListVO.paymentOrderNo}<br>
    결제번호 : ${paymentListVO.paymentNo}<br>
    상품명 : ${paymentListVO.productName}<br>
    상품옵션 : ${paymentListVO.paymentOption}<br>
    상품구매갯수 : ${paymentListVO.paymentCount}<br>
    상품결제가격 : ${paymentListVO.paymentPrice}<br>
    주문일자 : ${paymentListVO.orderDate}<br>
    상품이미지 : <img width=50 height=50 src="/attachment/download/productTumbnail?attachmentNo=${paymentListVO.productAttachmentNo}">
    <hr>
    </c:forEach>
    

			
			
</html>		

	
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