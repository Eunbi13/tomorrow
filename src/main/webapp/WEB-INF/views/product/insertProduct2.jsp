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


	<form id="productFrm" action="./insert" method="post" enctype="multipart/form-data">
		<fieldset>
			<legend>카테고리<span>*</span></legend>	
			<div class="col-sm-12"> 
				<div class="form-group row"><!-- 클릭하면 ajax로 중부류, 소분류 불러오기 -->
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
			</div>
		</fieldset>
<br>
	
	
		<fieldset >
			<legend>제품 정보<span>*</span></legend>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">상품명</label>
				<input class="form-control col-sm-10" name="productName" type="text" placeholder="Please ProductName">
			</div>
		</fieldset>
<br>
		<fieldset >
			<legend>이미지</legend>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">대표 이미지<span>*</span></label>
				<input type="file" name="rep" class="form-control col-sm-10" >
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">사진 올리기 </label>
				<input type="file" name="files" class="form-control col-sm-10" >
			</div>
		</fieldset>
<br>

		<fieldset>
			<legend>상세 페이지 작성</legend>
			<input id="summernote" name="contents"> 
			
		</fieldset>	
		
<br>		
		<fieldset >
		<legend>판매가<span>*</span></legend>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">가격</label>
				<div class="col-sm-10">
					<input class="form-control" name="productPrice" type="number" placeholder="Please number">
				</div>
			</div>
		
			<div class="form-group row">
				<label class="col-sm-2  col-form-label">할인율</label>
				<div class="col-sm-10">
					<input class="form-control" name="discount" type="number" placeholder="Please number">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2  col-form-label">배송비 설정</label>
				<div class="col-sm-10">
					<input class="form-control" name="shippingFee" type="number" placeholder="Please number">
				</div>
			</div>
		</fieldset>
	<br>

		<fieldset>
			<legend>옵션</legend>
			<div class="col-sm-12">
				<label class="col-sm-2 col-form-label">옵션 구성 타입 </label>
				조합 일체선택형<input type="radio" id="notUse" name="o1" checked>
				조합 분리선택형<input type="radio" id="use" name="o1">
				<div >
					<div class="form-group row col-sm-3">
						<label class="col-form-label">옵션 종류</label>
						<div >
							<input class="form-control" name="optionKinds" type="text" placeholder="Please kinds">
						</div>
					</div>
					<div class="form-group row col-sm-3">
						<label class="col-form-label">옵션별 이름</label>
						<div >
							<input class="form-control" name="optionName" type="text" placeholder="Please name">
						</div>
					</div>
					<div class="form-group row col-sm-3">
						<label class="col-form-label">옵션별 가격</label>
						<div >
							<input class="form-control" name="optionPrice" type="number" placeholder="Please price">
						</div>
					</div>
					<div class="form-group row col-sm-1" >
						<img alt="" src="/images/plusIcon.png" style="width: 30px; height: 30px;">
					</div>
				</div>
			</div>
		</fieldset>
		<button>gu</button>
	</form>
		
		<div id="btn" class="btn btn-secondary">저장하기</div>
		<small>adfasdgads</small>
</div>

<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript" src="/js/productInsert.js"></script>

</body>
</html>