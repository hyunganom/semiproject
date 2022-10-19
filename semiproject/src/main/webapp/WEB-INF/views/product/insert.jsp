<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
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
	
	<form action = "insert" method = "post" enctype = "multipart/form-data">
	<div>
		상위 카테고리 번호 : 
		<input name = "categoryHighNo">
	</div>
	
	<div>
		하위 카테고리 번호 :
		<input name = "categoryLowNo">
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
		상품 이미지 : 
		<input type = "file" name = "attachment" accept = ".png, .jpg" multiple > 
	</div>
	
	<div>
		<button type = "submit">등록</button>
	</div>
	</form>
</body>
</html>