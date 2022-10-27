<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- header.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="리뷰 작성" name="title"/>
</jsp:include>

<div class = "container-900 mt-40 mb-40 center">

	<div class = "container-700">
		<div class = "container-200">
			<img src="/attachment/download/productTumbnail?attachmentNo=${productDto.productAttachmentNo}" width = "100%">
		</div>
		<div class = "container-500">
			<div class = "row">
				상품 번호 : ${productDto.productNo}
			</div>
			<div class = "row">
				상품 이름 : ${productDto.productName}
			</div>
			<div class = "row">
				상품 가격 : ${productDto.productPrice}
			</div>
			<div class = "row">
				상품 별점 : ${productDto.productGood}
			</div>
			<div class = "row">
				상품 비활성화 : ${productDto.productInactive}
			</div>
		</div>
	</div>

	<form action = "write" method = "post" enctype = "multipart/form-data">
		<%-- 리뷰 작성을 누를 때 등록 전 별점의 총점과 리뷰의 갯수를 구하기 위함 --%>
		<input name = "productNo" value = "${reviewPaymentNoVO.paymentProductNo}" type = "hidden">
		<%-- 리뷰 등록에 필요한 항목 --%>
		<input name = "reviewPaymentNo" value = "${reviewPaymentNo}" type = "hidden">
		<div class = "row">	
			리뷰 제목 : <input name = "reviewTitle" type = "text">
		</div>
		
		<div class = "row">
			리뷰 별점 : <input name = "reviewGood" type = "number">
		</div>
		
		<div class = "row">
			리뷰 내용 : <textarea name = "reviewContent"></textarea>
		</div>
    
    <div class = "row">
			리뷰 이미지 : <input name = "attachmentReviewImg" type="file" accept = ".png, .jpg" multiple>
		</div>
		
		<div class = "row">
			<button type = "submit">작성</button>
		</div>
	</form>
</div>


<%-- footer.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
