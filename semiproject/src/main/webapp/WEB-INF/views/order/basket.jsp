<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="장바구니" name="title"/>
</jsp:include>

<style>
	.table> tbody> tr > th,
	.table> tbody> tr > td{
		padding:32px 0px;
	}
	.table.table-slit > thead{
		border-bottom:1px solid #d8dbe0;
	}
	.table.table-slit > thead > tr > th{
		padding:10px;
	}
	.total-items, .total-delivery, .total-price{
		font-size:25px ;
		font-weight: bold;
	}
	.img, td{
		vertical-align: middle;
	}
	.green{
		color:#4CB756;
	}
	.price-field, .delivery-field, .result-field{
		display:inline-block;
	}
	.icon-type, .delivery-wrap, .result-wrap{
		display:inline-block;
	}
	.icon-type{
		vertical-align: top;
		padding:8px;
	}
	.result-text{
		color:#454545;
		font-size:13px;
		opacity:0.6;
	}
	.result-count{
		color:#454545;
		font-size:14px;
	}
	.inputCnt{
		font-size: 16px;
		color: black;
    	padding: 7px 8px;
    	outline: none;
    	text-align:center;
    	border: 1px solid #d8dbe0;
    	border-left:none;
    	border-right:none;
    	background-color: white;
    	height:30px;
    	float:left;
	}
	
	.count_controller{
		position:relative;
		float:left;
	}
</style>

<script type="text/javascript">
	$(function(){
		<!-- 처음 들어왔을 때 전체선택 체크되게 하기 -->
		var items = "${basketVO.size()==0}";
		if(items=='false'){
			$(".checkedAll").prop("checked", true);
			$(".checked").prop("checked", true);
			total();			
		}
		
		<!-- 체크박스 선택/해제 -->
    	$(".checkedAll").on("input", function(){
    		var judge = $(this).prop("checked");
    		if(judge==false){
    			$(".checked").prop("checked", false);
    		}else{
    			$(".checked").prop("checked", true);
    		}
    		total();
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
    		total();
    	});
    	
		<!-- 상품 금액(콜백함수) -->
		function calcul(){
			var count = $(".checked").length;
			var sum = 0;
            for (var i = 0; i < count; i++) {
                if ($(this).checked == true) {
                	
                	var cnt = parseInt($(".cnt").val());
                	var price = parseInt($(".price").text());
                    sum += (cnt*price);
                }
            }
            return sum;
		}

		<!-- 배송비(콜백함수) -->
		function deliveryFee(){
			var itemsPrice = parseInt($(".total-items").text()); //상품금액
			var delivery;
			if(itemsPrice>=50000){
				delivery=0;
			}else{
				delivery=3000;
			}
			return delivery;
		}
		
		<!--총 금액(콜백함수)-->
		function total(){
	    	//상단(배송비)
	    	$(".delivery").text(deliveryFee());
	    	//하단(상품금액)
			$(".total-items").text(calcul());
	    	//하단(배송비)
	    	$(".total-delivery").text(deliveryFee());
	    	//하단(총금액)
			$(".total-price").text(calcul()+deliveryFee());
		}
		
		
 		function updateBasketCnt(basketNo, cnt){
 			$.ajax({
 				url:"http://localhost:8888/basket/update?basketNo="+basketNo+"&cnt="+cnt,
 				method:"get",
 				success:function(resp){
 					if(resp==="success"){
 						alert("수량이 변경되었습니다!");
 						location.reload();
 					}else{
 						alert("장바구니 수량이 변경되지 않았습니다!");
 					}	
 				}
 			});
		} 

		
		<!--수량 변경 버튼 이벤트 -->		
		//플러스 버튼을 누를 경우 수량증가(배열이므로 형제를 찾아서 선택)
  		$(".plus").click(function(){
			var plus = parseInt($(this).prev().val())+1;
			var basketNo = parseInt($(this).next().val());
			updateBasketCnt(basketNo, plus);
			$(this).siblings(".minus").attr("disabled",false); 
		}); 
		
		//마이너스 버튼을 누를 경우 수량감소(1개미만 비활성화 처리)
 		$(".minus").click(function(){
			var minus = parseInt($(this).next().val())-1;
			var basketNo = parseInt($(this).siblings(".basketNo").val());
			updateBasketCnt(basketNo, minus);
			var judge = $(this).next().val();
			if(judge==1){
				$(this).attr("disabled", true);
			}else{
				$(this).attr("disabled", false);
			}
		}); 
		
		//수량 직접 입력할 경우
		$(".cnt").blur(function(){
			var input = parseInt($(this).val());
			var basketNo = parseInt($(this).siblings(".basketNo").val());
			if(input<1){
				alert('1개 이상의 수량을 입력해주세요!');
			}else{
				updateBasketCnt(basketNo, input);
			}
		});
		
/* 		<!--선택 삭제 이벤트 함수 -->
		function selectDelete(basketNo){
			$.ajax({
 				url:"http://localhost:8888/basket/delete_2?basketNo="+basketNo,
 				method:"get",
 				success:function(resp){
 					if(resp==="success"){
 						alert("삭제가 완료되었습니다!");
 						location.reload();
 					}else{
 						alert("삭제실패!");
 					}	
 				}
 			});
		}
		
		
		<!--선택 삭제 이벤트-->
 		$(".select-delete").click(function(){
 			var count = $(".checked").length;
			for(var i=0; i<count; i++){
				var judge = $(this).prop("checked");
				if(judge==true){
					var basketNo = $(this).val();
					selectDelete(basketNo);
				}
			}
 		}); */

 		//선택삭제 버튼 눌러지고 삭제 db에 갔다와야함
 		//금액 다시 출력해야함
 		
		<!--주문하기 버튼 이벤트 -->
		//장바구니에 상품이 없을경우 버튼 클릭시 상품을 담아주세요 문구 출력
		//상품이 있지만 선택하지 않고 버튼 클릭 시 주문할 상품을 선택해주세요 문구 출력
		//수량이 0인 경우 수량을 다시 선택해주세요 문구 출력

	});
</script>
    <div class="container-1050 mt-50">
        <div class="row left">
            <h1>장바구니</h1>
        </div>
	<form action="/order/order_ck" method="get">
        <div class="row mt-30">
            <table class="table table-basket">
                <thead>
                    <tr>
                        <th class="w-5">
                            <input type="checkbox" class="checkedAll">
                        </th>
                        <th class="w-50 sideline" colspan="2">상품정보</th>
                        <th class="w-15">수량</th>
                        <th class="w-15">가격</th>
                        <th class="w-15">배송비</th>
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
		                        <td>
		                        	<input type="checkbox" class="checked" name="basketNo" value="${vo.basketNo}">
		                        </td>
		                        <td>
		                        	<img class="img" width=100 height=100 src="/attachment/download/productTumbnail?attachmentNo=${vo.productAttachmentNo}">
		                        </td>
		                        <td>
		                        	<span>${vo.productName}<br></span>
		                        	<span>${vo.basketProductOption}</span>
		                        </td>
		                        <td class="center">
		                        	<div>
			                        	<button class="btns-neutral count_controller minus" type="button">-</button>
			                        	<input class="cnt inputCnt w-33" type="text" value="${vo.basketCountNumber}">
			                        	<button class="btns-neutral count_controller plus" type="button">+</button>
			                        	<input type="hidden" class="basketNo" value="${vo.basketNo}">
		                        	</div>
		                        
		                        <td>
		                        	<span class="price">	${vo.productPrice}</span>
		                        	<a href="delete?productNo=${vo.basketProductNo}">
		                        		<i class="fa-solid fa-trash-can"></i>
		                        	</a>
		                        </td>
		                        <td>
									<span class="delivery">0</span>
		                        </td>
                    		</tr>
                    	</c:forEach>
                	</c:otherwise>
                </c:choose>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="6">
                            <button class="btns-neutral select-delete" type="button">선택상품 삭제</button>
                        </td>
                    </tr>
                </tfoot>
            </table>
			
			<table class="table table-slit mt-40">
				<thead>
					<tr class="left">
						<th class="result-count">총 주문 상품 <span class="green purchase-cnt">${basketVO.size()}</span>개</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="center result-container">
							<div class="price-container">
								<div class="price-field">
									<div class="price-wrap">
										<span class="total-items">0</span>원
										<p class="mt-20 result-text">상품금액</p>
									</div>
								</div>
								<div class="delivery-field">
									<div class="icon-type">
										<i class="fa-solid fa-plus"></i>
									</div>
									<div class="delivery-wrap">
										<span class="total-delivery">0</span>원
										<p class="mt-20 result-text">배송비</p>
									</div>
								</div>
								<div class="result-field">
									<div class="icon-type">
										<i class="fa-solid fa-equals"></i>
									</div>
									<div class="result-wrap">
										<span class="total-price green">0</span>원
										<p class="mt-20 result-text">총 주문금액</p>
									</div>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="row center mt-40 mb-40">
            	<button type="submit" class="form-btn btns btns-positive">주문하기</button>
            </div> 
        </div>
        </form>
    </div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
