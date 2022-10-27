<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="아이디 찾기 완료" name="title"/>
</jsp:include>

<style>
	a{
	text-decoration: none;
	}
	.footer{
		position:fixed;
		bottom:0;
		left:0;
		width:100%;
	}
</style>

<div class="container-500 mt-50">
	<div class="row center">
		<h1>아이디 찾기 완료</h1>
	</div>
	
	<br>
	
	<div class="row center">
		<h2>찾으시는 아이디는 "${memberDto.memberId}" 입니다.</h2>
	</div>
	
	<br><br><br>
	
	<div class="row center mb-30">
		<h2>
			<a href="login">
				<i class="fa-solid fa-seedling"></i> 로그인
			</a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="find_pw">
				<i class="fa-solid fa-key"></i> 비밀번호 찾기
			</a>
		</h2>
	</div>
</div>

<%-- footer.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>