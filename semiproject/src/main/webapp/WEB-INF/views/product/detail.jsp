<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="${productDto.productName}" name="title"/>
</jsp:include>
<!-- 별 스코어 링크 -->
<script src="https://cdn.jsdelivr.net/gh/hiphop5782/score@latest/score.min.js"></script> 
<link rel = "stylesheet" type = "text/css" href = "/css/SANGMIN_detail.css">

<!--본문 시작-->
<section class="itemsection1">
    <div class="inner">
    	<c:forEach var="productTumbnailList" items="${productTumbnailList}">
		<img class="itemmain" src="/attachment/download/productTumbnail?attachmentNo=${productTumbnailList.attachmentNo}" alt="상품메인">
		</c:forEach>
        <div class="itemtitle">
            <h3>${productDto.productName}</h3>
            <div class="itemstar">
                <div class="itemstar-score" data-max="5" data-rate="${productDto.productGood}"></div>
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
                                <input type="text" class="itemnumbercheck" title="수량" value="1">
                                <button type="button" class="btnup" title="증가" value="up^|^0">증가</button>
                            </span> <!--//numbericon-->
                        </div> <!--//countcheck-->
                    </dd> 
                </dl> <!--//itemcount-->
                <div class="itembox">
                    <div class="inner">
                        <button id="btncart" type="button" class="addcart">
                            <a href="">
                                <img src="/image/addcart.png" alt="장바구니">
                            </a>
                        </button>
                        <button id="btnbuy" type="button" class="buyitem">
                            <a href="">
                                <img src="/image/buyitem.png" alt="바로구매">
                            </a>
                        </button>
                    </div> <!--//inner-->
                </div> <!--//itembox-->
                
                </div> <!--//itemtitle1-->
            </div> <!--//itemtitle-->
        </div> <!--//inner-->
		</section> <!--//itemsection1-->
		<section class="itemsection2">
    		<div class="inner">
        		<div class="itemimage">
        			<c:forEach var="productDetailList" items="${productDetailList}">
					<img src="/attachment/download/productDetail?attachmentNo=${productDetailList.attachmentNo}" alt="상품설명">
					</c:forEach>
        		</div> <!--//itemimage-->
    		</div> <!--//inner-->
			</section> <!--//itemsection2-->
			<section class="itemsection3">
    			<div class="review">
        			<img src="/image/itemreview.png" alt="구매후기/포토후기">
    			</div>
			</section> <!--//itemsection3-->



<script type = "text/javascript">

	<%-- 누르는 버튼에 따라 전송하는 Mapping이 다르도록 설정 --%>
	$(function(){
		// 만약 구매 버튼을 눌렀다면 
	    $("#submit-purchase").click(function(){
	        $("#product-data").attr("action", "/order/order_ck"); // 상품 구매 Mapping으로 전송
	        $("#product-data").attr("method", "get"); // get 방식
	    });
		
		 // 만약 장바구니 버튼을 눌렀다면 /basket Mapping으로 form의 값을 전송
	    $("#submit-basket").click(function(){
	        $("#product-data").attr("action", "detail"); // 장바구니 등록 Mapping으로 전송
	        $("#product-data").attr("method", "post"); // post 방식
	    });
	});
	
</script>


<table>
<tbody>
	<tr>
		<th>상품 번호</th>
		<td>${productDto.productNo}</td>
	</tr>
	<tr>
		<th>상위 카테고리 번호</th>
		<td>${productDto.categoryHighNo}</td>
	</tr>
	<tr>
		<th>하위 카테고리 번호</th>
		<td>${productDto.categoryLowNo}</td>
	</tr>
	<tr>
		<th>상품 이름</th>
		<td>${productDto.productName}</td>
	</tr>
	<tr>
		<th>상품 가격</th>
		<td>${productDto.productPrice}</td>
	</tr>
	<tr>
		<th>상품 정보</th>
		<td>${productDto.productInformation}</td>
	</tr>
	<tr>
		<th>상품 재고</th>
		<td>${productDto.productInventory}</td>
	</tr>
	<tr>
		<th>상품 별점</th>
		<td>${productDto.productGood}</td>
	</tr>
	<tr>
		<th>상품 등록일</th>
		<td>${productDto.productRegisttime}</td>
	</tr>
	<tr>
		<th>상품 수정일</th>
		<td>${productDto.productUpdatetime}</td>
	</tr>
	<tr>
		<th>상품 상태</th>
		<td>${productDto.productInactive}</td>
	</tr>
	<tr>
		<th>상품이미지</th>
		<td>
			<c:forEach var="productTumbnailList" items="${productTumbnailList}">
			<img width=50 height=50 src="/attachment/download/productTumbnail?attachmentNo=${productTumbnailList.attachmentNo}">
			</c:forEach>
		</td>
	<tr>
		<th>상품상세이미지</th>
		<td>
			<c:forEach var="productDetailList" items="${productDetailList}">
			<img width=50 height=50 src="/attachment/download/productDetail?attachmentNo=${productDetailList.attachmentNo}">
			</c:forEach>
		</td>
	</tr>
</tbody>
</table>


<div>

	<form id = "product-data">
		<input type = "hidden" name = "productNo" value = "${productDto.productNo}"> <%-- 상품 번호 --%>
		<div class = "row">
			수량 : <input type = "number" name = "productCount" placeholder = "수량">
		</div>
		<div class = "row">
			<%-- 누르는 버튼에 따라 전송하는 Mapping이 다르도록 하기 위해 하나의 폼에 버튼 2개 생성 --%>
			<button class = "btn btn-positive" type = "submit" id = "submit-purchase">구매</button>
			<button class = "btn btn-neutral" type = "submit" id = "submit-basket">장바구니</button>
		</div>
	</form>
</div>

<div class = "container-1200 mt-50 center">
	<c:forEach var = "productReviewList" items = "${productReviewList}">
		<div class = "row w-100" style = "background-color : skyblue;">
			<div class = "row">
				리뷰 작성자 : ${productReviewList.reviewId}
			</div>
			<div class = "row">
				리뷰 작성일 : ${productReviewList.reviewWritetime}
			</div>
			<div class = "row">
				상품 옵션 : ${productReviewList.paymentOption}
			</div>
			<div class = "row">
				리뷰 별점 : ${productReviewList.reviewGood}
			</div>
			<div class = "row">
				리뷰 제목 : ${productReviewList.reviewTitle}
			</div>
			<div class = "row">
				리뷰 내용 : ${productReviewList.reviewContent}
			</div>
			<div class = "row">
				리뷰 첨부파일 이미지 :<img width=50 height=50 src="/attachment/download/reviewImg?attachmentNo=${productReviewList.reviewAttachmentNo}">
			</div>
		</div>
	</c:forEach>
</div>

</div>

<%-- footer.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
