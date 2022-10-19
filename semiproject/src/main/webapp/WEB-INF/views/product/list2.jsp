<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
여기는 이현재씨가 테스트하면서 삽질했던곳 임미다.
<c:forEach var="attachmentDto" items="${list}">
	<img width=50 height="50" src="/attachment/download?attachmentNo=${attachmentDto.attachmentNo}">
	
	[${attachmentDto.attachmentType}]
	
	<a href="/attachment/download?attachmentNo=${attachmentDto.attachmentNo}">
	${attachmentDto.attachmentName }
	</a>
	
	(${attachmentDto.attachmentSize }bytes)
	<br>
</c:forEach>

</body>
</html>