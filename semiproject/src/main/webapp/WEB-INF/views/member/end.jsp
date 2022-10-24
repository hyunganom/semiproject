<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- header.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="비밀번호 확인" name="title"/>
</jsp:include>

<h1>비밀번호 확인</h1>

<form action="end" method="post">
	<input type="password" name="memberPw" required>
	<button type="submit">탈퇴하기</button>
</form>

<%-- footer.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>