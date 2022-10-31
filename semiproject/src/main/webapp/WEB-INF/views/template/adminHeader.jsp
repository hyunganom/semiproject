<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="login" value="${loginId != null}"></c:set>
<c:set var="admin" value="${mg == '관리자'}"></c:set>

<!DOCTYPE html>
<html>

<%-- 헤더 --%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>
		<c:choose>
			<%-- title이라는 변수의 값이 있다면(null이 아니면) title에 입력될 값은 해당 title 변수의 값으로  --%>
			<c:when test = "${param.title != null}">
				${param.title}
			</c:when>
			<c:otherwise>
				홈페이지
			</c:otherwise>
		</c:choose>
	</title>
	
	<%-- static의 CSS 적용 --%>
	<link rel = "stylesheet" type = "text/css" href = "/css/reset.css">
    <link rel = "stylesheet" type = "text/css" href = "/css/commons.css">
    <link rel = "stylesheet" type = "text/css" href = "/css/SANGMIN_commons.css">
    <link rel = "stylesheet" type = "text/css" href = "/css/SANGMIN_header.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css">
    
    <%-- Font Awesome CDN --%>
    <link rel="stylesheet" type = "text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
	
	<%-- jQuery CDN --%>
	<script src = "https://code.jquery.com/jquery-3.6.1.js"></script>
	
	<%-- jQuery CDN (배포시에 사용할 min 버전) --%>
    <!-- <script src = "https://code.jquery.com/jquery-3.6.1.min.js"></script> -->
    
    <%-- Lodash CDN --%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js" integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    
    <%-- swiper --%>
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
    
    <%--script 링크 --%>
    <script src="/script/main.js"></script>
	
</head>




		
			
		<%-- 		
		
		문의글 관련
		<div class = "row mt-20 center">
			<a href = "/inquire/list">문의글 목록(회원용 - 내가 쓴 문의글)</a>
			<a href = "/inquire/listAdmin">문의글 목록(관리자용)</a>
		</div>
		
		<div class = "row center mt-20">
			<a href = "/product/list">전체 상품 목록(관리자용 - 상품의 모든 정보가 나옴)</a> 
		</div>
		
		
		
		<div class = "row center mt-20">
			<a href = "/mypage/order_list">마이페이지</a>
		</div>
	
	</div> --%>
	
			<!-- 사이드바 + 컨텐츠 -->
			<div class="float-container">
				<!-- 관리자 메뉴 -->
				<aside>
					<div class="container-150">
						<div class="row">
							<h2>관리자 메뉴</h2>
						</div>
						<div class="row">
							<a href="/member/list">회원목록</a>
						</div>
					</div>
				</aside>
			</div>


