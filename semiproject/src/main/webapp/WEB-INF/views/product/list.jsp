<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
</head>
<body>

<div align = "center">

<table border = "1" width = "1000" >
	<tbody>
		<tr>
			<th>이미지</th>
			<th>상품 번호</th>
			<th>상위 카테고리 번호</th>
			<th>하위 카테고리 번호</th>
			<th>상품 이름</th>
			<th>상품 가격</th>
			<th>상품 정보</th>
			<th>상품 재고</th>
			<th>상품 별점</th>
		</tr>
		<c:forEach var = "productList" items = "${productList}">
		<tr>
			<td><!-- 이미지 다운 -->
				<img width=50 height="50" src="/attachment/download?attachmentNo=${productList.productNo}">
			</td>
			<td>${productList.productNo}</td>
			<td>${productList.categoryHighNo}</td>
			<td>${productList.categoryLowNo}</td>
			<td>
				<a href = "detail?productNo=${productList.productNo}">${productList.productName}</a>
			</td>
			<td>${productList.productPrice}</td>
			<td>${productList.productInformation}</td>
			<td>${productList.productInventory}</td>
			<td>${productList.productGood}</td>
			<td><a href = "edit?productNo=${productList.productNo}">수정</a></td>
			<td><a href = "delete?productNo=${productList.productNo}">삭제</a></td>
		</tr>
		</c:forEach>
	</tbody>	
</table>

<form action = "list" method = "get">
	<%-- 일단 상품명 조회만 추가했으며 차후 테이블 조인을 통해 카테고리 이름으로도 조회가 가능하도록 바꿀 예정 --%>
	<select name = "type">
		<option value = "product_name" <c:if test = "${productListSearchVO.type == 'product_name'}">selected</c:if>>상품명</option>
	</select>
	<input name = "keyword">
	<button type = "submit">검색</button>
</form>

</div>

</body>
</html>