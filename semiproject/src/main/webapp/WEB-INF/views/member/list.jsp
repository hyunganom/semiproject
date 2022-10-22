<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- header.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원 목록" name="title"/>
</jsp:include>

	<div align="center">
		<h1>회원 조회</h1>
		
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
		
		<br><br>
		
		<table border="1" width="1000">
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>생년월일</th>
					<th>성별</th>
					<th>등급</th>
					<th>회원탈퇴여부</th>
					<th>메뉴</th>
					<th>탈퇴관리(Y / N)</th>
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
					<td>${memberDto.memberWithdrawal}</td>
					<td>
						<a href="detail?memberId=${memberDto.memberId}">상세</a>
						<a href="change?memberId=${memberDto.memberId}">수정</a>
<%-- 						<a href="cut?memberId=${memberDto.memberId}">삭제</a> --%>
					</td>
					<td></td>
				</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="10" align="right">
						총 ${list.size()}개의 결과
					</td>
				</tr>
			</tfoot>
		</table>
		
		<h2><a href="/">메인 페이지</a></h2>
		
	</div>
	
<%-- footer.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>