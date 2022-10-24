<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="1:1 문의글 목록" name="title"/>
</jsp:include>

<div class = "container-1200">

	<div class = "row">
		<h1>1:1 문의글 목록</h1>
	</div>
	
	<div class = "row right">
		<a href = "write">등록</a>
	</div>
	
	<div class = "row">
	<table border = "1" width = "1200">
		<tbody>
			<tr>
				<th>문의글 번호</th>
				<th>문의글 작성자</th>
				<th>문의글 제목</th>
				<th>문의글 내용</th>
				<th>문의글 작성일</th>
				<th>문의글 수정일</th>
				<th>문의글 답변 상태</th>
				<th>문의글 삭제 상태</th>
				<th colspan = "3">기능(임시로 표시)</th>
			</tr>
			
			<c:forEach var = "inquireList" items = "${inquireList}">
			<tr>
				<th>${inquireList.inquireNo}</th>
				<th>${inquireList.inquireId}</th>
				<th><a href = "detail?inquireNo=${inquireList.inquireNo}">${inquireList.inquireTitle}</a></th>
				<th>${inquireList.inquireContent}</th>
				<th>${inquireList.inquireWritetime}</th>
				<th>${inquireList.inquireUpdatetime}</th>
				<th>${inquireList.inquireHasReply}</th>
				<th>${inquireList.inquireInactive}</th>
				<th><a href = "edit?inquireNo=${inquireList.inquireNo}">수정</a></th>
				<th><a href = "delete?inquireNo=${inquireList.inquireNo}">삭제(UPDATE)</a></th>
				<th><a href = "deleteAdmin?inquireNo=${inquireList.inquireNo}">삭제(DELETE)</a></th>
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