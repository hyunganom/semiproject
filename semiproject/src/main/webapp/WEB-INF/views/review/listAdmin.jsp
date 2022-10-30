<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class = "container-1200">

<%-- 검색창 --%>
<form action = "adminList" method = "get">
	<%-- 일단 상품명 조회만 추가했으며 차후 테이블 조인을 통해 카테고리 이름으로도 조회가 가능하도록 바꿀 예정 --%>
	<select name = "type">
		<option value = "review_title" <c:if test = "${reviewListSearchVO.type == 'review_title'}">selected</c:if>>리뷰제목</option>
	</select>
	<input name = "keyword" value = "${reviewListSearchVO.keyword}">
	<button type = "submit">검색</button>
</form>

	<div class = "row">
		<h1>리뷰 목록</h1>
	</div>
	
	${reviewListSearchVO}
	
	<div class = "row">
	<table border = "1" width = "1200">
		<tbody>
			<tr>
				<th>리뷰 번호</th>
				<th>리뷰 작성자</th>
				<th>리뷰 제목</th>
				<th>리뷰 내용</th>
				<th>리뷰 작성일</th>
				<th>리뷰 수정일</th>
				<th colspan = "3">기능(임시로 표시)</th>
			</tr>
			
			<c:forEach var = "reviewList" items = "${reviewList}">
			<tr>
				<th>${reviewList.reviewNo}</th>
				<th>${reviewList.reviewId}</th>
				<th>${reviewList.reviewTitle}</th>
				<th>${reviewList.reviewContent}</th>
				<th>${reviewList.reviewWritetime}</th>
				<th>${reviewList.reviewUpdatetime}</th>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
<%-- 페이지 이동 --%>
<div class = "row">
	<%-- 첫 페이지인지 판정 --%>
	<c:choose>
		<c:when test = "${reviewListSearchVO.isFirst()}"> <%-- 첫 페이지라면 --%>
			<a href = "">&laquo;</a>  <%-- 현재 주소 유지 --%>
		</c:when>
		<c:otherwise> <%-- 그렇지 않다면(첫 페이지가 아니라면) --%>
			<a href = "listAdmin?pageNow=${reviewListSearchVO.blockFirst()}">&laquo;</a> <%-- 첫 페이지로 이동 --%>
		</c:otherwise>
	</c:choose>
	
	<%-- 이전 페이지의 존재 여부 판정 --%>
	<c:choose>
		<c:when test = "${reviewListSearchVO.hasPrev()}"> <%-- 이전 페이지가 존재한다면 --%>
			<a href = "listAdmin?pageNow=${reviewListSearchVO.blockPrev()}&${reviewListSearchVO.queryString()}">&lt;</a> <%-- 이전 페이지로 이동 --%>
		</c:when>
		<c:otherwise> <%-- 그렇지 않다면(이전 페이지가 존재하지 않는다면) --%>
			<a href = "#">&lt;</a> <%-- 현재 주소 유지 --%>
		</c:otherwise>
	</c:choose>
	
	<%-- 페이지 블럭 표시 --%>
	<c:forEach var = "i" begin = "${reviewListSearchVO.blockStart()}" end = "${reviewListSearchVO.blockEnd()}" step = "1">
		<a href = "listAdmin?pageNow=${i}&${reviewListSearchVO.queryString()}">${i}</a>
	</c:forEach>
	
	<%-- 다음 페이지의 존재 여부 판정 --%>
	<c:choose>
		<c:when test = "${reviewListSearchVO.hasNext()}"> <%-- 다음 페이지가 존재한다면 --%>
			<a href = "listAdmin?pageNow=${reviewListSearchVO.blockNext()}&${reviewListSearchVO.queryString()}">&gt;</a> <%-- 다음 페이지로 이동 --%>
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
			<a href = "listAdmin?pageNow=${reviewListSearchVO.blockLast()}&${reviewListSearchVO.queryString()}">&raquo;</a>
		</c:otherwise>
	</c:choose>
</div>
	
	</div>
</div>

