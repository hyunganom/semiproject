<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="상품 목록 페이지" name="title"/>
</jsp:include>
<script src="https://cdn.jsdelivr.net/gh/hiphop5782/score@latest/score.min.js"></script> 
<link rel = "stylesheet" type = "text/css" href = "/css/SANGMIN_category.css">

<script type="text/javascript">

	$(function(){
	    $(".star-score").score({
	    	starColor:"red", // 별 색상 (기본 : 금색)
            integerOnly:false, // 반올림
            display:{
                showNumber:false, // 숫자 표시
                placeLimit:1, // 소수점 자릿수
                textColor:"red", // 숫자 색상 (기본 : 금색)
            }
	    });
	});
	
</script>


<section class="listsection1">
    <div class="inner">
        <h2 class="listitemtitle">이거 유명한거 알지?</h2>
        <div class="listitem1">
            <ul class="itemW">
                   	<c:forEach var = "productList" items = "${productList}">
                <li>
                	<div class="listimg1">
						<p><a href= "detail?productNo=${productList.productNo}&categoryHighSub=${productList.categoryHighSub}"><img src="/attachment/download/productTumbnail?attachmentNo=${productList.productAttachmentNo}"></a></p>
						<p>${productList.categoryHighSub}</p>
						<p>${productList.productNo}</p>
						<p><a href = "detail?productNo=${productList.productNo}&categoryHighSub=${productList.categoryHighSub}">${productList.productName}</a></p>
						<p>${productList.productPrice}</p>
						<p>${productList.productGood}</p>
						<p>${productList.productInactive}</p>
					</div>
                </li>
					</c:forEach>
            </ul>
        </div> <!--//listitem1-->
    </div> <!--//listeitemtitle-->
</section> <!--listsection1-->

<div class="footer5">
    <div class="inner">
        <div class="listselect">
            <select name="listselect1" hidden>
                <option value="">상품명</option>
            </select> 
        </div> <!--//listselect-->
        <div class="formdiv1">
            <h1 class="search1">검색</h1>
            <form action="">
                <fieldset>
                    <legend>
                        <input type="submit" class="btnSearch1" value="검색">
                        <input type="text" class="textinput1" placeholder="검색어를 입력하시오.">
                    </legend>
                </fieldset>
            </form>
        </div> <!--//formdiv-->
    </div> <!--//inner-->
</div> <!--//footer5-->



<div align = "center">

<%-- 검색창 --%>
<form action = "category" method = "get">
	<%-- 카테고리 번호를 입력받아 조회해야하므로 검색을 위해 form에서 값을 보낼 때 하이퍼링크에서 입력받았던 카테고리 번호도 보내야 한다 --%>
	<input type = "hidden" name = "categoryHighNo" value = "${productListSearchCategoryVO.categoryHighNo}">
	<input type = "hidden" name = "categoryLowNo" value = "${productListSearchCategoryVO.categoryLowNo}">
	<select name = "type">
		<option value = "product_name" <c:if test = "${productListSearchCategoryVO.type == 'product_name'}">selected</c:if>>상품명</option>
	</select>
	<input name = "keyword" value = "${productListSearchCategoryVO.keyword}">
	<button type = "submit">검색</button>
</form>

<div class = "container-1200">
	
	<div class = "row">
		<a><img></a>
	</div>

</div>



<table> <%-- 임시로 추가 --%>
	<tbody>
		<c:forEach var = "productList" items = "${productList}">
		<tr>
			<td>구독상품인가 : ${productList.categoryHighSub}</td>
			<td>번호 : ${productList.productNo}</td>
			<td>
				<a href = "detail?productNo=${productList.productNo}&categoryHighSub=${productList.categoryHighSub}">${productList.productName}</a>
			</td>
			<td>${productList.productPrice}</td>
			<td>
				<%-- 카테고리에 대한 VO에서 별점에 관한 자료형을 double로 변경 --%>
				<div class = "star-score" data-max="5" data-rate = "${productList.productGood}"></div>
				<fmt:formatNumber value="${productList.productGood}" type="number" pattern="0.0"/>
			</td>
			<td>${productList.productInactive}</td>
			<td><img width=50 height=50 src="/attachment/download/productTumbnail?attachmentNo=${productList.productAttachmentNo}"></td>
		</tr>
		</c:forEach>
	</tbody>
</table>
		


<%-- 페이지 이동 --%>
<div class = "row">
	<%-- 첫 페이지인지 판정 --%>
	<c:choose>
		<c:when test = "${productListSearchCategoryVO.isFirst()}"> <%-- 첫 페이지라면 --%>
			<a href = "">&laquo;</a>  <%-- 현재 주소 유지 --%>
		</c:when>
		<c:otherwise> <%-- 그렇지 않다면(첫 페이지가 아니라면) --%>
			<a href = "category?pageNow=${productListSearchCategoryVO.blockFirst()}&${productListSearchCategoryVO.queryString()}">&laquo;</a> <%-- 첫 페이지로 이동 --%>
		</c:otherwise>
	</c:choose>
	
	<%-- 이전 페이지의 존재 여부 판정 --%>
	<c:choose>
		<c:when test = "${productListSearchCategoryVO.hasPrev()}"> <%-- 이전 페이지가 존재한다면 --%>
			<a href = "category?pageNow=${productListSearchCategoryVO.blockPrev()}&${productListSearchCategoryVO.queryString()}">&lt;</a> <%-- 이전 페이지로 이동 --%>
		</c:when>
		<c:otherwise> <%-- 그렇지 않다면(이전 페이지가 존재하지 않는다면) --%>
			<a href = "#">&lt;</a> <%-- 현재 주소 유지 --%>
		</c:otherwise>
	</c:choose>
	
	<%-- 페이지 블럭 표시 --%>
	<c:forEach var = "i" begin = "${productListSearchCategoryVO.blockStart()}" end = "${productListSearchCategoryVO.blockEnd()}" step = "1">
		<a href = "category?pageNow=${i}&${productListSearchCategoryVO.queryString()}">${i}</a>
	</c:forEach>
	
	<%-- 다음 페이지의 존재 여부 판정 --%>
	<c:choose>
		<c:when test = "${productListSearchCategoryVO.hasNext()}"> <%-- 다음 페이지가 존재한다면 --%>
			<a href = "category?pageNow=${productListSearchCategoryVO.blockNext()}&${productListSearchCategoryVO.queryString()}">&gt;</a> <%-- 다음 페이지로 이동 --%>
		</c:when>
		<c:otherwise> <%-- 그렇지 않다면(다음 페이지가 존재하지 않는다면) --%>
			<a href = "">&gt;</a> <%-- 현재 주소 유지 --%>
		</c:otherwise>
	</c:choose>
	
	<%-- 마지막 페이지인지 판정 --%>
	<c:choose>
		<c:when test = "${productListSearchCategoryVO.isLast()}"> <%-- 마지막 페이지라면 --%>
			<a href = "#">&raquo;</a> <%-- 현재 주소 유지 --%>
		</c:when>
		<c:otherwise>
			<a href = "category?pageNow=${productListSearchCategoryVO.blockLast()}&${productListSearchCategoryVO.queryString()}">&raquo;</a>
		</c:otherwise>
	</c:choose>
</div>

</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>