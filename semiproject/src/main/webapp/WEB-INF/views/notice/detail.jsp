<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- 관리자 메뉴일 경우와 아닐 경우 다른 헤더를 설정 --%>
<c:choose>
	<c:when test="${mg == '관리자'}">
		<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
			<jsp:param value="${memberDto.memberId} 회원 상세 정보" name="title"/>
		</jsp:include>
	</c:when>
	<c:otherwise>
		<jsp:include page="/WEB-INF/views/template/header.jsp">
			<jsp:param value="${memberDto.memberId} 회원 상세 정보" name="title"/>
		</jsp:include>
	</c:otherwise>
</c:choose>

<style>
/* 확장스타일 : 테두리가 있는 테이블 */
	.table.table-border {
		border:1px solid gray;
	}
	.table.table-border > thead > tr > th, 
	.table.table-border > thead > tr > td, 
	.table.table-border > tbody > tr > th, 
	.table.table-border > tbody > tr > td, 
	.table.table-border > tfoot > tr > th, 
	.table.table-border > tfoot > tr > td {
		border: 1px solid gray;
	}

/* 확장스타일 : 옆트임 테이블 */
	.table.table-slit {
		border: 3px solid gray;
	}
	.table.table-slit > thead {
		border-bottom: 2px solid gray;
	}
	.table.table-slit > tfoot {
		border-top: 2px solid gray;
	}
     
	a{
		text-decoration: none;
	}
	.footer{
		position:fixed;
		bottom:0;
		left:0;
		width:100%;
	}
	/* 테이블 텍스트 가운데 */
	th, td {
    	vertical-align : middle;
    }
    /* 확장 스타일 : 줄무늬 테이블*/
	.table > tbody > tr > th
	{
		background-color: #dfe6e9;
		background: #efefef;
	}
</style>

<div class="container-500 mt-40 mb-40">
	<div class="row center">
		<h1>공지 상세</h1>
		<table class="table table-slit table-border mt-20" border="1" width="450">
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
	
<%-- footer.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>