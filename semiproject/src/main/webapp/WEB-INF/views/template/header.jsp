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
	<a href = "">주문</a>
	<a href = "/member/list">회원 목록</a>
	<a href = "/product/list">상품 목록</a>
	
	</div>

<hr>

