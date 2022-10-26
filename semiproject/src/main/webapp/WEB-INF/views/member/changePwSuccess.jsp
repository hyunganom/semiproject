<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="비밀번호 변경 완료" name="title"/>
</jsp:include>

<style>
	a{
	text-decoration: none;
	}
</style>

<div class="container-500 mt-30">
	<div class="row center">
		<h1>비밀번호 변경 완료</h1>
	</div>
	
	<br>
	
	<div class="row center mb-30">
		<h2>
			<a href="/">
				<i class="fa-solid fa-house"></i> 홈
			</a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="list">
				<i class="fa-regular fa-user"></i> 마이페이지
			</a>
		</h2>
	</div>
</div>

<%-- footer.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>