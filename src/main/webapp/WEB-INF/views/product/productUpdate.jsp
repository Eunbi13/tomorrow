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


	<form id="productFrm" action="./update" method="post" enctype="multipart/form-data">
		<fieldset>
			<legend>카테고리<span>*</span></legend>	
			<div class="col-sm-12"> 
				<div class="form-group row"><!-- 클릭하면 ajax로 중부류, 소분류 불러오기 -->
					<div class="col-sm-12">
					<div id="category" hidden="hidden">
						<input class="form-control" name="categoryID" value="${categoryVO.categoryID}">
						<label class="">${categoryVO.category_detail_NM}</label>
					</div>	
						<div>카테고리(소분류) 이름: ${categoryVO.category_detail_NM}</div>
						<div>카테고리 아이디: ${categoryVO.categoryID}</div>
						<div>변경하기</div>
					</div>
					<div class="col-sm-12" style="display: none;">
						<label class="col-sm-2 col-form-label">선택*</label>
						<c:forEach items="${categoryOne}" var="vo">
						<div class=" form-check form-check-inline ">
							<input class="form-check-input ch" type="checkbox" name="one" value="${vo.categoryID}">
							<label class="form-check-label" for="inlineCheckbox1">${vo.category_detail_NM }</label>
						</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div id="two"></div>
			<div id="three"></div>
		</fieldset>
<br>
	
	
		<fieldset >
			<legend>제품 정보<span>*</span></legend>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">상품명</label>
				<input name="productName" value="${productVO.productName }"
				class="form-control col-sm-10" type="text" placeholder="Please ProductName">
			</div>
		</fieldset>
<br>
		<fieldset >
			<legend>이미지</legend>
			<div>
				<label class="col-sm-2 col-form-label">대표 이미지<span>*</span></label>
				<img alt="" src="/upload/productImages/${productVO.productPic}">
				<div>대표 이미지 교체하기</div>
				<div style="font-weight: bold">추가 이미지</div>
				<c:forEach items="${productVO.images }" var="img">
					<img alt="" src="/upload/productImages/${img.fileName}">
				</c:forEach>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">대표 이미지<span>*</span></label>
				<input type="file" name="rep" class="form-control col-sm-10" >
			</div>
			<div class="imageAdd">
				<div id="files">
					<div style="font-weight: bold">추가 이미지</div>
					
				</div>
				<div id="filesSample" style="display: none">
					<div class="form-group row" >
						<label class="col-sm-2 col-form-label"></label>
						<input type="file" name="files" class="form-control col-sm-9" >
						<label class="col-sm-1 col-form-labe deleteImage">x</label>
					</div>
				</div>
			</div>
			<div id="imageAdd" class="btn">+</div>
		</fieldset>
<br>

		<fieldset>
			<legend>상세 페이지 작성</legend>
		<div class="form-group">
			<textarea id="summernote" name="contents" class="form-control" id="exampleFormControlTextarea1" placeholder="Please contents">
				${productVO.contents}
			</textarea>
		</div> 
			
		</fieldset>	
		
<br>		
		<fieldset >
		<legend>판매가<span>*</span></legend>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">가격</label>
				<div class="col-sm-10">
					<input class="form-control" name="productPrice" value="${productVO.productPrice }"
					type="number" placeholder="Please number">
				</div>
			</div>
		
			<div class="form-group row">
				<label class="col-sm-2  col-form-label">판매가격</label>
				<div class="col-sm-10">
					<input class="form-control" name="discountPrice" value="${productVO.discountPrice }"
					type="number" placeholder="Please number">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2  col-form-label">배송비 설정</label>
				<div class="col-sm-10">
					<input class="form-control" name="shippingFee" value="${productVO.shippingFee }"
					type="number" placeholder="Please number">
				</div>
			</div>
		</fieldset>
	<br>
				<fieldset>
			<legend>옵션</legend>
			<label class="col-sm-2 col-form-label">옵션 구성 타입 </label>
				조합 일체선택형<input type="radio" id="notUse" name="o1" checked>
				조합 분리선택형<input type="radio" id="use" name="o1">
			<!-- Button trigger modal -->
			<button id="optionButton" type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
			  옵션추가하기
			</button>

			<div>
				<div id="importForm">
					<c:import url="../options/optionForm.jsp"></c:import>
				</div>
			</div>
			<div class="container-sml" id="table">
				
			</div>
			<div id="options">
				<c:forEach items="${options }" var="op">
					<div class="optionKinds">${op.optionKinds }</div>
					<div class="optionName">${op.optionName }</div>
					<div class="optionPrice">${op.optionPrice }</div>
					<div class="step">${op.step }</div>
				</c:forEach>
				</div>
		</fieldset>

		<button>수정하기</button>
	</form>
	
		
</div>

<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript" src="/js/productInsert.js"></script>
<script type="text/javascript" src="/js/productUpdate.js"></script>
</body>
</html>