<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="관리자 페이지" name="title"/>
</jsp:include>
<link rel = "stylesheet" type = "text/css" href = "/css/SANGMIN_admin.css">

<h1>관리자 페이지</h1>

<div class="wrapper">
        <div class="adminheader">
            <div class="inner">
                <h1><a href="/" class="logo"><img class="image" width="150px;" height="150px" src="/image/logotop.png"></a></h1>
            </div>
            <div class="adminheader">
                <nav class="adminmenu">
                    <div class="admintitle">
                        <h1>관리자 페이지</h1>
                        <div class="formdiv3">
                            <h2 class="search">검색</h2>
                            <form action="">
                                <fieldset>
                                    <legend>
                                        <input type="submit" class="btnSearch3" value="검색">
                                        <input type="text" class="textinput3" placeholder="검색어를 입력하시오.">
                                    </legend>
                                </fieldset>
                            </form>
                        </div> <!--//formdiv3-->                     
                    </div> <!--//admintitle-->
                </nav> <!--adminmenu-->
            </div> <!--adminheader-->
            <div class="adminsidemenu">
                <ul class="admindrop">
                    <li>        
                        <a href="/admin/home">관리홈</a>
                    </li>
                    <li class="adminsidemenu1">
                        <ul><p><button class="btndrop">상품</button></p>
                        <div class="btndropsub">
                            <li><a href="">- 상품등록</a></li>
                            <li><a href="">- 상품리스트</a></li>
                            <li><a href=""></a></li>
                        </div>
                        </ul>
                    </li>
                    <li class="adminsidemenu2">
                        <ul><p><button class="btndrop2">게시판</button></p> 
                        <div class="btndropsub2">
                            <li><a href="">- 1:1 문의</a></li>
                            <li><a href="">- 리뷰</a></li>
                            <li><a href="">- 공지사항</a></li>
                        </div>
                        </ul>
                    </li>
                    <li class="adminsidemenu3">
                        <ul><p><button class="btndrop3">회원</button></p>
                        <div class="btndropsub3">
                            <li><a href="http://localhost:8888/member/list">- 회원정보</a></li>
                        </div>
                        </ul>
                    </li>
                    <li class="adminsidemenu4">
                        <ul><p><button class="btndrop4">주문</button></p>  
                        <div class="btndropsub4">
                            <li><a href="">- 주문내역</a></li>
                            <li><a href="">- 결제내역</a></li>
                            <li><a href="">- 취소내역</a></li>
                        </div>
                        </ul>
                    </li>
                </ul> <!--//admindrop-->
            </div> <!--//adminsidemenu-->

