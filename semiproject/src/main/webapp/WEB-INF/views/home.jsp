<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 홈페이지</title>
</head>
<body>
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
	
</body>
</html>