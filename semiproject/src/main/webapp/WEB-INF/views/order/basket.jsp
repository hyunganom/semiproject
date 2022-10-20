<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="장바구니" name="title"/>
</jsp:include>

    <style>
        .table.table-border > thead > tr > th{
            border-left:none;
            border-right:none;
        }
    </style>

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
                        <th class="w-15">주문금액</th>
                        <th class="w-15">배송비</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="center">
                        <th class="w-5"><input type="checkbox"></th>
                        <td class="w-50">?상품정보?</td>
                        <td class="w-15">
                            ?수량?
                            <button type="button">옵션/수량 변경</button>
                        </td>
                        <td class="w-15">
                            ?주문금액?
                            <button type="button">바로구매</button>
                        </td>
                        <td class="w-15">?배송비?</td>
                    </tr>
                    
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
            			<td>총 주문 상품<span>(개수)</span>개</td>
            		</tr>
            		<tr>
            			
            		</tr>
            	</tbody>
            </table>
            
            <div class="row center">
            	<a href="order/order_ck" class="btn btn-positive">주문하기</a>
            </div>
            
        </div>
    </div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
