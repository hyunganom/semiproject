<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="장바구니" name="title"/>
</jsp:include>

<style>
	.items, .delivery, .total{
		font-size:28px ;
		font-weight: bold;
	}
</style>

<script type="text/javascript">
	$(function(){
		<!-- model로 넘어온 basketVO의 상품가격, 수량 js에서도 사용가능하도록 처리 -->
		var price = new Array();
		var cnt = new Array();
		<c:forEach items="${basketVO}" var="vo">
			price.push("${vo.productPrice}");
			cnt.push("${vo.basketCountNumber}");
		</c:forEach>

		<!-- 처음 들어왔을 때 전체선택 체크되게 하기 -->
		var items = "${basketVO.size()==0}";
		if(items=='false'){
			$(".checkedAll").prop("checked", true);
			$(".checked").prop("checked", true);
			calcul();
		}
		
		<!-- 체크박스 선택/해제 -->
    	$(".checkedAll").on("input", function(){
    		var judge = $(this).prop("checked");
    		if(judge==false){
    			$(".checked").prop("checked", false);
    			calcul();
    		}else{
    			$(".checked").prop("checked", true);
    			calcul();
    		}
    	});
    	
    	$(".checked").on("input", function(){
    		calcul();
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
    	
		<!-- 금액산출 함수 -->
		function calcul(){
			var count = $(".checked").length;
			var sum = 0;
            for (var i = 0; i < count; i++) {
                if ($(".checked")[i].checked == true) {
                    sum += (parseInt(price[i])*parseInt(cnt[i]));
                }
            } 
            $("span.items").text(sum);
            
            <!-- 배송비 + 총 금액 -->
            var itemPrice = parseInt($("span.items").text());
            if(sum>=50000){
            	$(".delivery").text(0);
            	$(".total").text(itemPrice);
            }else if(sum==0){
            	$(".delivery").text(0);
            	$(".total").text(0);
            }else{
            	$(".delivery").text(3000);
            	$(".total").text(itemPrice+parseInt($(".delivery").text()));
            }

		}

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
		                        	<span>${vo.productName}<br></span>
		                        	<span>${vo.basketProductOption}</span>
		                        </td>
		                        <td class="w-15">
		                        	${vo.basketCountNumber}<br>
		                            <button type="button">옵션/수량 변경</button>
		                        <td class="w-15">
		                            <span class="items-price">${vo.productPrice}</span><br>
		                        	<a href="delete?productNo=${vo.basketProductNo}">
		                        		<i class="fa-solid fa-trash-can"></i>
		                        		(비활성화)
		                        	</a>
		                        </td>
		                        <td class="w-15">
									<span>?적립금찍기?</span>
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
								<span class="items">0</span>
								<i class="fa-solid fa-plus"></i>
								<span class="delivery">0</span>
								<i class="fa-solid fa-equals"></i>
								<span class="total">0</span>
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
