<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	              <td>${list.basketCountNumber}</td>
	              <td>${list.productPrice}</td>
            	</tr>
            </c:forEach>
            <tr>
              <td colspan="3">
                <i class="fa-solid fa-angles-right"></i>
                적립 예상금액
                <input type="hidden" name="orderPoint" value="100">
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
        
         <!-- 입력하지않지만 넘어가야하는 정보 -->
<%--         <input type="hidden" name="orderId" value="${loginId}"> --%>
        <input type="hidden" name="orderStatus" value="결제완료">
        <input type="hidden" name="orderPrice" value="12000">
        <input type="hidden" name="orderPayPrice" value="10000">
        
        <!-- payment에 넘어가야하는 정보(배열값으로 돌릴 예정) -->
		<input type="hidden" name="paymentProductNo" value="1264">
		<input type="hidden" name="paymentCount" value="2">
		<input type="hidden" name="paymentPrice" value="10000">
		<input type="hidden" name="paymentOption" value="옵션">

        <div class="row mt-50">
          <h3>쿠폰 / 적립금</h3>
        </div>

        <div class="row">
          <div class="row">
            <p>쿠폰 (보유 : <span>?</span> 개)</p>
            <input type="text" class="input w-50">
            <a href="#" class="btns btns-positive">쿠폰 적용</a>
          </div>
          <div class="row">
            <p>적립금 (사용가능 적립금 : <span>?</span>)</p>
            <input type="text" class="input w-50" name="orderUsePoint">
            <a href="#" class="btns btns-positive">전액 사용</a>
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
                <td>0</td>
                <td>3000</td>
                <td>0</td>
                <td>0</td>
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

        <div class="row center">
          <button type="submit" class="btns btns-positive">결제하기</button>
        </div>
	</form>

    </div>
</body>

</html>
    
    <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>