<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="상품 목록 페이지" name="title"/>
</jsp:include>

<div align = "center">

<%-- 검색창 --%>
<form action = "list" method = "get">
	<%-- 일단 상품명 조회만 추가했으며 차후 테이블 조인을 통해 카테고리 이름으로도 조회가 가능하도록 바꿀 예정 --%>
	<select name = "type">
		<option value = "product_name" <c:if test = "${productListSearchVO.type == 'product_name'}">selected</c:if>>상품명</option>
	</select>
	<input name = "keyword" value = "${productListSearchVO.keyword}">
	<button type = "submit">검색</button>
</form>

<table border = "1" width = "1000" >
	<tbody>
		<tr align = "right">
			<td colspan = "15"><a href = "insert">등록</a></td>
		</tr>
		<tr>
			<th>상품 번호</th>
			<th>상위 카테고리 번호</th>
			<th>하위 카테고리 번호</th>
			<th>상품 이름</th>
			<th>상품 가격</th>
			<th>상품 정보</th>
			<th>상품 재고</th>
			<th>상품 별점</th>
			<th>상품 등록일</th>
			<th>상품 수정일</th>
			<th>상품 상태</th>
			<th colspan = "3">관리자 명령</th>
		</tr>
		
		<c:forEach var = "productList" items = "${productList}">
		
		<tr>
			<td>${productList.productNo}</td>
			<td>${productList.categoryHighNo}</td>
			<td>${productList.categoryLowNo}</td>
			<td>
				<a href = "detail?productNo=${productList.productNo}">${productList.productName}</a>
			</td>
			<td>${productList.productPrice}</td>
			<td>${productList.productInformation}</td>
			<td>${productList.productInventory}</td>
			<td>${productList.productGood}</td>
			<td>${productList.productRegisttime}</td>
			<td>${productList.productUpdatetime}</td>
			<td>${productList.productInactive}</td>
			<td><a href = "edit?productNo=${productList.productNo}">수정</a></td>
			<td><a href = "delete?productNo=${productList.productNo}">삭제<br>(비활성화)</a></td>
			<td><a href = "deleteAdmin?productNo=${productList.productNo}">삭제<br>(DELETE)</a></td>
		</tr>
		</c:forEach>
		
		<tr align = "right">
			<td colspan = "15"><a href = "insert">등록</a></td>
		</tr>
	</tbody>	
</table>

<%-- 페이지 이동 --%>
<div class = "row">
	<%-- 첫 페이지인지 판정 --%>
	<c:choose>
		<c:when test = "${productListSearchVO.isFirst()}"> <%-- 첫 페이지라면 --%>
			<a href = "">&laquo;</a>  <%-- 현재 주소 유지 --%>
		</c:when>
		<c:otherwise> <%-- 그렇지 않다면(첫 페이지가 아니라면) --%>
			<a href = "list?pageNow=${productListSearchVO.blockFirst()}">&laquo;</a> <%-- 첫 페이지로 이동 --%>
		</c:otherwise>
	</c:choose>
	
	<%-- 이전 페이지의 존재 여부 판정 --%>
	<c:choose>
		<c:when test = "${productListSearchVO.hasPrev()}"> <%-- 이전 페이지가 존재한다면 --%>
			<a href = "list?pageNow=${productListSearchVO.blockPrev()}&${productListSearchVO.queryString()}">&lt;</a> <%-- 이전 페이지로 이동 --%>
		</c:when>
		<c:otherwise> <%-- 그렇지 않다면(이전 페이지가 존재하지 않는다면) --%>
			<a href = "#">&lt;</a> <%-- 현재 주소 유지 --%>
		</c:otherwise>
	</c:choose>
	
	<%-- 페이지 블럭 표시 --%>
	<c:forEach var = "i" begin = "${productListSearchVO.blockStart()}" end = "${productListSearchVO.blockEnd()}" step = "1">
		<a href = "list?pageNow=${i}&${productListSearchVO.queryString()}">${i}</a>
	</c:forEach>
	
	<%-- 다음 페이지의 존재 여부 판정 --%>
	<c:choose>
		<c:when test = "${productListSearchVO.hasNext()}"> <%-- 다음 페이지가 존재한다면 --%>
			<a href = "list?pageNow=${productListSearchVO.blockNext()}&${productListSearchVO.queryString()}">&gt;</a> <%-- 다음 페이지로 이동 --%>
		</c:when>
		<c:otherwise> <%-- 그렇지 않다면(다음 페이지가 존재하지 않는다면) --%>
			<a href = "">&gt;</a> <%-- 현재 주소 유지 --%>
		</c:otherwise>
	</c:choose>
	
	<%-- 마지막 페이지인지 판정 --%>
	<c:choose>
		<c:when test = "${productListSearchVO.isLast()}"> <%-- 마지막 페이지라면 --%>
			<a href = "#">&raquo;</a> <%-- 현재 주소 유지 --%>
		</c:when>
		<c:otherwise>
			<a href = "list?pageNow=${productListSearchVO.blockLast()}&${productListSearchVO.queryString()}">&raquo;</a>
		</c:otherwise>
	</c:choose>
</div>

</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>