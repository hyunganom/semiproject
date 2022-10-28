<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
				<h3>등급 : ${memberDto.memberGrade}  / 적립금 : ${memberDto.memberPoint}원 / 쿠폰 :${couponUsable}개  </h3>
			 <hr>
		</div>
	</div>
	

	
	<div class="row">
	<table class="table table-slit table-hover table-border">
		<thead>
			<tr>
				<th>No</th>
				<th>쿠폰명</th>
				<th>할인금액</th>
				<th>조건</th>
				<th>발급일</th>
				<th>만료일</th>
				<th>사용일</th>
				<th>사용여부</th>
			</tr>
		</thead>
		<tbody class="center">
			<c:forEach var = "couponList" items = "${couponList}">
			<tr>
				<td>${couponList.couponNo}</td>
				<td>${couponList.couponName}</td>
				<td>${couponList.couponDiscount}</td>
				<td>${couponList.couponInfo}</td>
				<td>${couponList.couponStartdate}</td>
				<td>${couponList.couponEnddate}</td>
				<td>${couponList.couponUseDate}</td>
				<td>${couponList.couponValid}</td>
			</tr>
			</c:forEach>
		</tbody>	
		<tfoot>
		</tfoot>
	</table>
	</div>


    	
    

</body>
</html>
    
    <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>