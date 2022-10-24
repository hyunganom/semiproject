<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="장바구니" name="title"/>
</jsp:include>

<script type="text/javascript">
	$(function(){
    	$(".checkedAll").on("input", function(){
    		var judge = $(this).prop("checked");
    		$(".checked").prop("checked", judge);
    	});
    	
    	$(".checked").on("input", function(){
    		var cnt = 0;
    		$(".checked").each(function(){
    			if($(this).prop("checked")){
    				cnt++;
    			}
    		});
    		var judge = $(".checked").length == cnt;
    		if(judge){
    			$(".checkedAll").prop("checked", true);
    		}else{
    			$(".checkedAll").prop("checked", false);
    		}
    	});
	});
</script>

    <div class="container-1050 mt-50">
        <div class="row left">
            <h1>장바구니</h1>
        </div>

        <div class="row mt-30">
            <table class="table table-basket">
                <thead>
                    <tr>
                        <th class="w-5">
                            <input type="checkbox" class="checkedAll">
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
                			<td class="w-5"><input type="checkbox" class="checked"></td>
                			<td colspan="4">장바구니 담긴 내역이 없습니다!</td>
                		</tr>
                	</c:when>
                	<c:otherwise>
                		<c:forEach var="vo" items="${basketVO}">
	                    	<tr class="center">
		                        <td class="w-5"><input type="checkbox" class="checked"></td>
		                        <td class="w-50">
		                        	${vo.productName}<br>
		                        	${vo.basketProductOption}
		                        </td>
		                        <td class="w-15">
		                        	${vo.basketCountNumber}<br>
		                            <button type="button">옵션/수량 변경</button>
		                        <td class="w-15">
		                            ${vo.productPrice}<br>
		                        	<a href="delete?productNo=${vo.basketProductNo}">
		                        		<i class="fa-solid fa-trash-can"></i>
		                        		(비활성화)
		                        	</a>
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
			
			<table class="table table-slit mt-40">
				<tbody>
					<tr class="left">
						<td>총 주문 상품 <span>${basketVO.size()}</span>개</td>
					</tr>
					<tr class="center">
						<td>
							<div class="price">
								<span class="items">
									?상품금액?<i class="fa-solid fa-plus"></i>
								</span>
								<span class="delivery">?배송비?<i class="fa-solid fa-equals"></i></span>
								<span class="total">?총 주문금액?</span>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
            
            <div class="row center mt-50">
            	<a href="/order/order_ck" class="btns btns-positive">주문하기</a>
            </div>
            
        </div>
    </div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
