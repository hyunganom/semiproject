<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="주문서 작성" name="title"/>
</jsp:include>

<style>
	.sameinfo{
        font-size:12px;
        float:right;
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
              <th>상품</th>
              <th>수량</th>
              <th>가격</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>?상품찍기?</td>
              <td>?수량찍기?</td>
              <td>?가격찍기?</td>
            </tr>
            <tr>
              <td colspan="3">
                <i class="fa-solid fa-arrow-turn-down-right"></i>
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
                <input type="text">
              </td>
            </tr>
            <tr>
              <th>이메일</th>
              <td>
                <input type="text">
              </td>
            </tr>
            <tr>
              <th>연락처</th>
              <td>
                <input type="text">
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
                  <input type="text" name="orderName">
                </td>
              </tr>
              <tr>
                <th>연락처</th>
                <td>
                  <input type="text" name="orderTel">
                </td>
              </tr>
              <tr>
                <th>주소</th>
                <td>
                  <input type="text" name="orderPost">
                  <input type="text" name="orderBaseAddress">
                  <input type="text" name="orderDetailAddress">
                </td>
              </tr>
              <tr>
                <th>배송메세지</th>
                <td>
                  <textarea name="orderMemo" class="w-100 input"></textarea>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        
         <!-- 입력하지않지만 넘어가야하는 정보 -->
        <input type="hidden" name="orderId" value="${sessionScope.loginId}">
        <input type="hidden" name="orderStatus" value="결제완료">
        <input type="hidden" name="orderPrice" value="12000">
        <input type="hidden" name="orderPayPrice" value="10000">
        
        <!-- payment에 넘어가야하는 정보(배열값으로 돌릴 예정) -->
		<input type="hidden" name="paymentProductNo" value="49">
		<input type="hidden" name="paymentCount" value="2">
		<input type="hidden" name="paymentPrice" value="2000">
		<input type="hidden" name="paymentOption" value="2">

        <div class="row mt-50">
          <h3>쿠폰 / 적립금</h3>
        </div>

        <div class="row">
          <div class="row">
            <p>쿠폰</p>
            <input type="text" class="input w-50">
            <a href="#" class="btn btn-positive">쿠폰 적용</a>
          </div>
          <div class="row">
            <p>적립금</p>
            <input type="text" class="input w-50" name="orderUsePoint">
            <a href="#" class="btn btn-positive">전액 사용</a>
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
                <td>1000</td>
                <td>?배송비 찍기?</td>
                <td>?할인금액 찍기?</td>
                <td>?총 금액 찍기?</td>
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
          <button type="submit" class="btn btn-positive">결제하기</button>
        </div>
	</form>

    </div>
</body>

</html>
    
    <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>