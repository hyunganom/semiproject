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

	<hr>

	
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
				<th><a href = "detail?noticeNo=${list.noticeNo}">${list.noticeTitle}</a></th>
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
	
<!-- 페이지 네비게이터  --> 

		<div class="row center">
		<ul class="pagination">
			<!-- 이전 -->
			<c:choose>
				<c:when test="${not noticeListSearchVO.isFirst()}"> <!-- 맨 처음 페이지가 아니라면  -->
					<li><a href="list?p=${noticeListSearchVO.firstBlock()}&${noticeListSearchVO.parameter()}">&laquo;</a></li> <!-- 첫번째 페이지로 이동  -->
				</c:when>
				<c:otherwise> <!-- 그렇지 않으면  -->
					<li><a href="">&laquo;</a></li> <!-- 페이지 변화 없음  -->
				</c:otherwise>
			</c:choose>
			
			<!-- 이전 구간의 마지막 페이지로 이동 -->			
			<c:choose>
				<c:when test="${noticeListSearchVO.hasPrev()}"> <!-- 이전 페이지가 없다면-->	
					<li><a href="list?p=${noticeListSearchVO.prevBlock()}&${noticeListSearchVO.parameter()}">&lt;</a></li> <!-- 이전 구간의 마지막 페이지로 이동-->	
				</c:when>
				<c:otherwise> <!-- 그렇지 않으면  -->
					<li><a href="">&lt;</a></li> <!-- 페이지 변화 없음  -->
				</c:otherwise>
			</c:choose>
			
			<!-- 현재 구간의 페이지 이동 -->
			<!-- 변수명을 i로 하며 시작과 끝은 noticeListSearchVO의 startBlock(), endBlock()의 반환값으로, 간격은 1로 한다  -->
			<c:forEach var="i" begin="${noticeListSearchVO.startBlock()}" end="${noticeListSearchVO.endBlock()}" step="1">
					<a href = "list?p=${i}&${noticeListSearchVO.parameter()}">${i}</a>
			</c:forEach>
			
			<!-- 다음을 누르면 다음 구간의 첫 페이지로 안내 -->
			<c:choose>
				<c:when test="${noticeListSearchVO.hasNext()}"> <!-- 다음페이지가 있으면  -->
					<li><a href="list?p=${noticeListSearchVO.nextBlock()}&${noticeListSearchVO.parameter()}">&gt;</a></li> <!-- 다음 구간의 첫 페이지로 이동  -->
				</c:when>
				<c:otherwise> <!-- 그렇지 않으면  -->
					<li><a href="">&gt;</a></li> <!-- 페이지 변화 없음  -->
				</c:otherwise>
			</c:choose>
			
			<!-- 맨 마지막 페이지로 이동 -->
			<c:choose>
				<c:when test="${not noticeListSearchVO.isLast()}"> <!-- 맨 마지막 페이지가 아니라면 -->
					<li><a href="list?p=${noticeListSearchVO.lastBlock()}&${noticeListSearchVO.parameter()}">&raquo;</a></li> <!-- 맨 마지막 페이지로 이동 -->
				</c:when>
				<c:otherwise>  <!-- 그렇지 않으면  -->
					<li><a href="">&raquo;</a></li> <!-- 페이지 변화 없음  -->
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	</div>
	
	<!-- 검색창 -->
	<div class="row center">
		<form action="list" method="get">
			<input type="hidden" name="size" value="${noticeListSearchVO.size}">
			<select class="input" name="type" required>
				<option value="notice_title" <c:if test="${noticeListSearchVO.type == 'notice_title'}">selected</c:if>>제목</option>
				<option value="notice_id" <c:if test="${noticeListSearchVO.type == 'notice_title'}">selected</c:if>>작성자</option>
			</select>
			
			<input class="input" type="search" name="keyword" placeholder="검색어" required value="${noticeListSearchVO.keyword}">
			
			<button class="btn btn-positive" type="submit">검색</button>
		</form>
	</div>

</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>


