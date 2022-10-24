<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="공지 게시판 글 수정 페이지" name="title"/>
</jsp:include>


<div class = "container-900">

	<div class = "row">
		<h1>공지 게시판 글 수정 페이지</h1>		
	</div>
	
	<form action = "editAdmin" method = "post">
		<input type = "hidden" name = "noticeNo" value = "${noticeDto.noticeNo}">
		<div class = "row">
			<p>제목 : <input name = "noticeTitle" value = "${noticeDto.noticeTitle}"></p>
		</div>
		
		<div class = "row">
			<p>내용</p>
			<textarea name = "inquireContent">${noticeDto.noticeContent}</textarea>
		</div>
		<div>
			<button type = "submit">수정</button>
		</div>
	</form>

</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>