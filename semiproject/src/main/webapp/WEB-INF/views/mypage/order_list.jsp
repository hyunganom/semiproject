
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="주문 내역" name="title"/>
</jsp:include>	

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
	<h3>등급 : ${memberDto.memberGrade}  / 적립금 : ${memberDto.memberPoint}원 / 쿠폰 :${couponUsable}개
	 </h3>
	 <hr>

<style>
	a:hover {
		color : #29995d;/* 마우스 올렸을 글자 색 */
		text-decoration:none;
	}
	.font-menu > h3:hover{
		background-color: #ebf7f2;
	}
	.font-menu > h3{
		margin-top: 30px;
	}
	.w-80 {
		width:80%;
	}
	
	.table > thead {
    	font-size: 16px;
    }
    .table > tbody {
    	font-size: 14px;
    }
	
	/* 확장 스타일 : 옆트임 테이블*/
    .table.table-slit > thead > tr,
    .table.table-slit > thead > th{
    	background-color: #efefef;
    	border: 3px solid gray;
    }
    
    /* 확장스타일 : 테두리가 있는 테이블 */
    .table.table-border > thead > th,
    .table.table-border > thead > td,
    .table.table-border > tbody > tr,
    .table.table-border > tbody > th,
    .table.table-border > tbody > td{
    	border: 3px solid gray;
    }
	
	th, td {
    	vertical-align : middle;
    }
	/* div {
		border:1px dotted gray;
	} */
</style>

<main>
<div class="container-1100 mt-40 mb-40">
	<header>
		<div class="row center">
			<h2>${memberDto.memberName}님 환영합니다</h2>
		</div>
		<div class="row center">
			<h2>
				등급 : ${memberDto.memberGrade}  / 적립금 : ${memberDto.memberPoint}원 / 쿠폰 : ${memberDto.cnt}개  
			</h2>
			<br><br><br>
		</div>
	</header>
	
		<div class="float-container">
			<aside>
				<div class="float-left">
					<div class="row center">
						<div class="row mb-30">
							<h2>마이샐러브</h2>
						</div>
						<hr>
						<div class="font-menu">
							<h3><a href="/mypage/order_list">주문내역</a></h3>
							<h3><a href="/mypage/delivery_list">배송지관리</a></h3>
							<h3><a href="">상품후기</a></h3>
							<h3><a href="/mypage/point" >적립금</a></h3>
							<h3><a href="/mypage/coupon">쿠폰</a></h3>
							<h3><a href="/member/change">내정보수정</a></h3>
							<h3>도움이 필요하신가요?<br><a href="/inquire/list">1:1문의하기</a></h3>
						</div>	
					</div>	
				</div>
			</aside>
		
			<section>
				<div class="float-right w-80">
					<div class="row center">
						<div class="row mb-30">
							<h2>주문 내역</h2>
						</div>
						
						<table class="table table-slit table-border">
							<c:forEach var="paymentListVO" items="${paymentListVO}">
								<thead>
									<tr>
										<th>주문 <br> 번호</th>
										<th>결제 <br> 번호</th>
										<th>상품명</th>
										<th>상품옵션</th>
										<th>구매 <br> 갯수</th>
										<th>결제 <br> 금액</th>
										<th>주문일자</th>
									</tr>
								</thead>
								<tbody>
								    <tr>
									    <td>${paymentListVO.paymentOrderNo}</td>
									    <td>${paymentListVO.paymentNo}</td>
									    <td>${paymentListVO.productName}<br></td>
									    <td class="left" width="350">
									    	<img width=50 height=50 src="/attachment/download/productTumbnail?attachmentNo=${paymentListVO.productAttachmentNo}">${paymentListVO.paymentOption}
									    </td>
									    <td>${paymentListVO.paymentCount}</td>
									    <td>${paymentListVO.paymentPrice}</td>
									    <td>${paymentListVO.orderDate}</td>
								   </tr>
								</tbody>
							</c:forEach>
					    </table>
					    
					</div>
				</div>
			</section>
			
		</div>
		
</div>

</main>
	
		<a href = "/review/write?reviewPaymentNo=134">hello111의 paymentNo=134에 대한 리뷰 작성하기</a>
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