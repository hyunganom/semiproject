<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- header.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="리뷰 작성" name="title"/>
</jsp:include>

<form action = "write" method = "post">

리뷰 제목 : <input name = "reviewTitle" type = "text">
리뷰 별점 : <input name = "reviewGood" type = "number">
리뷰 내용 : <textarea name = "reviewContent"></textarea>

</form>


<%-- footer.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
