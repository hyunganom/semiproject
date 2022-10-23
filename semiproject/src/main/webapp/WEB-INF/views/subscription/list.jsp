<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="정기구독" name="title"/>
</jsp:include>

<h1>정기구독 상품목록</h1>
<a href="subscription/detail?productNo=1262">1262상품으로 이동</a>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>