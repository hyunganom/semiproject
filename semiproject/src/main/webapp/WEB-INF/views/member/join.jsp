<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%-- header.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원가입" name="title"/>
</jsp:include>

	<h1>회원가입 정보 입력</h1>
	<form action="join" method="post">
		아이디 <input name="memberId" type="text" required> <br><br>
		비밀번호 <input name="memberPw" type="password" required> <br><br>
		이름 <input name="memberName" type="text" required> <br><br>
		이메일 <input name="memberEmail" type="email" required> <br><br>
		전화번호 <input name="memberTel" type="tel" required> <br><br>
		우편번호 <input name="memberPost" type="text"> <br><br>
		기본주소 <input name="memberBaseAddress" type="text"> <br><br>
		상세주소 <input name="memberDetailAddress" type="text"> <br><br>
		생년월일 <input name="memberBirth" type="date"> <br><br>
		성별 
			<input type="radio" name="memberGender" value="남자"> 남자
			<input type="radio" name="memberGender" value="여자"> 여자
		
		<button type="submit">가입하기</button>
	</form>
	
<%-- footer.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>