<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="주문서 작성" name="title"/>
	</jsp:include>
	
	<div class="container-900 mt-50">
        <div class="row">
            <h2>주문 / 결제</h2>
        </div>

        <hr>

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
                ?옵션?
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
            <label>
              <input type="checkbox" id="checkbox">
              <span class="sameinfo">위 정보와 같음</span>
            </label>
          </h3>
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

    </div>
    
    <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>