<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
</head>
<body>
	<div>
		<h1>상품 등록</h1>
	</div>
	
	<form action = "insert" method = "post">
	<div>
		상위 카테고리 번호 : 
		<select name = "categoryHigh">
			<option>
		</select>
	</div>
	
	<div>
		하위 카테고리 번호 :
		<select name = "categoryLow">
			<option>
		</select>
	</div>
	
	<div>
		상품 이름 : 
		<input type = "text" name = "productName">
	</div>
		
	<div>
		상품 가격 : 
		<input type = "number" name = "productPrice">
	</div>
	
	<div>
		상품 정보 : 
		<textarea name = "productInformation"></textarea>
	</div>	
	
	<div>
		상품 재고 : 
		<input type = "number" name = "productInventory">
	</div>
	<div>
		<button type = "submit">등록</button>
	</div>
	</form>
</body>
</html>