<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="관리자 페이지" name="title"/>
</jsp:include>
<link rel = "stylesheet" type = "text/css" href = "/css/SANGMIN_admin.css">

<script type="text/javascript">
$(document).ready(function(){
	//menu v1 
	$(".menu-v1").mouseover(function(){
		$(this).children(".submenu").stop().slideDown();
	});
	$(".menu-v1").mouseleave(function(){
		$(this).children(".submenu").stop().slideUp();
	});
	
	//menu v2
	$(".menu-v2").mouseover(function(){
		$(this).children(".submenu").show(200);
	});
	$(".menu-v2").mouseleave(function(){
		$(this).children(".submenu").hide(200);
	});
	
});
</script>

<style>
	.container-1500 {
		width: 1500px;
		margin: 0 auto;
	}
	
/*	*{
		margin:0;
		padding:0;
		list-style:none;
		font-family:"malgun gothic";
		box-sizing:border-box;
	}
	a{
		text-decoration:none;
		color:inherit;
		}
	.clear{
		clear:both;
	}
	#container{
		background-color:#fff;
		width:1000px;
	}
	
	/*v1*/
/*	#nav-v1{
		width:150px;
		text-align:center;
	}
	.menu-v1{
		line-height:2;
		border:1px solid #222;
	}
	.menu-v1:hover{
		background-color:#000;
	}
	.menu-v1:hover>a{
		color:white;
		font-weight:bold;
	}
	.menu-v1 .submenu{
		margin-top:7px;
		background-color:#fff;
		display:none;
	}
	.menu-v1 .submenu li:hover{
		background-color:#000;
		color:white;
		font-weight:bold;
	}
	
	/*v2*/
/*	#nav-v2{
		width:150px;
		text-align:center;
	}
	.menu-v2{
		line-height:2;
		border:1px solid #222;
		position:relative;
	}
	.menu-v2 .submenu{
		position:absolute;
		width:150px;
		left:149px;
		border:1px solid #222;
		background-color:#222;
		color:white;
		top:-1px;
		display:none;
	}
	.menu-v2:hover{
		background-color:#222;
		color:white;
	}
	.menu-v2 .submenu>li:hover{
		background-color:white;
		color:#222;
	}*/
</style>
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<!-- <div id="container">
		세로형
		<br><p>세로형 메뉴바 2유형 : 하위메뉴 오른쪽 부착</p><br>
		<ul id="nav-v2">
			<li class="menu-v2"><a href="#">menu-1</a>
				<ul class="submenu">
					<li><a href="#">sub 1-1</a></li>
					<li><a href="#">sub 1-2</a></li>
					<li><a href="#">sub 1-3</a></li>
					<li><a href="#">sub 1-4</a></li>
				</ul>
			</li>
			<li class="menu-v2"><a href="#">menu-2</a>
				<ul class="submenu">
					<li><a href="#">sub 2-1</a></li>
					<li><a href="#">sub 2-2</a></li>
					<li><a href="#">sub 2-3</a></li>
					<li><a href="#">sub 2-4</a></li>
				</ul>
			</li>
			<li class="menu-v2"><a href="#">menu-3</a>
				<ul class="submenu">
					<li><a href="#">sub 3-1</a></li>
					<li><a href="#">sub 3-2</a></li>
					<li><a href="#">sub 3-3</a></li>
					<li><a href="#">sub 3-4</a></li>
				</ul>
			</li>
			<li class="menu-v2"><a href="#">menu-4</a>
				<ul class="submenu">
					<li><a href="#">sub 4-1</a></li>
					<li><a href="#">sub 4-2</a></li>
					<li><a href="#">sub 4-3</a></li>
					<li><a href="#">sub 4-4</a></li>
				</ul>
			</li>
		</ul>
		<div class="clear"></div>
</div> -->
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
		
	<div class="wrapper mt-30 mb-30">
        <div class="adminheader container-1500">
            <div class="adminsidemenu">
                <ul class="admindrop">
                    <li class="row center">        
                        <a href="/admin/home">관리홈</a>
                    </li>
                    <li class="adminsidemenu1">
                       <ul><p><button class="btndrop">상품</button></p>
                        <div class="btndropsub">
                            <li><a href="/admin/product/insert">- 상품등록</a></li>
                            <li><a href="/admin/product/list">- 상품리스트</a></li>
                            <li><a href=""></a></li>
                        </div>
                        </ul>
                    </li>
                    <li class="adminsidemenu2">
                        <ul><p><button class="btndrop2">게시판</button></p> 
                        <div class="btndropsub2">
                            <li><a href="/inquire/listAdmin">- 1:1 문의</a></li>
                            <li><a href="/review/adminList">- 리뷰</a></li>
                            <li><a href="/notice/list">- 공지사항</a></li>
                        </div>
                        </ul>
                    </li>
                    <li class="adminsidemenu3">
                        <ul><p><button class="btndrop3">회원</button></p>
                        <div class="btndropsub3">
                            <li><a href="http://localhost:8888/member/list">- 회원목록</a></li>
                        </div>
                        </ul>
                    </li>
                </ul> <!--//admindrop-->
            </div> <!--//adminsidemenu-->
		</div> <!-- adminheader -->
	</div> <!-- wrapper -->
</main>
