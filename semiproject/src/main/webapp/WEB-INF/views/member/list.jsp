<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- header.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원 목록" name="title"/>
</jsp:include>

<style>
	a{
	text-decoration: none;
	}
	
	/* 확장 스타일 : 줄무늬 테이블*/
    .table.table-slit > thead > tr,
    .table.table-slit > tfoot > tr{
    	background-color: #dfe6e9;
    }
</style>

	<div class="container-1100 mt-40 mb-40">
		<div class="row center">
			<h1>회원 조회</h1>
		</div>
		
		<div class="row center">
		<form action="list" method="get">
			<c:choose>
				<c:when test="${param.type == 'member_name'}">
					<select name="type" required>
						<option value="member_id">아이디</option>
						<option value="member_name" selected>이름</option>
						<option value="member_tel">전화번호</option>
						<option value="member_grade">등급</option>
					</select>
				</c:when>
				<c:when test="${param.type == 'member_tel'}">
					<select name="type" required>
						<option value="member_id">아이디</option>
						<option value="member_name">이름</option>
						<option value="member_tel" selected>전화번호</option>
						<option value="member_grade">등급</option>
					</select>
				</c:when>
				<c:when test="${param.type == 'member_grade'}">
					<select name="type" required>
						<option value="member_id">아이디</option>
						<option value="member_name">이름</option>
						<option value="member_tel">전화번호</option>
						<option value="member_grade" selected>등급</option>
					</select>
				</c:when>
				<c:otherwise>
					<select name="type" required>
						<option value="member_id" selected>아이디</option>
						<option value="member_name">이름</option>
						<option value="member_tel">전화번호</option>
						<option value="member_grade">등급</option>
					</select>
				</c:otherwise>
			</c:choose>
			
			<input type="search" name="keyword" required value="${param.keyword}">
			
			<button type="submit">검색</button>
		</form>
		</div>
		
		<div class="row">
		<table class="table table-slit table-hover table-border"> <!-- border="1" width="1000"> -->
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>생년월일</th>
					<th>성별</th>
					<th>등급</th>
					<th>메뉴</th>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach var="memberDto" items="${list}">
				<tr>
					<td>${memberDto.memberId}</td>
					<td>${memberDto.memberName}</td>
					<td>${memberDto.memberEmail}</td>
					<td>${memberDto.memberTel}</td>
					<td>${memberDto.memberBirth}</td>
					<td>${memberDto.memberGender}</td>
					<td>${memberDto.memberGrade}</td>
					<td>
						<a class="btn btn-neutral" style="padding:4px;" href="detail?memberId=${memberDto.memberId}">상세</a>
						<a class="btn btn-neutral" style="padding:4px;" href="change?memberId=${memberDto.memberId}">수정</a>
						<a class="btn btn-neutral" style="padding:4px;" href="cut?memberId=${memberDto.memberId}">삭제</a>
					</td>
				</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="8" align="right">
						총 ${list.size()}개의 결과
					</td>
				</tr>
			</tfoot>
		</table>
		</div>
		
		<div class="row center">
            <ul class="pagination">
            	<c:choose>
            		<c:when test="${not vo.isFirst()}">
            			<a href="list?p=${vo.firstBlock()}&${vo.parameter()}">&laquo;</a>
            		</c:when>
            		<c:otherwise>
            			<a href="#">&laquo;</a>
            		</c:otherwise>
            	</c:choose>
            	
            	<c:choose>
            		<c:when test="${not vo.hasPrev()}">
            			<a href="list?p=${vo.prevBlock()}&${vo.parameter()}">&lt;</a>
            		</c:when>
            		<c:otherwise>
            			<a href="#">&lt;</a>
            		</c:otherwise>
            	</c:choose>
            	
            	<c:forEach var="i" begin="${vo.startBlock()}" end="${vo.endBlock()}" step="1">
            		<c:choose>
						<c:when test="${vo.p == i}">
							<li class="on"><a href="#">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="list?p=${i}&${vo.parameter()}">${i}</a></li>
						</c:otherwise>
					</c:choose>
            	</c:forEach>
            	
            	<c:choose>
            		<c:when test="${not vo.hasNext()}">
            			<a href="list?p=${vo.nextBlock()}&${vo.parameter()}">&gt;</a>
            		</c:when>
            		<c:otherwise>
            			<a href="#">&gt;</a>
            		</c:otherwise>
            	</c:choose>
            	
            	<c:choose>
            		<c:when test="${not vo.isLast()}">
            			<a href="list?p=${vo.lastBlock()}&${vo.parameter()}">&raquo;</a>
            		</c:when>
            		<c:otherwise>
            			<a href="#">&raquo;</a>
            		</c:otherwise>
            	</c:choose>
            </ul>
        </div>
		
		<div class="row right">
			<a href="/">메인 페이지</a>
		</div>
		
	</div>

<%-- footer.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>