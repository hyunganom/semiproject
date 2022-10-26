<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="공지 게시판 글 상세 페이지" name="title"/>
</jsp:include>

<div class = "container-1200">
	<div class = "row center">
	<h1>공지 상세 페이지</h1>
	</div>
	<hr>
	
	<div class = "row center">
		<table>
			<tbody>
				<tr>
					<th>공지 번호</th>
					<td>${noticeDto.noticeNo}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${noticeDto.noticeId}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${noticeDto.noticeTitle}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${noticeDto.noticeContent}</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${noticeDto.noticeWritedate}</td>
				</tr>
				<tr>
					<th>수정일</th>
					<td>${noticeDto.noticeUpdatedate}</td>
				</tr>
				<tr>
					<td>조회수</td>
					<td>${noticeDto.noticeRead}</td>
				
				</tr>
				
				<tr>
					<td><a href = "editAdmin?noticeNo=${noticeDto.noticeNo}">수정</a></td>
					<td><a href = "deleteAdmin?noticeNo=${noticeDto.noticeNo}">삭제</a></td>
					<td><a href = "/notice/list">목록으로</a></td>
				</tr>
				
			</tbody>
		</table>
	</div>

</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>