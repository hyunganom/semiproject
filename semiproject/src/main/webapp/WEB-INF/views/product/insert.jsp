<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="상품 등록 페이지" name="title"/>
</jsp:include>

<!-- 자바 스크립트 코드 -->
<script type = "text/javascript">

        $(function(){
			$("#select-categoryHigh").on("change", function(){

				// 상위 카테고리 선택창의 값(value)을 변수로 설정
				var categoryHighNo = $("#select-categoryHigh").val();

				// 하위 카테고리에 해당하는 select 태그는 유지하며 내부의 선택 항목 삭제(초기화)
				$("#select-categoryLow").empty();

				$.ajax({
					// 상위 카테고리 번호를 매개변수로 전체 조회 수행
					url:"http://localhost:8888/rest/product/categoryLow?categoryHighNo="+categoryHighNo,
                    method:"get",
                    success:function(resp){

						// 상위 카테고리에 연결된 하위 카테고리의 수만큼 option 태그 생성
						for(var i = 0 ; i < resp.length ; i ++) {
							// 하위 카테고리 option 태그 생성 template을 변수로 설정
							var option = $("#option-categoryLow").text();
							// 임시로 작성했던 하위 카테고리 번호(categoryLowNo)를 resp의 categoryLowNo으로 변환
							option = option.replace("{{categoryLowNo}}", resp[i].categoryLowNo);
							// 임시로 작성했던 하위 카테고리 이름(categoryLowName)를 resp의 categoryLowName으로 변환
							option = option.replace("{{categoryLowName}}", resp[i].categoryLowName);
							// 변환이 끝난 option을 변수 result로 지정
							var result = $(option);
							// result를 이용하여 option 태그 생성
							$("select[name=categoryLowNo]").append(result);
						}
                    }
				});
			});
		});

</script>

<!-- 하위 카테고리 option 태그 생성 template -->
<script type = "text/template" id = "option-categoryLow">
	<option value = "{{categoryLowNo}}">{{categoryLowName}}</option>
</script>

<body>
	<div class = "container-800">
	
		<div class = "row">
			<h1>상위 카테고리 생성</h1>
		</div>
		
		<form action = "createCategoryHigh" method = "post">
		<div>
			상위 카테고리명 : <input name = "categoryHighName">
		</div>
		<div>
			<button type = "submit">생성</button>
		</div>
		</form>
		
		<div>
		<div class = "row">
			<h1>하위 카테고리 생성</h1>
		</div>

		<form action = "createCategoryLow" method = "post">	
		<div class = "row">
			상위 카테고리명 : 
			<select name = "categoryHighNo">
				<option value = "">선택</option>
				<c:forEach var = "categoryHighList" items = "${categoryHighList}">
					<option value = "${categoryHighList.categoryHighNo}">${categoryHighList.categoryHighName}</option>
				</c:forEach>
			</select>
		</div>
		<div class = "row">
			하위 카테고리명 : <input name = "categoryLowName">
		</div>
		<div class = "row">
			<button type = "submit">생성</button>
		</div>
		</form>
	</div>
	</div>
	

	<div class = "container-800">
		<h1>상품 등록</h1>
	
	<form action = "insert" method = "post" enctype = "multipart/form-data">
	<div class = "row">
		상위 카테고리 번호 : 
		<select name = "categoryHighNo" id = "select-categoryHigh">
			<option value = "">선택</option>
			<c:forEach var = "categoryHighList" items = "${categoryHighList}">
				<option value = "${categoryHighList.categoryHighNo}">${categoryHighList.categoryHighName}</option>
			</c:forEach>
		</select>
	</div>
	
	<div class = "row">
		하위 카테고리 번호 :
		<select name = "categoryLowNo" id = "select-categoryLow">
			<option>선택</option>
		</select>
	</div>
	
	<div class = "row">
		상품 이름 : 
		<input type = "text" name = "productName">
	</div>
		
	<div class = "row">
		상품 가격 : 
		<input type = "number" name = "productPrice">
	</div>
	
	<div class = "row">
		상품 정보 : 
		<textarea name = "productInformation"></textarea>
	</div>	
	
	<div class = "row">
		상품 재고 : 
		<input type = "number" name = "productInventory">
	</div>
	
	<div class = "row">
		상품 이미지 : 
		<input type = "file" name = "attachmentMainImg" accept = ".png, .jpg" multiple > 
	</div>
	<div class = "row">
		상품 상세이미지 : 
		<input type = "file" name = "attachmentSubImg" accept = ".png, .jpg" multiple > 
	</div>
	
	<div class = "row">
		<button type = "submit">등록</button>
	</div>
	
	</form>
	
	</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>