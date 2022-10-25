<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="공지 게시판" name="title"/>
</jsp:include>

<div class = "container-1200">

	<div class = "row center">
		<h1>NOTICE</h1>
	</div>

	
	<div class = "row">
	<table border = "1" width = "1200">
		<tbody>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			
			<c:forEach var = "list" items = "${list}">
			<tr>
				<th>${list.noticeNo}</th>
				<th><a href = "detail?inquireNo=${list.noticeNo}">${list.noticeTitle}</a></th>
				<th>${list.noticeId}</th>
				<th>${list.noticeWritedate}</th>
				<th>${list.noticeRead}</th>
				<th><a href = "editAdmin?noticeNo=${list.noticeNo}">수정</a></th>
				<th><a href = "deleteAdmin?noticeNo=${list.noticeNo}">삭제</a></th>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<hr>
	
	<div class = "row right">
		<a href = "write">등록</a>
	</div>
	
	</div>

</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>