<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="공지 게시판 글 목록" name="title"/>
</jsp:include>

<div class = "container-1200">

	<div class = "row">
		<h1>공지 게시판 글 목록</h1>
	</div>
	
	<div class = "row right">
		<a href = "write">등록</a>
	</div>
	
	<div class = "row">
	<table border = "1" width = "1200">
		<tbody>
			<tr>
				<th>공지 번호</th>
				<th>공지 작성자</th>
				<th>공지 제목</th>
				<th>공지 내용</th>
				<th>공지 작성일</th>
				<th>공지 수정일</th>
				<th colspan = "3">기능(임시로 표시)</th>
			</tr>
			
			<c:forEach var = "noticeList" items = "${noticeList}">
			<tr>
				<th>${noticeList.noticeNo}</th>
				<th>${noticeList.noticeId}</th>
				<th><a href = "detail?inquireNo=${noticeList.noticeNo}">${noticeList.noticeTitle}</a></th>
				<th>${noticeList.noticeContent}</th>
				<th>${noticeList.noticeWritetime}</th>
				<th>${noticeList.noticeUpdatetime}</th>
				<th><a href = "editAdmin?noticeNo=${noticeList.noticeNo}">수정</a></th>
				<th><a href = "deleteAdmin?noticeNo=${noticeList.noticeNo}">삭제</a></th>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div class = "row right">
		<a href = "write">등록</a>
	</div>
	
	</div>

</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>