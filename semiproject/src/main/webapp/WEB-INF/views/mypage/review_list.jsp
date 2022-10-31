<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value= "내가 작성한 상품 리뷰" name="title"/>
</jsp:include>

<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://cdn.jsdelivr.net/gh/hiphop5782/score@latest/score.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".star-score").score({
			starColor:"red",//별 생상(기본 : 금색)
			integerOnly:true,//true를 쓰면 소숫점이 반올림
			display:{
				showNumber:true,//숫자표시
				placeLimit:2,//소수점 자리수
				textColor:"red",//숫자 색상(기본 : 금색)
			}
		});
	});
</script>

<style>
	td{
    	vertical-align : middle;
    	line-height : 1.2em;
    	font-size : 12px;
    }
    
    .footer{
		position:fixed;
		bottom:0;
		left:0;
		width:100%;
	}
	
	a{
		margin-top: 5px;
		margin-bottom: 10px;
	}
</style>

<div class = "container-700">
	<c:forEach var = "reviewList" items = "${reviewList}">
		<div class="row center">
			${reviewList.reviewWritetime} ${reviewList.productName}
		</div>
			<table class="table mt-10 mb-10">
				<tr>
					<td class="img center" width="100">
						<img width=80 height=80 src="/attachment/download/reviewImg?attachmentNo=${reviewList.reviewAttachmentNo}" onclick="location.href='/product/detail?productNo=${reviewList.paymentProductNo}';" style="cursor: pointer;
}"><br>
					</td>
					<td class="row left" width="300" height="30">
						리뷰 제목 : ${reviewList.reviewTitle}
						<br>
						상품 옵션 : ${reviewList.paymentOption}
						<br>
						리뷰 내용 : ${reviewList.reviewContent}
						<br>
					</td>
					<td class="row center" width="100">
						상품 갯수 : ${reviewList.paymentCount}
						<div class="row">
							<div class="star-score" data-max="5" data-rate="${reviewList.reviewGood}"></div>
						</div>
					</td>
					<td class="row center" width="130">
						<a class="btn btn-neutral" style="padding:4px;" href="/review/edit?reviewNo=${reviewList.reviewNo}">수정</a>
						<a class="btn btn-neutral" style="padding:4px;" href="/review/delete?reviewNo=${reviewList.reviewNo}">삭제</a>
					</td>
				</tr>
			</table>
			<hr>
	</c:forEach>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>