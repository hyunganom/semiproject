<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="${productDto.productName}" name="title"/>
</jsp:include>

<script type = "text/javascript">

	<%-- 누르는 버튼에 따라 전송하는 Mapping이 다르도록 설정 --%>
	$(function(){
		// 만약 구매 버튼을 눌렀다면 
	    $("#submit-purchase").click(function(){
	        $("#product-data").attr("action", "/");
	    });
		
		 // 만약 장바구니 버튼을 눌렀다면 /basket Mapping으로 form의 값을 전송
	    $("#submit-basket").click(function(){
	        $("#product-data").attr("action", "detail"); // 장바구니 Mapping 주소를 넣어주세요
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
		<th>상품 이름</th>
		<td>${productDto.productName}</td>
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

	<form id = "product-data" method = "post">
		<input type = "hidden" name = "productNo" value = "${productDto.productNo}"> <%-- 상품 번호 --%>
		<div class = "row">
			수량 : <input type = "number" name = "productCount" placeholder = "수량">
		</div>
		<div>
			<input type="hidden" name="basketCountNumber" value="1">
			<input type="hidden" name="basketProductNo" value="${productDto.productNo}">
			<input type="hidden" name="basketId" value="${loginId}">
		</div>
		
		<div>
			<span>옵션 1 :</span>
			<select name = "productOption" required>
				<option>선택</option>
				<c:forEach var = "productNoNameList" items = "${productNoNameList}">
					<option value = "${productNoNameList.productNo}">${productNoNameList.productName}</option>
				</c:forEach>
			</select>
		</div>
		
		<div>
			<span>옵션 2 :</span>
			<select name = "productOption" required>
				<option>선택</option>
				<c:forEach var = "productNoNameList" items = "${productNoNameList}">
					<option value = "${productNoNameList.productNo}">${productNoNameList.productName}</option>
				</c:forEach>
			</select>
		</div>
		
		<div>
			<span>옵션 3 :</span>
			<select name = "productOption" required>
				<option>선택</option>
				<c:forEach var = "productNoNameList" items = "${productNoNameList}">
					<option value = "${productNoNameList.productNo}">${productNoNameList.productName}</option>
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

</div>

</body>
</html>