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

<%-- 바디 --%>
<body>
<main>
	<div class="wrapper">
	    <header class="header">
	        <div class="header1">
	            <div class="inner">
	                <ul class="log1">
	                				
	                <c:choose>
					<c:when test="${loginId !=null}">
						<li>${loginId} 님<li>
						<!-- 관리자 기능 -->
						<c:if test="${login && admin}">
							<li><a href="/admin/home">관리자 페이지</a></li>
						</c:if>
						
						<li><a href="/member/logout" title="로그아웃">로그아웃</a><li>
						<li><a href="#" title="고객센터">고객센터</a></li>				
					</c:when>
					<c:otherwise>
						<li><a href="/member/login" title="로그인">로그인</a><li>				
						<li><a href="/member/join" title="회원가입">회원가입</a><li>
						<li><a href="#" title="고객센터">고객센터</a></li>
					</c:otherwise>
				</c:choose>
	                </ul> <!--//log1-->
	            </div> <!--//inner-->
	        </div> <!--//header1-->
	        <div class="header2">
            <div class="inner">
                <h1><a href="/" class="logo"><img class="image" width="150px;" height="150px" src="/image/logotop.png" alt="로고"></a></h1>
                <div class="row left w-100">
                    <h1>관리자 모드</h1>
                </div> <!--//formdiv-->
            </div> <!--//inner-->
        </div> <!--//header2-->
		</header>
	