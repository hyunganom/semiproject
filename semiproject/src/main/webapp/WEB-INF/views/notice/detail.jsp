<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="공지 게시판 글 상세 페이지" name="title"/>
</jsp:include>

<div class = "container-1200">
	<div class = "row center">
	<h1>공지 게시판 글 상세 페이지</h1>
	</div>
	
	<div class = "row center">
		<table>
			<tbody>
				<tr>
					<th>공지글 번호</th>
					<td>${noticeDto.noticeNo}</td>
				</tr>
				<tr>
					<th>공지글 작성자</th>
					<td>${noticeDto.noticeId}</td>
				</tr>
				<tr>
					<th>공지글 제목</th>
					<td>${noticeDto.noticeTitle}</td>
				</tr>
				<tr>
					<th>공지글 내용</th>
					<td>${noticeDto.noticeContent}</td>
				</tr>
				<tr>
					<th>공지글 작성일</th>
					<td>${noticeDto.noticeWritetime}</td>
				</tr>
				<tr>
					<th>공지글 수정일</th>
					<td>$noticeDto.noticeUpdatetime}</td>
				</tr>
				
				<tr>
					<th>공지글 첨부파일</th>
					<td>
						<c:forEach var = "noticeAttachmentList" items = "${noticeAttachmentList}">
							<img width = "50px" height = "50px" src = "/attachment/download/noticeImg?attachmentNo=${inquireAttachmentList.attachmentNo}">
						</c:forEach>
					</td>
				</tr>
				
				<tr>
					<td><a href = "editAdmin?noticeNo=${noticeDto.noticeNo}">수정</a></td>
					<td><a href = "deleteAdmin?noticeNo=${noticeDto.noticeNo}">삭제</a></td>
				</tr>
				
			</tbody>
		</table>
	</div>

</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>