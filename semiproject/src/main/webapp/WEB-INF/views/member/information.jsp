<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- header.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="내 정보 변경" name="title"/>
</jsp:include>

<h1>내 정보 변경</h1>

<form action="information" method="post">
	아이디 : ${memberDto.memberId} <br><br>
	
	이름 : <input type="text" name="memberName" required value="${memberDto.memberName}"> <br><br>
	이메일 : <input type="email" name="memberEmail" required value="${memberDto.memberEmail}"> <br><br>
	전화번호 : <input type="tel" name="memberTel" required value="${memberDto.memberTel}"> <br><br>
	우편번호 : <input type="text" name="memberPost" value="${memberDto.memberPost}"> <br><br>
	기본주소 : <input type="text" name="memberBaseAddress" value="${memberDto.memberBaseAddress}"> <br><br>
	상세주소 : <input type="text" name="memberDetailAddress" value="${memberDto.memberDetailAddress}"> <br><br>

	비밀번호 확인 : <input type="password" name="memberPw" required> <br><br>
	<button type="submit">변경</button>
</form>

<c:if test="${param.error != null}">
	<h2 style="color:red">비밀번호가 틀립니다.</h2>
</c:if>

<%-- footer.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>