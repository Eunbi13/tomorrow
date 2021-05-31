<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/bootStrap.jsp"></c:import>
<c:import url="../template/summernote.jsp"></c:import>
<title>내일부터 하는 인테리어, 내일의 집</title>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<div class="container" style="margin-top: 50px; margin-bottom: 50px;">
<h1>상품 등록 페이지 </h1>


	<form action="./insert" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label class="col-sm-2 col-form-label">대표 이미지</label>
			<input type="file" name="rep">
			<div class="col-sm-10">
				<small>※ 필수 항목 입니다.</small>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 col-form-label">사진 올리기 </label>
			<input type="file" name="files">
		</div>

		<div class="form-group">
			<input class="form-control" name="" type="text" placeholder="Please title">
		</div>
	
		<div class="form-group">
			<label for="exampleFormControlTextarea1">내용</label>
			<textarea id="summernote" name="" class="form-control" id="exampleFormControlTextarea1"  ></textarea>
		</div>
	
		<div class="form-group row">
				<label class="col-sm-2 col-form-label">취급 카테고리<span>*</span></label>
				<div class="col-sm-10">
					<label class="col-sm-2 col-form-label">대분류</label>
				<c:forEach items="${bigCategory}" var="vo">
					<div class=" form-check form-check-inline ">
						<input class="form-check-input" type="checkbox" name="categories" value="${vo.categoryID}">
						<label class="form-check-label" for="inlineCheckbox1">${vo.category_detail_NM }</label>
					</div>
				</c:forEach>
				</div>
			</div>
	
	
		<button>button</button>
	</form>


</div>
<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript">
	$(document).ready(function() {
		$('#summernote').summernote({
	        placeholder: 'Please insert product detailed.',
	        tabsize: 2,
	        height: 500
	      });
	});
</script>
</body>
</html>