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
			<input class="form-control" name="title" type="text" placeholder="Please title">
		</div>
	
		<div class="form-group">
			<textarea id="summernote" name="contents" class="form-control" id="exampleFormControlTextarea1" placeholder="Please contents"></textarea>
		</div>
	
		<div class="form-group row"><!-- 클릭하면 ajax로 중부류, 소분류 불러오기 -->
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
	
	<!-- 브랜드번호, 대표이미지, 타이틀, 컨텐츠 넘기고 카테고리넘은,,,잘모르겠고, 
	안한거: 상품 이름, 가격, 할인율, 배송비 -->
		<div class="form-group"><!-- 더하기 버튼이 필요(옵션도,,) -->
			<label for="exampleFormControlTextarea1">상품 이름</label>
			<input class="form-control" name="productName" type="text" placeholder="Please ProductName">
		</div>
	
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">가격</label>
			<div class="col-sm-10">
				<input class="form-control" name="productPrice" type="number" placeholder="Please productPrice">
			</div>
		</div>
	
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">할인율 설정</label>
			<div class="col-sm-10">
				<input class="form-control" name="discount" type="number" placeholder="Please discount">
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">배송비 설정</label>
			<div class="col-sm-10">
				<input class="form-control" name="shippingFee" type="number" placeholder="Please shippingFee">
			</div>
		</div>
	
		<button>button</button>
	</form>


</div>
<c:import url="../template/footer.jsp"></c:import>

</body>
</html>