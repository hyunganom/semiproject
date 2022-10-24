<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- header.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="${memberDto.memberId} 회원 상세정보" name="title"/>
</jsp:include>

	<div align="center">
		<h1>${memberDto.memberId} 회원 상세정보</h1>
		<table border="1" width="500">
			<tbody>
				<tr>
					<th width="25%">아이디</th>
					<td>${memberDto.memberId}</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${memberDto.memberName}</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${memberDto.memberId}</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${memberDto.memberId}</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<c:if test="${memberDto.memberPost != null}">
						[${memberDto.memberPost}]
						${memberDto.memberBaseAddress}
						${memberDto.memberDetailAddress}
						</c:if>
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>${memberDto.memberBirth}</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>${memberDto.memberGender}</td>
				</tr>
				<tr>
					<th>등급</th>
					<td>${memberDto.memberGrade}</td>
				</tr>
				<tr>
					<th>포인트</th>
					<td>
						<fmt:formatNumber value="${memberDto.memberPoint}" pattern="#,##0"/> 포인트
					</td>
				</tr>
				<tr>
					<th>가입일시</th>
					<td>
						<fmt:formatDate value="${memberDto.memberJoindate}" pattern="y년 M월 d일 E a h시 m분 s초"/>
					</td>
				</tr>
				<tr>
					<th>로그인일시</th>
					<td>
						<fmt:formatDate value="${memberDto.memberLogindate}" pattern="y년 M월 d일 E a h시 m분 s초"/>
					</td>
				</tr>
				<tr>
					<th>회원 탈퇴 여부</th>
					<td>${memberDto.memberWithdrawal}</td>
				</tr>
				<tr>
					<th>회원 탈퇴 일시</th>
					<td>
						<fmt:formatDate value="${memberDto.memberWithdrawalDate}" pattern="y년 M월 d일 E a h시 m분 s초"/>
					</td>
				</tr>
			</tbody>
		</table>
		
		<c:choose>
			<c:when test="${mg == '관리자'}">
				<h2><a href="list">목록 보기</a></h2>
				<h2><a href="change?memberId=${memberDto.memberId}">회원정보 변경</a></h2>
				<h2><a href="cut?memberId=${memberDto.memberId}">회원삭제 처리</a></h2>
			</c:when>
			<c:otherwise>
				<h2><a href="changePw">비밀번호 변경</a></h2>
				<h2><a href="information">개인정보 변경</a></h2>
				<h2><a href="end">회원 탈퇴</a></h2>
			</c:otherwise>
		</c:choose>
	</div>
	
<%-- footer.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>