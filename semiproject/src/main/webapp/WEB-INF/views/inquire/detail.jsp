<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="1:1 문의글 상세 페이지" name="title"/>
</jsp:include>

<div class = "container-1200">
	<div class = "row center">
	<h1>1:1 문의 상세 페이지</h1>
	</div>
	
	<div class = "row center">
		<table>
			<tbody>
				<tr>
					<th>문의글 번호</th>
					<td>${inquireDto.inquireNo}</td>
				</tr>
				<tr>
					<th>문의글 작성자</th>
					<td>${inquireDto.inquireId}</td>
				</tr>
				<tr>
					<th>문의글 제목</th>
					<td>${inquireDto.inquireTitle}</td>
				</tr>
				<tr>
					<th>문의글 내용</th>
					<td>${inquireDto.inquireContent}</td>
				</tr>
				<tr>
					<th>문의글 작성일</th>
					<td>${inquireDto.inquireWritetime}</td>
				</tr>
				<tr>
					<th>문의글 수정일</th>
					<td>${inquireDto.inquireUpdatetime}</td>
				</tr>
				
				<tr>
					<th>문의글 첨부파일</th>
					<td>
						<c:forEach var = "inquireAttachmentList" items = "${inquireAttachmentList}">
							<img width = "50px" height = "50px" src = "/attachment/download/inquireImg?attachmentNo=${inquireAttachmentList.attachmentNo}">
						</c:forEach>
					</td>
				</tr>
				
				<tr>
					<td><a href = "edit?inquireNo=${inquireDto.inquireNo}">수정</a></td>
					<td><a href = "inactive?inquireNo=${inquireDto.inquireNo}">삭제(비활성화)</a></td>
					<td><a href = "delete?inquireNo=${inquireDto.inquireNo}">삭제</a></td>
				</tr>
				
			</tbody>
		</table>
	</div>

</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>