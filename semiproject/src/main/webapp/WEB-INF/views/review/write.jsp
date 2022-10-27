<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- header.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="리뷰 작성" name="title"/>
</jsp:include>

<form action = "write" method = "post" enctype = "multipart/form-data">

리뷰 제목 : <input name = "reviewTitle" type = "text"><br>
리뷰 별점 : <input name = "reviewGood" type = "number"><br>
리뷰 내용 : <textarea name = "reviewContent"></textarea><br>
리뷰 이미지 : <input name = "attachmentReviewImg" type="file" accept = ".png, .jpg" multiple><br>
<button type = "submit">등록</button>
</form>


<%-- footer.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
