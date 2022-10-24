<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="1:1 문의글 목록" name="title"/>
</jsp:include>

<div class = "container-1200">

<%-- 검색창 --%>
<form action = "listAdmin" method = "get">
	<%-- 일단 상품명 조회만 추가했으며 차후 테이블 조인을 통해 카테고리 이름으로도 조회가 가능하도록 바꿀 예정 --%>
	<select name = "type">
		<option value = "inquire_title" <c:if test = "${inquireListSearchVO.type == 'inquire_title'}">selected</c:if>>상품명</option>
	</select>
	<input name = "keyword" value = "${inquireListSearchVO.keyword}">
	<button type = "submit">검색</button>
</form>

	<div class = "row">
		<h1>1:1 문의글 목록</h1>
	</div>
	
	${inquireListSearchVO}
	
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
	
<%-- 페이지 이동 --%>
<div class = "row">
	<%-- 첫 페이지인지 판정 --%>
	<c:choose>
		<c:when test = "${inquireListSearchVO.isFirst()}"> <%-- 첫 페이지라면 --%>
			<a href = "">&laquo;</a>  <%-- 현재 주소 유지 --%>
		</c:when>
		<c:otherwise> <%-- 그렇지 않다면(첫 페이지가 아니라면) --%>
			<a href = "listAdmin?pageNow=${inquireListSearchVO.blockFirst()}">&laquo;</a> <%-- 첫 페이지로 이동 --%>
		</c:otherwise>
	</c:choose>
	
	<%-- 이전 페이지의 존재 여부 판정 --%>
	<c:choose>
		<c:when test = "${inquireListSearchVO.hasPrev()}"> <%-- 이전 페이지가 존재한다면 --%>
			<a href = "listAdmin?pageNow=${inquireListSearchVO.blockPrev()}&${inquireListSearchVO.queryString()}">&lt;</a> <%-- 이전 페이지로 이동 --%>
		</c:when>
		<c:otherwise> <%-- 그렇지 않다면(이전 페이지가 존재하지 않는다면) --%>
			<a href = "#">&lt;</a> <%-- 현재 주소 유지 --%>
		</c:otherwise>
	</c:choose>
	
	<%-- 페이지 블럭 표시 --%>
	<c:forEach var = "i" begin = "${inquireListSearchVO.blockStart()}" end = "${inquireListSearchVO.blockEnd()}" step = "1">
		<a href = "listAdmin?pageNow=${i}&${inquireListSearchVO.queryString()}">${i}</a>
	</c:forEach>
	
	<%-- 다음 페이지의 존재 여부 판정 --%>
	<c:choose>
		<c:when test = "${inquireListSearchVO.hasNext()}"> <%-- 다음 페이지가 존재한다면 --%>
			<a href = "listAdmin?pageNow=${inquireListSearchVO.blockNext()}&${inquireListSearchVO.queryString()}">&gt;</a> <%-- 다음 페이지로 이동 --%>
		</c:when>
		<c:otherwise> <%-- 그렇지 않다면(다음 페이지가 존재하지 않는다면) --%>
			<a href = "">&gt;</a> <%-- 현재 주소 유지 --%>
		</c:otherwise>
	</c:choose>
	
	<%-- 마지막 페이지인지 판정 --%>
	<c:choose>
		<c:when test = "${inquireListSearchVO.isLast()}"> <%-- 마지막 페이지라면 --%>
			<a href = "#">&raquo;</a> <%-- 현재 주소 유지 --%>
		</c:when>
		<c:otherwise>
			<a href = "listAdmin?pageNow=${inquireListSearchVO.blockLast()}&${inquireListSearchVO.queryString()}">&raquo;</a>
		</c:otherwise>
	</c:choose>
</div>
	<div class = "row right">
		<a href = "write">등록</a>
	</div>
	
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>