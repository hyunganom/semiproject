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

<div class="wrapper">
    <header class="header">
        <div class="header1">
            <div class="inner">
                <ul class="log1">
                <c:choose>
				<c:when test="${loginId !=null}">
					<li>${loginId} 님<li>
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
                <h1><a href="/" class="logo"><img class="image" width="100px;" height="100px" src="/image/semilogo.png" alt="로고"></a></h1>
                <div class="formdiv">
                    <h2 class="search">검색</h2>
                    <form action="">
                        <fieldset>
                            <legend>
                                <input type="submit" class="btnSearch" value="검색">
                                <input type="text" class="textinput" placeholder="검색어를 입력하시오.">
                            </legend>
                        </fieldset>
                    </form>
                </div> <!--//formdiv-->
                <div class="icon1">
                    <ul>
                        <li><a href="#" title="배송지등록"><i class="fa-regular fa-paste"></i></a></li>
                        <li><a href="/mypage/order_list" title="마이페이지"><i class="fa-regular fa-user"></i></a></li>
                        <li><a href="/basket/list" title="장바구니"><i class="fa-solid fa-cart-shopping"></i></a></li>
                    </ul>
                </div> <!--//icon1-->
            </div> <!--//inner-->
        </div> <!--//header2-->
        <nav class="menu">
            <div class="inner">
                    <ul>
                        <li class="menubtn">
                            <a href="#">
                                <i class="fa-solid fa-bars" style="color: black; margin: 15px;">
                                </i>전체 카테고리
                            </a>
                        </li>
                        <li><a href="/product/category?categoryHighNo=41">정기배송</a></li>
                        <li><a href="/product/category?categoryHighNo=42">샐러드</a></li>
                        <li><a href="/product/category?categoryHighNo=43">닭,간,음</a></li>
                        <li><a href="#">이벤트</a></li>
                    </ul>
                    <div class="bottommenu">
                        <div class="inner">
                            <ul>
                                <li>
                                    <a href="/product/category?categoryHighNo=41">정기배송</a>
                                    <ul>
                                        <li><a href="/product/category?categoryHighNo=41&categoryLowNo=21">2주 식단</a></li>
                                        <li><a href="/product/category?categoryHighNo=41&categoryLowNo=49">4주 식단</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="/product/category?categoryHighNo=42">샐러드</a>
                                    <ul>
                                        <li><a href="/product/category?categoryHighNo=42&categoryLowNo=50">데일리 샐러드</a></li>
                                        <li><a href="/product/category?categoryHighNo=42&categoryLowNo=51">테이스티 샐러드</a></li>
                                        <li><a href="/product/category?categoryHighNo=42&categoryLowNo=52">파우치 샐러드</a></li>
                                        <li><a href="#">맛보기 세트</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="/product/category?categoryHighNo=43">닭,간,음</a>
                                    <ul>
                                        <li><a href="#">닭가슴살</a></li>
                                        <li><a href="/product/category?categoryHighNo=43&categoryLowNo=54">만두</a></li>
                                        <li><a href="#">소시지</a></li>
                                        <li><a href="/product/category?categoryHighNo=43&categoryLowNo=53">간식</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                 </div> <!--//inner-->
        </nav> <!--//nav-->
        </header> <!--//header-->

		
			
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