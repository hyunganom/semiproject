<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="상품 상세페이지" name="title"/>
</jsp:include>

<h1>상품 상세페이지</h1>

<form action="detail" method="post">

<input type="hidden" name="basketCountNumber" value="1">
<input type="hidden" name="basketProductNo" value="1262">
<input type="hidden" name="basketId" value="${loginId}">

<input type="text" name="basketProductOption" value="4">
<input type="text" name="basketProductOption" value="33">
<input type="text" name="basketProductOption" value="35">
<input type="text" name="basketProductOption" value="33">
<input type="text" name="basketProductOption" value="39">
<input type="text" name="basketProductOption" value="41">
<input type="text" name="basketProductOption" value="35">
<input type="text" name="basketProductOption" value="33">

<button type="submit">장바구니 넣기</button>

</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>