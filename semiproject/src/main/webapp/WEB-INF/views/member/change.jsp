<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- header.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원정보 변경" name="title"/>
</jsp:include>

	<div align="center">
		<h1>회원정보 변경</h1>
		
		<form action="change" method="post">
			<input type="hidden" name="memberId" value="${memberDto.memberId}">
			이름 : <input type="text" name="memberName" value="${memberDto.memberName}" required> <br><br>
			이메일 : <input type="email" name="memberEmail" value="${memberDto.memberEmail}" required> <br><br>
			전화번호 : <input type="tel" name="memberTel" value="${memberDto.memberTel}" required> <br><br>
			주소 : <input type="text" name="memberPost" value="${memberDto.memberPost}" placeholder="우편번호" size="6" maxlength="6"> <br><br>
			<input type="text" name="memberBaseAddress" value="${memberDto.memberBaseAddress}" placeholder="기본주소">
			<input type="text" name="memberDetailAddress" value="${memberDto.memberDetailAddress}" placeholder="상세주소"> <br><br>
			등급 : 
			<c:choose>
				<c:when test="${memberDto.memberGrade == '일반'}">
					<input type="radio" name="memberGrade" value="일반" checked> 일반
				</c:when>
				<c:otherwise>
					<input type="radio" name="memberGrade" value="일반"> 일반
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${memberDto.memberGrade == 'VIP'}">
					<input type="radio" name="memberGrade" value="VIP" checked> VIP
				</c:when>
				<c:otherwise>
					<input type="radio" name="memberGrade" value="VIP"> VIP
				</c:otherwise>
			</c:choose>
			<br><br>
			포인트 : <input type="number" name="memberPoint" value="${memberDto.memberPoint}"><br><br>
			<button type="submit">수정</button>
		</form>
	</div>
	
<%-- footer.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>