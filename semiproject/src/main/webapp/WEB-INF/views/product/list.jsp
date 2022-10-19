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

<table border = "1" width = "900">
	<tbody>
		<tr>
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
			<td>${productList.productNo}</td>
			<td>${productList.categoryHighNo}</td>
			<td>${productList.categoryLowNo}</td>
			<td>${productList.productName}</td>
			<td>${productList.productPrice}</td>
			<td>${productList.productInformation}</td>
			<td>${productList.productInventory}</td>
			<td>${productList.productGood}</td>
		</tr>
		</c:forEach>
	</tbody>	
</table>

</div>


</body>
</html>