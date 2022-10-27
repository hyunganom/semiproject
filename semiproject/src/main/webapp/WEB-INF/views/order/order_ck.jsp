<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="주문서 작성" name="title"/>
</jsp:include>

<script type="text/javascript">
	$(function(){
		<!-- 수령자 정보와 주문자 정보가 같은 경우의 체크박스 -->
		$("#checkbox").on("input", function(){
			var judge = $(this).prop("checked");
			if(judge){
				var orderName = $(".infoName").text();
				$("input[name=orderName]").val(orderName);
				var orderTel = $(".infoTel").text();
				$("input[name=orderTel]").val(orderTel);
			}else{
				$("input[name=orderName]").val("");
				$("input[name=orderTel]").val("");
			}
		});
		
		
		
		<!-- 최종 금액 산출 -->
		<!-- model로 넘어온 basketList의 상품가격, 수량 js에서도 사용가능하도록 처리 -->
		<!-- 상품 금액(콜백함수) -->
		function productPrice(){
			var prices = new Array();
			var cnts = new Array();
			<c:forEach items="${basketList}" var="vo">
				prices.push("${vo.productPrice}");
				cnts.push("${vo.basketCountNumber}");
			</c:forEach>
			
			var itemsPrice = 0;
			for(var i=0; i<${basketList.size()}; i++){
				itemsPrice += (parseInt(prices[i])*parseInt(cnts[i]));
			}
			return itemsPrice;
		}
		<!-- 배송비(콜백함수) -->
		function deliveryFee(){
			var itemsPrice = parseInt($(".before-price").text()); //상품금액
			
			var delivery;
			if(itemsPrice>=50000){
				delivery=0;
			}else{
				delivery=3000;
			}
			return delivery;
		}
		<!-- 총 금액(콜백함수) -->
		function totalPrice(totalItemPrice, totalDelivery, totalDiscount){
			var totalItemPrice = parseInt($(".before-price").text());
			var totalDelivery = parseInt($(".delivery-price").text());
			var totalDiscount = parseInt($(".discount-price").text());
			//총금액(상품금액+배송비-할인금액)
			var totalPrice = (totalItemPrice+totalDelivery)-totalDiscount;
			return totalPrice;
		}
		
		<!-- 적립금 전체 사용 버튼 이벤트 -->
		$(".point-btn").one("click",function(e){
			e.preventDefault(); //a 태그 전송 막기
			var itemsPrice = parseInt($(".before-price").text()); //상품 가격
			var delivery = deliveryFee(); //배송비
			var total = itemsPrice+deliveryFee(); //상품가격+배송비
			var point = ${memberDto.memberPoint}; //보유 적립금
			
			// if문(true) : 총 상품금액보다 적립금이 많을 경우 금액만큼 사용하도록 최대값 설정
			if(total<point){
				$("input[name=orderUsePoint]").val(total); //클릭하면 입력창에 전체적립금 표시
				$(".discount-price").text(totalPrice); //할인창에 할인금액표시
				var discount = $(".discount-price").text();
				$(".after-price").text(totalPrice(itemsPrice,delivery,discount));
			}
		});
		
		<!-- 적립금 일부 사용 블러 이벤트 -->
		$("input[name=orderUsePoint]").blur(function(){
			var itemsPrice = parseInt($(".before-price").text()); //상품 가격
			var delivery = deliveryFee(); //배송비
			var total = itemsPrice+deliveryFee(); //상품가격+배송비
			var point = ${memberDto.memberPoint}; //보유 적립금
			var inputPoint = $(this).val();	//입력값
			
			// if문(true) : 총 상품금액보다 적립금이 적을경우
			$(this).removeClass("error");
			if(inputPoint>point){// 보유포인트보다 입력값이 크면 에러문구 표시
				$(this).addClass("error");
				$(this).text(0);
				$(".discount-price").text(0);
				$(".after-price").text(totalPrice(itemsPrice,delivery,0));
			}else if(inputPoint==""){
				$(".discount-price").text(0);
				$(".after-price").text(totalPrice(itemsPrice,delivery,0));
			}else{ //적게 입력하면 적립금 할인금액 표시
				$(".discount-price").text(inputPoint); //할인금액 출력
				var discount = $(".discount-price").text();
				$(".after-price").text(totalPrice(itemsPrice,delivery,discount));
			}
		});
		
		<!-- 하단 금액 부분 (고정값)출력 -->
		$(".before-price").text(productPrice()); //상품금액
		$(".delivery-price").text(deliveryFee()); //배송비
		
		var totalItemPrice = $(".before-price").text();
		var totalDelivery = $(".delivery-price").text();
		var totalDiscount = $(".discount-price").text();
		$(".after-price").text(totalPrice(totalItemPrice, totalDelivery,totalDiscount)); //총 금액
		
		
	});
</script>

<style>
	.sameinfo{
        font-size:12px;
        float:right;
	}
    textarea.memo{
      font-size:15px;
     }
     .error-message{
     	display:none;
     	color:red;
     }
     .point.error ~ .error-message{
     	display:block;
     }
</style>

	<div class="container-900 mt-50">
        <div class="row">
            <h2>주문 / 결제</h2>
        </div>

        <hr>
<form action="order_ck" method="post">	
        <div class="row mt-50">
          <h3>주문 상품 정보</h3>
        </div>

        <table class="table table-border">
          <thead>
            <tr>
              <th class="w-70">상품</th>
              <th class="w-15">수량</th>
              <th class="w-15">가격</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="list" items="${basketList}">
            	<tr>
	              <td>
	              	<div>${list.productName}</div>
	              	
	              	<div class="mt-10">${list.basketProductOption}</div>
	              </td>
	              <td>
	              	<div class="center items-count">${list.basketCountNumber}</div>
	              </td>
	              <td>
	              	<div class="center items-price">${list.productPrice}</div>
	              </td>
            	</tr>
            </c:forEach>
            <tr>
              <td colspan="3">
                <i class="fa-solid fa-angles-right"></i>
                적립 <input type="hidden" name="orderPoint" value="100">
                <span>예상금액</span>
              </td>
            </tr>
          </tbody>
        </table>
        
	
        <div class="row mt-50">
          <h3>주문자 정보</h3>
        </div>

        <table class="table table-border">
          <tbody class="left">
            <tr>
              <th>이름</th>
              <td>
                <span class="infoName">${memberDto.memberName}</span>
              </td>
            </tr>
            <tr>
              <th>이메일</th>
              <td>
                <span>${memberDto.memberEmail}</span>
              </td>
            </tr>
            <tr>
              <th>연락처</th>
              <td>
                <span class="infoTel">${memberDto.memberTel}</span>
              </td>
            </tr>
          </tbody>
        </table>

        <div class="row mt-50">
          <h3>배송 정보
            <label class="sameinfo">
              <input type="checkbox" id="checkbox">
              <span>위 정보와 같음</span>
            </label>
          </h3>
        </div>

        <div class="row">
          <table class="table table-border">
            <tbody class="left">
              <tr>
                <th>이름</th>
                <td>
                  <input type="text" name="orderName" placeholder="수령인">
                </td>
              </tr>
              <tr>
                <th>연락처</th>
                <td>
                  <input type="text" name="orderTel" placeholder="연락처">
                </td>
              </tr>
              <tr>
                <th>주소</th>
                <td>
                  <input type="text" name="orderPost" placeholder="우편번호">
                  <input type="text" name="orderBaseAddress" placeholder="주소">
                  <input type="text" name="orderDetailAddress" placeholder="상세주소">
                </td>
              </tr>
              <tr>
                <th class="va-middle">배송메세지</th>
                <td>
                  <textarea name="orderMemo" class="memo w-100 input" placeholder="ex) 배송전에 연락주세요!"></textarea>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        
        <div class="row mt-50">
          <h3>쿠폰 / 적립금</h3>
        </div>

        <div class="row">
          <div class="row">
            <p>쿠폰 (보유 : <span>${unusedCoupon.size()}</span>개)</p>
            <input type="text" class="input w-50">
            <a href="#" class="btns btns-positive coupon-btn">쿠폰 적용</a>
          </div>
          <div class="row">
          	<p>적립금 (사용가능 적립금 : <span>${memberDto.memberPoint}</span>원)</p>
			<input type="text" class="input w-50 point" name="orderUsePoint">
			<span class="error-message">금액이 부족합니다!</span>
			<a href="#" class="btns btns-positive point-btn">전액 사용</a>
          </div>
        </div>


        <div class="row mt-50">
          <h3>주문상품 할인적용</h3>
        </div>

        <div class="row center">
          <table class="table table-border">
            <tbody>
              <tr>
                <th>상품금액</th>
                <th>배송비</th>
                <th>할인금액</th>
                <th>총 금액</th>
              </tr>
              <tr>
                <td><div class="before-price">0</div>
                </td>
                <td><div class="delivery-price">0</div></td>
                <td><div class="discount-price">0</div></td>
                <td><div class="after-price">0</div></td>
              </tr>
            </tbody>
          </table>
        </div>

        <div class="row mt-50">
          <h3>결제 수단</h3>
        </div>

        <div class="row">
            <input type="radio" name="orderType" value="신용카드">신용카드
            <input type="radio" name="orderType" value="실시간 계좌이체">실시간 계좌이체
            <input type="radio" name="orderType" value="무통장입금">무통장입금
        </div>
        
         <!-- orders에 넘어가야하는 정보 -->
        <input type="hidden" name="orderStatus" value="결제완료">
        <input type="hidden" name="orderPayPrice" value="">
        <input type="hidden" name="orderPrice" value="">
        
        <!-- payment에 넘어가야하는 정보(paymentDto형태로 들어가야함!) -->
        <c:forEach var="list" items="${basketList}" varStatus="status">
        	<input type="hidden" name="payment[${status.index}].basketNo" value="${list.basketNo}">
			<input type="hidden" name="payment[${status.index}].paymentProductNo" value="${list.basketProductNo}">
			<input type="hidden" name="payment[${status.index}].paymentCount" value="${list.basketCountNumber}">
			<input type="hidden" name="payment[${status.index}].paymentPrice" value="${list.productPrice}">
			<input type="hidden" name="payment[${status.index}].paymentOption" value="${list.basketProductOption}">
		</c:forEach>

        <div class="row center">
          <button type="submit" class="btns btns-positive">결제하기</button>
        </div>
	</form>

    </div>
</body>

</html>
    
    <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>