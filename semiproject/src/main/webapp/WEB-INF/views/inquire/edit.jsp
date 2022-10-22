<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="1:1 문의글 수정 페이지" name="title"/>
</jsp:include>


<div class = "container-900">

	<div class = "row">
		<h1>1:1 문의글 수정 페이지</h1>		
	</div>
	
	<form action = "edit" method = "post">
		<input type = "hidden" name = "inquireNo" value = "${inquireDto.inquireNo}">
		<div class = "row">
			<p>제목 : <input name = "inquireTitle" value = "${inquireDto.inquireTitle}"></p>
		</div>
		
		<div class = "row">
			<p>내용</p>
			<textarea name = "inquireContent">${inquireDto.inquireContent}</textarea>
		</div>
		<div>
			<button type = "submit">수정</button>
		</div>
	</form>

</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>