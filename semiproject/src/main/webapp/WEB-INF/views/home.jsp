<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- header.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="메인페이지" name="title"/>
</jsp:include>

	<h1>샐러드</h1>
	
	<h2>loginId = ${sessionScope.loginId}</h2>
	<h2>로그인 상태 = ${loginId != null}</h2>
	<c:set var="login" value="${loginId != null}"></c:set>
	
	<c:choose>
		<c:when test="${login}">
			<h2><a href="member/list">회원 목록</a></h2>
			<h2><a href="member/logout">회원 로그아웃</a></h2>
		</c:when>
		<c:otherwise>
			<h2><a href="member/join">회원 가입</a></h2>
			<h2><a href="member/login">회원 로그인</a></h2>
		</c:otherwise>
	</c:choose>
	
	<h2><a href="basket">장바구니</a></h2>
	
<%-- footer.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>