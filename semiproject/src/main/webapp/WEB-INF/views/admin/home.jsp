<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="관리자 페이지" name="title"/>
</jsp:include>
<link rel = "stylesheet" type = "text/css" href = "${pageContext.request.contextPath}/css/SANGMIN_admin.css">

<script type="text/javascript">
$(document).ready(function(){
	//menu v2
	$(".menu-v2").mouseover(function(){
		$(this).children(".submenu").show(200);
	});
	$(".menu-v2").mouseleave(function(){
		$(this).children(".submenu").hide(200);
	});
	
});
</script>
<!-- 
<style>
	.container-1500 {
		width: 1500px;
		margin: 0 auto;
	}
	
	*{
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
	
	/*v2*/
	#nav-v2{/* 박스 크기 */
		width:150px;
		text-align:center;
		display: flex;
		flex-direction: column;
		margin-left: 40%;
	}
	.menu-v2{
		line-height:3;/* 글자 높이에 따른 박스 크기 */
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
	}
	/* div {
		border:1px dotted gray;
	} */
</style>

<div class="container-1100 mt-40 mb-40">
	<div id="container">
		<aside>
			<div class="float-left">
			<ul id="nav-v2">
				<li class="row center">        
	            	<i class="fa-solid fa-house"></i><a href="/admin/home"> 관리홈</a>
	            </li>
	            <br>
				<li class="menu-v2"><a href="#">상품</a>
					<ul class="submenu">
						<li><a href="/admin/product/insert">상품등록</a></li>
						<li><a href="/admin/product/list">상품리스트</a></li>
					</ul>
				</li>
				<li class="menu-v2"><a href="#">게시판</a>
					<ul class="submenu">
						<li><a href="/inquire/listAdmin">1:1 문의</a></li>
						<li><a href="/review/adminList">리뷰</a></li>
						<li><a href="/notice/list">공지사항</a></li>
					</ul>
				</li>
				<li class="menu-v2"><a href="#">회원</a>
					<ul class="submenu">
						<li><a href="http://localhost:8888/member/list">회원목록</a></li>
					</ul>
				</li>
			</ul>
			</div>
		</aside>
		
		<section>
			
		</section>
			<div class="clear"></div>
	</div>
</div>
		
</main> -->
