<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="관리자 페이지" name="title"/>
</jsp:include>
<link rel = "stylesheet" type = "text/css" href = "/css/SANGMIN_admin.css">

<style>
	.container-1500 {
		width: 1500px;
		margin: 0 auto;
	}
</style>


	<div class="wrapper mt-30 mb-30">
        <div class="adminheader container-1500">
            <div class="adminsidemenu">
                <ul class="admindrop">
                    <li class="row center">        
                        <a href="/admin/home">관리홈</a>
                    </li>
                    <li class="adminsidemenu1">
                        <a href="#">상품</a>
                        <ul>
                            <li><a href="">- 상품등록</a></li>
                            <li><a href="">- 상품리스트</a></li>
                            <li><a href=""></a></li>
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
		</div> <!-- adminheader -->
	</div> <!-- wrapper -->
</main>
