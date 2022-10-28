<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- header.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="리뷰 작성" name="title"/>
</jsp:include>

<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://cdn.jsdelivr.net/gh/hiphop5782/score@latest/score.min.js"></script>
<script type="text/javascript">
$(function(){
    $(".star-score-edit").score({
        editable:true,//수정 가능하도록 설정
        integerOnly:true,//정수만 가능
        display:{
            showNumber:true,//숫자표시
        },
        send:{
            sendable:true,
            name:"reviewGood"
        }
    });
});
</script>

<div class = "container-900 mt-40 mb-40 center">
	<div class="row left">
		<h1>구매후기 작성</h1>
	</div>
	
	<hr>
	
		<div class = "container-800">
		<br>
			<div class = "float-left mt-10">
				<img src="/attachment/download/productTumbnail?attachmentNo=${productDto.productAttachmentNo}" width=100 height=100>
			</div>
			
			<div class = "container-550">
			<br>
				<div class = "row left">
					상품 이름 : ${productDto.productName}
				</div>
				<div class = "row left">
					상품 가격 : ${productDto.productPrice}
				</div>
				<div class = "row left">
					상품 품절여부 : ${productDto.productInactive}
				</div>
			</div>
		</div>
</div>
<div>
	<div class="container-800">
		<form action = "write" method = "post" enctype = "multipart/form-data">
			<%-- 리뷰 작성을 누를 때 등록 전 별점의 총점과 리뷰의 갯수를 구하기 위함 --%>
			<input name = "productNo" value = "${reviewPaymentNoVO.paymentProductNo}" type = "hidden">
			<%-- 리뷰 등록에 필요한 항목 --%>
			<input name = "reviewPaymentNo" value = "${reviewPaymentNo}" type = "hidden">
			<div class = "row">	
				<input class="input input-underline w-50" name = "reviewTitle" type = "text" placeholder="제목">
			</div>
			<div class = "row mt-20">
				<label class="float-right">
					<input class="input input-underline w-50" name = "reviewGood" type = "number" placeholder="별점">
				</label>
				<textarea name = "reviewContent" class="input w-100 fix-size mt-10" rows="8" placeholder="내용"></textarea>
			</div>
				<i class="fa-solid fa-camera"></i>
				<input class="row" name = "attachmentReviewImg" type="file" accept = ".png, .jpg" >
			<div class = "row right">
				<a href="/mypage/order_list" class="btn btn-neutral">취소</a>
				<button type = "submit" class="btn">작성</button>
			</div>
		</form>
	</div>
</div>


<%-- footer.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
