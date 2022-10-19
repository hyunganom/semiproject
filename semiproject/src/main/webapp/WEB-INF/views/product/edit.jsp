<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정 페이지</title>
</head>
<body>

<div>

<form action = "edit" method = "post">
<%-- 상품 정보 수정을 위한 상품 번호(값을 유지한 채로 다시 form에 전송하기 위해 hidden으로 설정) --%>
<input type = "hidden" name = "productNo" value = "${productDto.productNo}">
<div>
	상위 카테고리 : <input type = "number" name = "categoryHighNo" value = "${productDto.categoryHighNo}">
</div>

<div>
	하위 카테고리 : <input type = "number" name = "categoryLowNo" value = "${productDto.categoryLowNo}">
</div>

<div>
	상품 이름 : <input type = "text" name = "productName" value = "${productDto.productName}">
</div>

<div>
	상품 가격 : <input type = "text" name = "productPrice" value = "${productDto.productPrice}">
</div>

<div>
	상품 정보 : <textarea name = "productInformation">${productDto.productInformation}</textarea>
</div>

<div>
	상품 재고 : <input type = "text" name = "productInventory" value = "${productDto.productInventory}">
</div>

<div>
	<button type = "submit">수정</button>
</div>
</form>

</div>

</body>
</html>