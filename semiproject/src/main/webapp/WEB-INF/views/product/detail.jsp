<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="${productDto.productName}" name="title"/>
</jsp:include>

<!-- 별 스코어 링크 -->
<script src="https://cdn.jsdelivr.net/gh/hiphop5782/score@latest/score.js"></script>

<link rel = "stylesheet" type = "text/css" href = "/css/SANGMIN_detail.css">

<script type="text/javascript">

	$(function(){
	    $(".item-score").score({
	    	starColor:"red", // 별 색상 (기본 : 금색)
            integerOnly:false, // 반올림
            display:{
                showNumber:true, // 숫자 표시
                placeLimit:1, // 소수점 자릿수
                textColor:"red", // 숫자 색상 (기본 : 금색)
            }
	    });
	    
	    $(".review-score").score({
	    	starColor:"red", // 별 색상 (기본 : 금색)
            integerOnly:false, // 반올림
            display:{
                showNumber:true, // 숫자 표시
                placeLimit:1, // 소수점 자릿수
                textColor:"red", // 숫자 색상 (기본 : 금색)
            }
	    });
	});
	
	$(function(){
	    
	    <%-- 누르는 버튼에 따라 전송하는 Mapping이 다르도록 설정 --%>
		// 만약 구매 버튼을 눌렀다면 
 	    $("#submit-purchase").click(function(){
	        $("#product-data").attr("action", "/basket/insert"); // 상품 구매 Mapping으로 전송
	        $("#product-data").attr("method", "get"); // get 방식
	    }); 
		
		// 만약 장바구니 버튼을 눌렀다면 /basket Mapping으로 form의 값을 전송
	    $("#submit-basket").click(function(){
	        $("#product-data").attr("action", "detail"); // 장바구니 등록 Mapping으로 전송
	        $("#product-data").attr("method", "post"); // post 방식
	    });
	});
	
</script>

<style>

	td{
    	vertical-align : middle;
    	line-height : 1.2em;
    	font-size : 10px;
    }
    
    .table.table-border > thead > tr > th,
.table.table-border > thead > tr > td,
.table.table-border > tbody > tr > th,
.table.table-border > tbody > tr > td,
.table.table-border > tfoot > tr > th,
.table.table-border > tfoot > tr > td {  
    border: 1px solid #e5e7eb;
}

#td-top{
	text-align: left;
	vertical-align : top;
	margin-top: 20px;
}

#td-font1{
	 font-size: 20px;
	 color : #848484;
}

#td-font2{
	 font-size: 20px;
	 color : #58FA82;
}

#td-font3{
	 font-size: 20px;
	 font-weight: bold;
}    

#td-font4{
	 font-size: 20px;
}    
    
</style>

<!--본문 시작-->
<form id = "product-data"> <%-- form 시작 --%>
<section class="itemsection1">
	<input type = "hidden" name = "productNo" value = "${productDto.productNo}"> <%-- 상품 번호 --%>
	<input type = "hidden" name = "productName" value = "${productDto.productName}"> <%-- 상품 이름 --%>
	<div class="inner">
		<c:forEach var="productTumbnailList" items="${productTumbnailList}">
			<img class="itemmain" src="/attachment/download/productTumbnail?attachmentNo=${productTumbnailList.attachmentNo}" alt="상품메인">
		</c:forEach>
		<div class="itemtitle">
    		<h3>${productDto.productName}</h3>
		<div class="itemstar">
    		<div class="item-score" data-max="5" data-rate="${productDto.productGood}"></div>
		</div> 
		<div class="itemtitle1">
    		<span>${productDto.productPrice}</span>
			<span>원</span>
			<ul>
			    <li>배송정보</li>
			    <li>3000원 / 주문시결제(선결제)</li>
			    <li>배송방법(새벽/일반) 및 [수령일 지정]은 주문서/결제 단계에서 선택 가능합니다.</li>
			</ul>
			
			<dl class="itemcount">
	    		<dt>총 수량</dt>
	    		<dd>
	        		<div class="countcheck">
		            	<span class="numbericon">
		                	<button type="button" class="btndown" title="감소" value="dn^|^0">감소</button>
		                		<input type = "number" class="itemnumbercheck" name = "productCount" placeholder = "수량" min = "1" max = "10">
		                	<button type="button" class="btnup" title="증가" value="up^|^0">증가</button>
		            	</span> <!--//numbericon-->
					</div> <!--//countcheck-->
	    		</dd> 
			</dl> <!--//itemcount-->

			<div class="itembox">
	    		<div class="inner">
	        		<%-- 누르는 버튼에 따라 전송하는 Mapping이 다르도록 하기 위해 하나의 폼에 버튼 2개 생성 --%>
					<button type = "submit" id = "submit-purchase">
						<img src="/image/buyitem.png" alt="바로구매">
					</button>
	
					<button type = "submit" id = "submit-basket">
						<img src="/image/addcart.png" alt="장바구니">
					</button>
	            </div> <!--//inner-->
			</div> <!--//itembox-->
    
			</div> <!--//itemtitle1-->
		</div> <!--//itemtitle-->
	</div> <!--//inner-->
</section> <!--//itemsection1-->
</form> <%-- form 끝 --%>
		 
<section class="itemsection2">
	<div class="inner">
  		<div class="itemimage">
  			<c:forEach var="productDetailList" items="${productDetailList}">
				<img src="/attachment/download/productDetail?attachmentNo=${productDetailList.attachmentNo}" alt="상품설명">
			</c:forEach>
		</div> <!--//itemimage-->
	</div> <!--//inner-->
</section> <!--//itemsection2-->

<section >
   	<div class=" mt-10 mb-10 center">
       	<img src="/image/itemreview.png" width=500 height=150  alt="구매후기/포토후기">
   	</div>
</section> <!--//itemsection3-->
<div class = "container-1200 mt-50 center mb-50">
	<c:forEach var = "productReviewList" items = "${productReviewList}">
		<table class="table mt-10 mb-10 " >
			 <tr>
			 	<td class="img center" width="80">
			 		<img width=150 height=150 src="/attachment/download/reviewImg?attachmentNo=${productReviewList.reviewAttachmentNo}"><br>
			 		리뷰 별점 : ${productReviewList.reviewGood} 
			 	</td>
			 	<td id="td-top" width="400" height="30">
				 <p id="td-font1">${productReviewList.reviewId} &nbsp  [ ${productReviewList.reviewWritetime} ]</p><br><br>
				 <p id="td-font2">${productDto.productName}</p><br><br><br><br><br>
				 <p id="td-font3">${productReviewList.reviewTitle}</p><br>
				 <p id="td-font4">${productReviewList.reviewContent}</p> <br>
			 	</td>
			 </tr>
		</table>
		<hr>
	</c:forEach>
</div>

<%-- 사용할 수 있는 값들
${productDto.productNo}
${productDto.categoryHighNo}
${productDto.categoryLowNo}
${productDto.productName}
${productDto.productPrice}
${productDto.productInformation}
${productDto.productInventory}
${productDto.productGood}
${productDto.productRegisttime}
${productDto.productUpdatetime
${productDto.productInactive}

<c:forEach var="productTumbnailList" items="${productTumbnailList}">
	<img width=50 height=50 src="/attachment/download/productTumbnail?attachmentNo=${productTumbnailList.attachmentNo}">
</c:forEach>

<c:forEach var="productDetailList" items="${productDetailList}">
	<img width=50 height=50 src="/attachment/download/productDetail?attachmentNo=${productDetailList.attachmentNo}">
</c:forEach>

<c:forEach var = "productReviewList" items = "${productReviewList}">
	${productReviewList.reviewId}
	${productReviewList.reviewWritetime}
	${productReviewList.paymentOption}
	${productReviewList.reviewGood}
	${productReviewList.reviewTitle}
	${productReviewList.reviewContent}
	<img width=50 height=50 src="/attachment/download/reviewImg?attachmentNo=${productReviewList.reviewAttachmentNo}">
</c:forEach>
--%>

<%-- footer.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
