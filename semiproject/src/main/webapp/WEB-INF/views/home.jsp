<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- header.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="메인페이지" name="title"/>
</jsp:include>
<link rel = "stylesheet" type = "text/css" href = "/css/SANGMIN_main.css">


<section class="section1">
                   <div class="swiper-container">
                       <div class="swiper-wrapper">
                           <!-- //slide-->
                           <div class="visual1 swiper-slide"></div>
                           <div class="visual2 swiper-slide"></div>
                           <div class="visual3 swiper-slide"></div>
                           <div class="visual4 swiper-slide"></div>
                           <div class="visual5 swiper-slide"></div>
                       </div> <!--//swiper-wrapper-->
                   </div> <!--//swiper-container-->
           </section> <!--//section1-->
           <section class="section2">
               <div class="inner">
                   <h2 class="hotitem">이달의 핫한 상품</h2>
                   <div class="item1">
                       <ul>
                           <li>
                               <div class="img1">
                                   <a href="#"><image src="./image/hotitem1.jpg" width="200px" height="200px"></image></a>
                               </div>
                               <p>아이템1</p>
                           </li>
                           <li>
                               <div class="img1">
                                   <a href="#"><image src="./image/hotitem2.jpg" width="200px" height="200px"></image></a>
                               </div>
                               <p>아이템2</p>
                           </li>
                           <li>        
                               <div class="img1">
                                   <a href="#"><image src="./image/hotitem3.jpg" width="200px" height="200px"></image></a>
                               </div>
                               <p>아이템3</p>
                           </li>
                           <li>
                               <div class="img1">
                                   <a href="#"></a>
                               </div>
                               <p>아이템4</p>
                           </li>
                       </ul>
                   </div> <!--//item1-->
               </div> <!--//inner-->
           </section> <!--//section2-->
           <section class="section3">
               <div class="inner">
                   <h2 class="hotitem">이달의 핫한 샐러드</h2>
                   <div class="item1">
                       <ul>
                           <li>
                               <div class="img1">
                                   <a href="#"><image src="./image/salad1.jpg" width="200px" height="200px"></image></a>
                               </div>
                               <p>샐러드1</p>
                           </li>
                           <li>       
                               <div class="img1">
                                   <a href="#"><image src="./image/salad2.jpg" width="200px" height="200px"></image></a>
                               </div>
                               <p>샐러드2</p>
                           </li>
                           <li>
                               <div class="img1">
                                   <a href="#"><image src="./image/salad3.jpg" width="200px" height="200px"></image></a>
                               </div>
                               <p>샐러드3</p>
                           </li>
                           <li>                
                               <div class="img1">
                                   <a href="#"><image src="./image/salad4.jpg" width="200px" height="200px"></image></a>
                               </div>
                               <p>샐러드4</p>
                           </li>
                       </ul>
                   </div> <!--//item2-->
               </div> <!--//inner-->
           </section> <!--//section3-->
           <section class="section4">
               <div class="inner">
                   <ul class="banner">
                       <li>
                           <a href="#">
                               <img class="bannerimg" src="./image/semi-banner1.png">
                           </a>
                       </li>
                       <li>
                           <a href="#">
                               <img class="bannerimg" src="./image/semi-banner2.png">
                           </a>
                       </li>
                   </ul> <!--banner-->
               </div> <!--inner-->
           </section> <!--section4-->
           <section class="section5">
               <div class="inner">
                   <h2 class="hotitem">헬창을 위한 닭가슴살</h2>
                   <div class="item1">
                       <ul>
                           <li>
                               <div class="img1">
                                   <a href="#"><img src="./image/chicken1.jpg" width="200px" height="200px"></a>
                               </div>
                               <p>닭1</p>
                           </li>
                           <li>
                               <div class="img1">
                                   <a href="#"><img src="./image/chicken2.jpg" width="200px" height="200px"></a>
                               </div>
                               <p>닭2</p>
                           </li>
                           <li>
                               <div class="img1">
                                   <a href="#"><img src="./image/chicken3.jpg" width="200px" height="200px"></a>
                               </div>
                               <p>닭3</p>
                           </li>
                           <li>
                               <div class="img1">
                                   <a href="#"><img src=""></a>
                               </div>
                               <p>닭4</p>
                           </li>
                       </ul>
                   </div> <!--//item3-->
               </div> <!--//inner-->
           </section> <!--//section5-->
           <section class="section6">
               <div class="inner">
                   <h2 class="hotitem">간식도 건강하게!</h2>
                   <div class="item1">
                       <ul>
                           <li>
                               <div class="img1">
                                   <a href="#"><img src="./image/snack1.jpg" width="200px" height="200px"></a>
                               </div>
                               <p>간식1</p>
                           </li>
                           <li>
                               <div class="img1">
                                   <a href="#"><img src="./image/snack2.jpg" width="200px" height="200px"></a>
                               </div>
                               <p>간식2</p>
                           </li>
                           <li>
                               <div class="img1">
                                   <a href="#"><img src="./image/snack3.jpg" width="200px" height="200px"></a>
                               </div>
                               <p>간식3</p>
                           </li>
                           <li>
                               <div class="img1">
                                   <a href="#"><img src=""></a>
                               </div>
                               <p>간식4</p>
                           </li>
                       </ul>
                   </div> <!--//item4-->
               </div> <!--//inner-->
           </section> <!--//section6-->
           
<div class="scrollbanner">
        <ul class="scroll1">
            <li>
                <a href="#"><i class="fa-regular fa-paste"></i></a>
            </li>
            
            <li>
                <a href="/basket/list"><i class="fa-solid fa-cart-shopping"></i></a>
            </li>
            <li>
                <a href="/notice/list"><img src="./image/noice1.png" alt="공지사항" width="70px" height="70px" ></i></a>
            </li>
        </ul> <!--//scroll1-->
        <span class="scrolltop">
            <a href="#"><i class="fa-solid fa-circle-up" style="color: #F57328;"></i></a>
        </span>
        <span class="scrolldown">
            <a href="#"><i class="fa-solid fa-circle-down" style="color: #F57328;"></i></a>
        </span>
		</div><!--scrollbanner-->
		<div class="popup-wrap">
    	<div class="popup">
            <img src="./image/popup.png">
       		<button type="submit" class="btnclose">닫기</button>
    	</div> <!--popup-->
	</div>  <!--popup-wrap-->

	
	<%-- 
	<h2>loginId = ${sessionScope.loginId}</h2>
	<h2>로그인 상태 = ${loginId != null}</h2>
	<c:set var="login" value="${loginId != null}"></c:set>
	
	<c:choose>
		<c:when test="${login}">
			<h2><a href="/member/logout">회원 로그아웃</a></h2>
		</c:when>
		<c:otherwise>
			<h2><a href="/member/join">회원 가입</a></h2>
			<h2><a href="/member/login">회원 로그인</a></h2>
		</c:otherwise>
	</c:choose>

	<h2><a href="/basket/list">장바구니</a></h2> --%>
	
<%-- footer.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

