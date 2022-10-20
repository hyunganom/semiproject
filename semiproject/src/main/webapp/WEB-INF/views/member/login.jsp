<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그인</title>
</head>
<body>
	<div align="cemter">
		<h1>회원 로그인</h1>
		<form action="login" method="post">
			<input type="text" name="memberId" placeholder="아이디" required><br><br>
			<input type="password" name="memberPw" placeholder="비밀번호" required><br><br>
			<button type="submit">로그인</button>
		</form>
		
		<c:if test="${param.error != null}">
			<h2 style="color:red">입력한 정보가 맞지 않습니다.</h2>
		</c:if>
	</div>
</body>
</html>