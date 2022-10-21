<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- header.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원정보 변경 실패" name="title"/>
</jsp:include>

	<div align="center">
		<h1>존재하지 않는 회원입니다.</h1>
		<h2><a href="list">목록 보기</a></h2>
	</div>
	
<%-- footer.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>