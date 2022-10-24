<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="1:1 문의글 작성 페이지" name="title"/>
</jsp:include>

<div class = "container-1200">

	<div class = "row">
		<h1>1:1 문의 작성</h1>
	</div>
	
	<form action = "write" method = "post" enctype = "multipart/form-data">
	<div class = "row">
		문의글 제목 : <input name = "inquireTitle">
	</div>
	
	<div class = "row">
		문의글 내용 : <input name = "inquireContent">
	</div>
	
	<div>
		첨부파일 : <input type = "file" name = "attachmentInquireImg" accept = ".png, .jpg" multiple>
	</div>
	
	<div>
		<button type = "submit">작성</button>
	</div>
	
	<div>
		<a href = "list">목록</a>
	</div>
	</form>

</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>