<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- header.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="리뷰 작성" name="title"/>
</jsp:include>

<div class = "container-1200">
	<div class = "row center">
	<h1>리뷰 상세 페이지</h1>
	</div>
	
	<div class = "row center">
		<table>
			<tbody>
				<tr>
					<th>리뷰 번호</th>
					<td>${reviewDto.reviewNo}</td>
				</tr>
				<tr>
					<th>리뷰 작성자</th>
					<td>${reviewDto.reviewId}</td>
				</tr>
				<tr>
					<th>리뷰 제목</th>
					<td>${reviewDto.reviewTitle}</td>
				</tr>
				<tr>
					<th>리뷰 내용</th>
					<td>${reviewDto.reviewContent}</td>
				</tr>
				<tr>
					<th>리뷰 작성일</th>
					<td>${reviewDto.reviewWritetime}</td>
				</tr>
				<tr>
					<th>리뷰 수정일</th>
					<td>${reviewDto.reviewUpdatetime}</td>
				</tr>
				<tr>
					<th>리뷰 삭제 상태</th>
					<td>${reviewDto.reviewInactive}</td>
				</tr>
				<tr>
					<th>리뷰 첨부파일</th>
					<td>
						<c:forEach var = "reviewAttachmentList" items = "${reviewAttachmentList}">
							<img width = "50px" height = "50px" src = "/attachment/download/inquireImg?attachmentNo=${reviewAttachmentList.attachmentNo}">
						</c:forEach>
					</td>
				</tr>
				
				<tr>
					<td><a href = "#">관리자블라인드?</a></td>
				</tr>
				
			</tbody>
		</table>
		
		<hr><!-- 여기부턴 댓글 목록 -->
		
		<div class = "row">
			<h1>1:1 문의 댓글 목록</h1>
		</div>
		
		<div class="container-1200 row">
			<table class="table table-border">
				<c:forEach var="inquireReplyList" items="${inquireReplyList}">
					<tr class="view">
						<td class="left w-100">
							(${inquireReplyList.memberName})
							<br>
							<pre>${inquireReplyList.inquireReplyContent}</pre>
						</td>
						<!-- 댓글 수정 -->
						<td>
							<a class="edit-btn">수정</a>
						</td>
						<!-- 댓글 삭제 -->
						<td>
							<a href="inquireReply/delete?inquireReplyNo=${inquireReplyList.inquireReplyNo}&inquireOriginNo=${inquireDto.inquireNo}">삭제</a>
						</td>
					</tr>
					
					<!-- 댓글 수정창 -->
					<tr class = "editor"> <%-- class 이름을 editor로 변경 --%>
						<th colspan = "2">
							<form action = "inquireReply/edit" method = "post"><!-- 컨트롤러에 댓글수정 -->
								<input type = "hidden" name = "inquireReplyNo" value = "${inquireReplyList.inquireReplyNo}"><!-- 1:1문의 원본글 번호 -->
								<input type = "hidden" name = "inquireOriginNo" value = "${inquireDto.inquireNo}"><!-- 댓글 번호 -->
								<textarea name = "inquireReplyContent" rows = "5" cols = "50" required></textarea>
								<button type = "submit">변경</button>
								<a class = "cancel-btn">취소</a>
							</form>
						</th>
					</tr>
					
				</c:forEach>
			</table>
		</div>
		
	</div>
</div>
<%-- footer.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
