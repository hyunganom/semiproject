<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- header.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="비밀번호 변경" name="title"/>
</jsp:include>

<h1>비밀번호 변경</h1>

<form action="change_pw" method="post">
	<input type="password" name="beforePw" placeholder="기존 비밀번호" required><br><br>
	<input type="password" name="afterPw" placeholder="변경할 비밀번호" required>
	<button type="submit">변경하기</button>
</form>

<c:if test="${param.error != null}">
	<h2 style="color:red;">잘못된 비밀번호입니다.</h2>
</c:if>

<%-- footer.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>