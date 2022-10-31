<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value= "내가 작성한 상품 리뷰" name="title"/>
</jsp:include>



<div class = "container-800">

	<c:forEach var = "reviewList" items = "${reviewList}">
	
		<div class = "row" style = "background-color:skyblue;">
			리뷰 첨부 이미지 :<img width=50 height=50 src="/attachment/download/reviewImg?attachmentNo=${reviewList.reviewAttachmentNo}">
			<br>
			상품 주문번호 : ${reviewList.paymentOrderNo}
			<br>
			상품 이름 : ${reviewList.productName}
			<br>
			상품 갯수 : ${reviewList.paymentCount}
			<br>
			상품 옵션 : ${reviewList.paymentOption}
			<br>
			내가 입력한 별점 : ${reviewList.reviewGood}
			<br>
			리뷰 제목 : ${reviewList.reviewTitle}
			<br>
			리뷰 내용 : ${reviewList.reviewContent}
			<br>
			리뷰 작성일 : ${reviewList.reviewWritetime}
			<br>
			<a href="/review/edit?reviewNo=${reviewList.reviewNo}">리뷰수정하기</a>
			<a href="/review/delete?reviewNo=${reviewList.reviewNo}">삭제하기</a>
		</div>
	</c:forEach>

</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>