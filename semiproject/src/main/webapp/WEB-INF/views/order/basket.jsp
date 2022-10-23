<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="장바구니" name="title"/>
</jsp:include>

    <div class="container-900 mt-50">
        <div class="row left">
            <h1>장바구니</h1>
        </div>

        <div class="row mt-30">
            <table class="table table-border">
                <thead>
                    <tr>
                        <th class="w-5">
                            <input type="checkbox">
                        </th>
                        <th class="w-50 sideline">상품 정보</th>
                        <th class="w-15">수량</th>
                        <th class="w-15">가격</th>
                        <th class="w-15">적립금</th>
                    </tr>
                </thead>
                <tbody>
                
                <c:choose>
                	<c:when test="${basketVO.size()==0}">
                		<tr class="center">
                			<td class="w-5"><input type="checkbox"></td>
                			<td colspan="4">장바구니 담긴 내역이 없습니다!</td>
                		</tr>
                	</c:when>
                	<c:otherwise>
                		<c:forEach var="vo" items="${basketVO}">
	                    	<tr class="center">
		                        <td class="w-5"><input type="checkbox"></td>
		                        <td class="w-50">
		                        	${vo.productName}<br>
		                        	${vo.basketProductOption}
		                        </td>
		                        <td class="w-15">
		                        	${vo.basketCountNumber}<br>
		                            <button type="button">수량 변경</button>
		                        <td class="w-15">
		                            ${vo.productPrice}<br>
		                            <%--                         	<a href="delete?${vo.productNo}">삭제(비활성화)</a> --%>
		                        	<a href="#">삭제(비활성화)</a>
		                        </td>
		                        <td class="w-15">
									?적립금찍기?
		                        </td>
                    		</tr>
                    	</c:forEach>
                	</c:otherwise>
                </c:choose>
                    
  
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="5">
                            <button>선택상품 삭제</button>
                            <button>품절상품 삭제</button>
                        </td>
                    </tr>
                </tfoot>
            </table>
            
            <table>
            	<tbody>
            		<tr>
            			<td>총 주문 상품<span>${basketVO.size()}</span>개</td>
            		</tr>
            		<tr>
            			
            		</tr>
            	</tbody>
            </table>
            
            <div class="row center">
            	<a href="/order/order_ck" class="btn btn-positive">주문하기</a>
            </div>
            
        </div>
    </div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
