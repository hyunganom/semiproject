<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="${productDto.productName}" name="title"/>
</jsp:include>
<!-- 별 스코어 링크 -->
<script src="https://cdn.jsdelivr.net/gh/hiphop5782/score@latest/score.min.js"></script> 
<link rel = "stylesheet" type = "text/css" href = "/css/SANGMIN_detailsub.css">
<style>
	td{
    	vertical-align : middle;
    	line-height : 1.2em;
    	font-size : 14px;
    }
</style>
<script type="text/javascript">
	/* $(function(){
		//ajax 호출 함수
		function purchase(basketProductNo,basketCountNo,basketProductName,basketProductOption){
			$.ajax({
				url:"http://localhost:8888/basket/insert?ProductNo="+basketProductNo
						+"&ProductCount="+basketCountNo
						+"&ProductName="+basketProductName
						+"&ProductOption="+basketProductOption,
 				method:"get",
 				success:function(resp){
 					if(resp==="success"){
 						alert("성공!");
						window.location.href="http://localhost:8888/order/order_ck";
 					}else{
 						alert("실패!");
 					}	
 				}
			});
		}
		$("#submit-purchase").click(function(e){
			e.preventDefault();
			var basketProductNo = $("#product-data").children().val();
			var basketCountNo = $("[name=productCount]").val();
			var ProductName = $(".purchaseName").text();
			var arr = $("select[name='productOption'] option:selected");
			console.log(basketProductNo);
			console.log(basketCountNo);
			console.log(ProductName);
			console.log(arr);
			purchase(basketProductNo,basketCountNo,ProductName,arr);
		});
	}); */
	
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
	});
</script>

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

<!--본문 시작-->
<section class="itemsection1">
    <div class="inner">
    	<c:forEach var="productTumbnailList" items="${productTumbnailList}">
			<img class="itemmain" src="/attachment/download/productTumbnail?attachmentNo=${productTumbnailList.attachmentNo}" alt="상품 메인">
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
                                <input type="text" class="itemnumbercheck" title="수량" value="1">
                                <button type="button" class="btnup" title="증가" value="up^|^0">증가</button>
                            </span> <!--//numbericon-->
                        </div> <!--//countcheck-->
                    </dd> 
                </dl> <!--//itemcount-->
                <div class="itemselect">
<%--                      <select name="productOption" required>
                        <option value='' selected>-- 옵션선택1 (필수사항) --</option>
                        <c:forEach var = "productNoNameList" items = "${productNoNameList}">
							<option value = "${productNoNameList.productNo}">${productNoNameList.productName}</option>
						</c:forEach>
                    </select> 
                    <select name = "productOption" required>
                        <option value='' selected>-- 옵션선택2 (필수사항) --</option>
						<c:forEach var = "productNoNameList" items = "${productNoNameList}">
							<option value = "${productNoNameList.productNo}">${productNoNameList.productName}</option>
						</c:forEach>
                    </select>
                    <select name = "productOption" required>
                        <option value='' selected>-- 옵션선택3 (필수사항) --</option>
                        <c:forEach var = "productNoNameList" items = "${productNoNameList}">
							<option value = "${productNoNameList.productNo}">${productNoNameList.productName}</option>
						</c:forEach>
                    </select>
                    <select name = "productOption" required>
                        <option value='' selected>-- 옵션선택4 (필수사항) --</option>          
						<c:forEach var = "productNoNameList" items = "${productNoNameList}">
							<option value = "${productNoNameList.productNo}">${productNoNameList.productName}</option>
						</c:forEach>
                    </select>
                    <select name = "productOption" required>
                        <option value='' selected>-- 옵션선택5 (필수사항) --</option>
                        <c:forEach var = "productNoNameList" items = "${productNoNameList}">
							<option value = "${productNoNameList.productNo}">${productNoNameList.productName}</option>
						</c:forEach>
                    </select>
                    <select name = "productOption" required>
                        <option value='' selected>-- 필수선택6 (필수사항) --</option>
                        <c:forEach var = "productNoNameList" items = "${productNoNameList}">
							<option value = "${productNoNameList.productNo}">${productNoNameList.productName}</option>
						</c:forEach>
                    </select>
                    <select name = "productOption" required>>
                        <option value='' selected>-- 필수선택7 (필수사항) --</option>
                        <c:forEach var = "productNoNameList" items = "${productNoNameList}">
							<option value = "${productNoNameList.productNo}">${productNoNameList.productName}</option>
						</c:forEach>
                    </select>
                    <select name = "productOption" required>
                        <option value='' selected>-- 필수선택8 (필수사항) --</option>
                        <c:forEach var = "productNoNameList" items = "${productNoNameList}">
							<option value = "${productNoNameList.productNo}">${productNoNameList.productName}</option>
						</c:forEach>
                    </select> --%>
                    
                </div>
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
						<img src="/attachment/download/productDetail?attachmentNo=${productDetailList.attachmentNo}" alt="상품 설명">
					</c:forEach>
		            
        		</div> <!--//itemimage-->
    		</div> <!--//inner-->
		</section> <!--//itemsection2-->
		<section class="itemsection3">
    	<div class="review mt-10 mb-10">
        	<img src="/image/itemreview.png" alt="구매후기/포토후기">
    	</div>
		</section> <!--//itemsection3-->
		
	<div class = "container-800">
			<c:forEach var = "productReviewList" items = "${productReviewList}">
				<table class="table mt-10 mb-10">
					 <tr>
					 	<td class="img center" width="100">
					 		<img width=90 height=90 src="/attachment/download/reviewImg?attachmentNo=${productReviewList.reviewAttachmentNo}">
					 	</td>
					 	<td class="row left" width="400" height="30">
					 		<div class="row" style="font-size: 16px; color: rgb(15, 199, 76);">
						 		제목 : ${productReviewList.reviewTitle}
							</div>
						 	옵션 : ${productReviewList.paymentOption} <br>
						 	내용 : ${productReviewList.reviewContent} <br>
					 	</td>
					 	<td class="row center" width="30">
						 	${productReviewList.reviewWritetime} <br>
						 	${productReviewList.reviewId} <br>
						 	<div class="row">
								<div class="star-score" data-max="5" data-rate="${productReviewList.reviewGood}"></div>
							</div>
					 	</td>
					 </tr>
				</table>
				<hr>
			</c:forEach>
	</div>

<br><br><br><br><br><br><br>

<script type = "text/javascript">

	<%-- 누르는 버튼에 따라 전송하는 Mapping이 다르도록 설정 --%>
	$(function(){
		// 만약 구매 버튼을 눌렀다면 
 	    $("#submit-purchase").click(function(){
	        $("#product-data").attr("action", "/basket/insert"); // 상품 구매 Mapping으로 전송
	        $("#product-data").attr("method", "get"); // get 방식
	    }); 
		
		 // 만약 장바구니 버튼을 눌렀다면 
	    $("#submit-basket").click(function(){
	        $("#product-data").attr("action", "detail"); // 장바구니 등록 Mapping으로 전송
	        $("#product-data").attr("method", "post"); // post 방식
	    });
	});
	
</script>

<div align = "center">
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
		<th>상품 이름</th> <!-- 바로구매 필요한 클래스명 지우지마세요 -->
		<td class="purchaseName">${productDto.productName}</td>
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
		<input type = "hidden" name = "productName" value = "${productDto.productName}"> <%-- 상품 번호 --%>
		
		<div class = "row">
			수량 : <input type = "number" name = "productCount" placeholder = "수량">
		</div>
		
		<div>
			<span>옵션 1 :</span>
			<select name = "productOption" required>
				<option>선택</option>
				<c:forEach var = "productNoNameList" items = "${productNoNameList}">
					<option id="option1" value = "${productNoNameList.productNo}">${productNoNameList.productName}</option>
				</c:forEach>
			</select>
		</div>
		
		<div>
			<span>옵션 2 :</span>
			<select name = "productOption" required>
				<option>선택</option>
				<c:forEach var = "productNoNameList" items = "${productNoNameList}">
					<option id="option2" value = "${productNoNameList.productNo}">${productNoNameList.productName}</option>
				</c:forEach>
			</select>
		</div>
		
		<div>
			<span>옵션 3 :</span>
			<select name = "productOption" required>
				<option>선택</option>
				<c:forEach var = "productNoNameList" items = "${productNoNameList}">
					<option id="option3" value = "${productNoNameList.productNo}">${productNoNameList.productName}</option>
				</c:forEach>
			</select>
		</div>
		
		<div>
			<span>옵션 4 :</span>
			<select name = "productOption" required>
				<option>선택</option>
				<c:forEach var = "productNoNameList" items = "${productNoNameList}">
					<option value = "${productNoNameList.productNo}">${productNoNameList.productName}</option>
				</c:forEach>
			</select>
		</div>
		
		<div>
			<span>옵션 5 :</span>
			<select name = "productOption" required>
				<option>선택</option>
				<c:forEach var = "productNoNameList" items = "${productNoNameList}">
					<option value = "${productNoNameList.productNo}">${productNoNameList.productName}</option>
				</c:forEach>
			</select>
		</div>
		
		<div>
			<span>옵션 6 :</span>
			<select name = "productOption" required>
				<option>선택</option>
				<c:forEach var = "productNoNameList" items = "${productNoNameList}">
					<option value = "${productNoNameList.productNo}">${productNoNameList.productName}</option>
				</c:forEach>
			</select>
		</div>
		
		<div>
			<span>옵션 7 :</span>
			<select name = "productOption" required>
				<option>선택</option>
				<c:forEach var = "productNoNameList" items = "${productNoNameList}">
					<option value = "${productNoNameList.productNo}">${productNoNameList.productName}</option>
				</c:forEach>
			</select>
		</div>
		
		<div>
			<span>옵션 8 :</span>
			<select name = "productOption" required>
				<option>선택</option>
				<c:forEach var = "productNoNameList" items = "${productNoNameList}">
					<option value = "${productNoNameList.productNo}">${productNoNameList.productName}</option>
				</c:forEach>
			</select>
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
				<div class="item-score" data-max="5" data-rate="${productReviewList.reviewGood}"></div>
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

</body>
</html>