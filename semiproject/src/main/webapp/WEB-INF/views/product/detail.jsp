<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="상품 상세 페이지" name="title"/>
</jsp:include>

<div align = "center">
<table>
<tbody>
	<tr>
		<th>상품 번호</th>
		<td>${productDto.productNo}</td>
	</tr>
	<tr>
		<th>상위 카테고리 번호</th>
		<td>${productDto.categoryHighNo}</td>
	</tr>
	<tr>
		<th>하위 카테고리 번호</th>
		<td>${productDto.categoryLowNo}</td>
	</tr>
	<tr>
		<th>상품 이름</th>
		<td>${productDto.productName}</td>
	</tr>
	<tr>
		<th>상품 가격</th>
		<td>${productDto.productPrice}</td>
	</tr>
	<tr>
		<th>상품 정보</th>
		<td>${productDto.productInformation}</td>
	</tr>
	<tr>
		<th>상품 재고</th>
		<td>${productDto.productInventory}</td>
	</tr>
	<tr>
		<th>상품 별점</th>
		<td>${productDto.productGood}</td>
	</tr>
	<tr>
		<th>상품 등록일</th>
		<td>${productDto.productRegisttime}</td>
	</tr>
	<tr>
		<th>상품 수정일</th>
		<td>${productDto.productUpdatetime}</td>
	</tr>
	<tr>
		<th>상품 상태</th>
		<td>${productDto.productInactive}</td>
	</tr>
	<tr>
		<th>상품이미지</th>
		<td>
			<c:forEach var="productTumbnailList" items="${productTumbnailList}">
			<img width=50 height=50 src="/attachment/download/productTumbnail?attachmentNo=${productTumbnailList.attachmentNo}">
			</c:forEach>
		</td>
	<tr>
		<th>상품상세이미지</th>
		<td>
			<c:forEach var="productDetailList" items="${productDetailList}">
			<img width=50 height=50 src="/attachment/download/productDetail?attachmentNo=${productDetailList.attachmentNo}">
			</c:forEach>
		</td>
	</tr>
</tbody>
</table>

<div class = "row">
	<form action = "" method = "post">
		<input type = "hidden" name = "${productDto.productNo}"> <%-- 상품 번호 --%>
		<input type = "number" name = "basketCountNumber" placeholder = "수량">
		<button class = "btn btn-positive" type = "submit">구매</button>
	</form>
</div>

<div class = "row">	
	<form action = "" method = "post">
		<input type = "hidden" name = "${productDto.productNo}"> <%-- 상품 번호 --%>
		<input type = "number" name = "basketCountNumber" placeholder = "수량">
		<button class = "btn btn-positive" type = "submit">장바구니</button>
	</form>
</div>

</div>

</body>
</html>