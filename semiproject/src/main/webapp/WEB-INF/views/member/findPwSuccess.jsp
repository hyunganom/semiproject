<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="비밀번호 찾기 완료" name="title"/>
</jsp:include>

<h1>비밀번호 찾기 완료</h1>

	<h2>찾으시는 비밀번호는 "${memberDto.memberPw}" 입니다.</h2>
	
<h2>
	<a href="login">로그인 페이지로 이동</a>
	<a href="/">메인페이지로 이동</a>
</h2>

<%-- footer.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>