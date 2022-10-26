<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <link rel = "stylesheet" type = "text/css" href = "/css/layout.css">
    <!-- <link rel = "stylesheet" type = "text/css" href = "/css/test.css"> -->
    
    <%-- Font Awesome CDN --%>
    <link rel="stylesheet" type = "text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
	
	<%-- jQuery CDN --%>
	<script src = "https://code.jquery.com/jquery-3.6.1.js"></script>
	
	<%-- jQuery CDN (배포시에 사용할 min 버전) --%>
    <!-- <script src = "https://code.jquery.com/jquery-3.6.1.min.js"></script> -->
    
    <%-- Lodash CDN --%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js" integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
</head>

<%-- 바디 --%>
<body>

<div class = "container-1200">

	<div class = "row">
	<%-- 필요한 하이퍼링크 작성(절대경로로) --%>
	<div class = "row">
		<a href = "/">홈</a>|
		<c:choose>
			<c:when test="${login}">
				<a href="/member/logout">로그아웃</a>
			</c:when>
			<c:otherwise>
				<a href="/member/login">로그인</a>
				<a href="/member/join">회원가입</a>
			</c:otherwise>
		</c:choose>
		<a href = "/member/list">회원 목록</a>
		<a href = "/mypage/order_list">마이페이지</a>
	</div>
	
	<div>
		<a href = "">주문</a>
		<a href = "/basket/list">장바구니</a>
	</div>
	

	<div>
			<a href = "/inquire/list">문의글 목록(회원용)</a>
		<a href = "/inquire/listAdmin">문의글 목록(관리자용)</a>
	</div>
	
	<div class = "row">
		<a href = "/product/list">상품 목록(관리자용)</a> 
	</div>
	
	<div>
		<a href = "/product/category?categoryHighNo=41">구독상품(상위41)</a>
		<a href = "/product/category?categoryHighNo=41&categoryLowNo=21">구독상품(상위41) 2주식단(하위21)</a> 
		<a href = "/product/category?categoryHighNo=41&categoryLowNo=49">구독상품(상위41) 4주식단(하위49)</a>
	</div>
	
	<div class = "row">
		<a href = "/product/category?categoryHighNo=42">샐러드(상위42)</a> 
		<a href = "/product/category?categoryHighNo=42&categoryLowNo=50">샐러드(상위42) 데일리 샐러드(하위50)</a> 
		<a href = "/product/category?categoryHighNo=42&categoryLowNo=51">샐러드(상위42) 테이스티 샐러드(하위51)</a>
		<a href = "/product/category?categoryHighNo=42&categoryLowNo=52">샐러드(상위42) 파우치 샐러드(하위52)</a>
	</div>
	
	<div class = "row">
		<a href = "/product/category?categoryHighNo=43">간식(상위43)</a> 
		<a href = "/product/category?categoryHighNo=43&categoryLowNo=53">간식(상위43) 간식(하위53)</a> 
		<a href = "/product/category?categoryHighNo=43&categoryLowNo=54">간식(상위43) 만두(하위54)</a>
	</div>

	<a href = "/mypage/order_list">마이페이지</a>
	<a href = "">주문</a>
	<a href = "/member/list">회원 목록</a>
	<a href = "/product/list">상품 목록</a> 
	<a href = "/inquire/list">문의글 목록</a>
	<a href = "/member/login">로그인</a>
	<a href = "/member/logout">로그아웃</a>
	<a href = "/">홈(메인)</a>
	<a href = "/inquire/list">문의글 목록(회원용)</a>
	<a href = "/inquire/listAdmin">문의글 목록(관리자용)</a>
	<a href = "/basket">장바구니</a>
	<a href = "/notice/list">공지게시판</a>

	</div>

<hr>

