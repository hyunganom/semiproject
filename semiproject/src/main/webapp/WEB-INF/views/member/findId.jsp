<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- header.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="아이디 찾기" name="title"/>
</jsp:include>

	<div align="cemter">
		<h1>아이디 찾기</h1>
		<form action="find_id" method="post">
			<input type="text" name="memberName" placeholder="이름" required><br><br>
			<input type="email" name="memberEmail" placeholder="이메일" required><br><br>
			<button type="submit">아이디 찾기</button>
		</form>
		
		<c:if test="${param.error != null}">
			<h2 style="color:red">일치하는 정보가 없습니다.</h2>
		</c:if>
	</div>

<%-- footer.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>