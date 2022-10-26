<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="상품 목록 페이지" name="title"/>
</jsp:include>

<div align = "center">

<%-- 검색창 --%>
<form action = "category" method = "get">
	<%-- 카테고리 번호를 입력받아 조회해야하므로 검색을 위해 form에서 값을 보낼 때 하이퍼링크에서 입력받았던 카테고리 번호도 보내야 한다 --%>
	<input type = "hidden" name = "categoryHighNo" value = "${productListSearchCategoryVO.categoryHighNo}">
	<input type = "hidden" name = "categoryLowNo" value = "${productListSearchCategoryVO.categoryLowNo}">
	<select name = "type">
		<option value = "product_name" <c:if test = "${productListSearchCategoryVO.type == 'product_name'}">selected</c:if>>상품명</option>
	</select>
	<input name = "keyword" value = "${productListSearchCategoryVO.keyword}">
	<button type = "submit">검색</button>
</form>

<div class = "container-1200">
	
	<div class = "row">
		<a><img></a>
	</div>

</div>

<table border = "1" width = "1000" >
	<tbody>
		
		<c:forEach var = "productList" items = "${productList}">
		<tr>
			<td>구독상품인가 : ${productList.categoryHighSub}</td>
			<td>번호 : ${productList.productNo}</td>
			<td>
				<a href = "detail?productNo=${productList.productNo}">${productList.productName}</a>
			</td>
			<td>${productList.productPrice}</td>
			<td>${productList.productGood}</td>
			<td>${productList.productInactive}</td>
			<td><img width=50 height=50 src="/attachment/download/productTumbnail?attachmentNo=${productList.attachmentNo}"></td>
		</tr>
		</c:forEach>
		
	</tbody>	
</table>

<%-- 페이지 이동 --%>
<div class = "row">
	<%-- 첫 페이지인지 판정 --%>
	<c:choose>
		<c:when test = "${productListSearchCategoryVO.isFirst()}"> <%-- 첫 페이지라면 --%>
			<a href = "">&laquo;</a>  <%-- 현재 주소 유지 --%>
		</c:when>
		<c:otherwise> <%-- 그렇지 않다면(첫 페이지가 아니라면) --%>
			<a href = "category?pageNow=${productListSearchCategoryVO.blockFirst()}&${productListSearchCategoryVO.queryString()}">&laquo;</a> <%-- 첫 페이지로 이동 --%>
		</c:otherwise>
	</c:choose>
	
	<%-- 이전 페이지의 존재 여부 판정 --%>
	<c:choose>
		<c:when test = "${productListSearchCategoryVO.hasPrev()}"> <%-- 이전 페이지가 존재한다면 --%>
			<a href = "category?pageNow=${productListSearchCategoryVO.blockPrev()}&${productListSearchCategoryVO.queryString()}">&lt;</a> <%-- 이전 페이지로 이동 --%>
		</c:when>
		<c:otherwise> <%-- 그렇지 않다면(이전 페이지가 존재하지 않는다면) --%>
			<a href = "#">&lt;</a> <%-- 현재 주소 유지 --%>
		</c:otherwise>
	</c:choose>
	
	<%-- 페이지 블럭 표시 --%>
	<c:forEach var = "i" begin = "${productListSearchCategoryVO.blockStart()}" end = "${productListSearchCategoryVO.blockEnd()}" step = "1">
		<a href = "category?pageNow=${i}&${productListSearchCategoryVO.queryString()}">${i}</a>
	</c:forEach>
	
	<%-- 다음 페이지의 존재 여부 판정 --%>
	<c:choose>
		<c:when test = "${productListSearchCategoryVO.hasNext()}"> <%-- 다음 페이지가 존재한다면 --%>
			<a href = "category?pageNow=${productListSearchCategoryVO.blockNext()}&${productListSearchCategoryVO.queryString()}">&gt;</a> <%-- 다음 페이지로 이동 --%>
		</c:when>
		<c:otherwise> <%-- 그렇지 않다면(다음 페이지가 존재하지 않는다면) --%>
			<a href = "">&gt;</a> <%-- 현재 주소 유지 --%>
		</c:otherwise>
	</c:choose>
	
	<%-- 마지막 페이지인지 판정 --%>
	<c:choose>
		<c:when test = "${productListSearchCategoryVO.isLast()}"> <%-- 마지막 페이지라면 --%>
			<a href = "#">&raquo;</a> <%-- 현재 주소 유지 --%>
		</c:when>
		<c:otherwise>
			<a href = "category?pageNow=${productListSearchCategoryVO.blockLast()}&${productListSearchCategoryVO.queryString()}">&raquo;</a>
		</c:otherwise>
	</c:choose>
</div>

</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>