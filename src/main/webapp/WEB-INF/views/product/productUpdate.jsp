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

<link rel="stylesheet" type="text/css" href="/css/productSet.css">
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<main>
<div class="mid-main">
	<h3 >상품 수정 </h3>

<div id="change">
	<form id="productFrm" action="./update" method="post" enctype="multipart/form-data">
		<input hidden="hidden" name="productNum" value="${productVO.productNum }">
		<fieldset>
			<legend>카테고리<span>*</span></legend>	
			<div class=" "> 
				<div class="form-group"><!-- 클릭하면 ajax로 중부류, 소분류 불러오기 -->
					<div class="form-box ">
						<div id="category" >
							<input hidden="hidden" class="form-control" name="categoryID" value="${categoryVO.categoryID}">
							<div class="category-item">${categoryNM}<!-- 가구>소파/침실가구>소파 --></div>
							<div id="changeCategoryNM" class="btn-outline">변경하기</div>
						</div>
					</div>
				</div>
					<div id="categoryCheckBox" class="form-group" style="display: none;">
						<div class="form-box ">
							<label class=" form-label">선택*</label>
							<c:forEach items="${categoryOne}" var="vo" >
							<div class="  form-check-inline ">
								<input class="form-check-input ch" type="checkbox" name="one" value="${vo.categoryID}">
								<label class="form-check-label" for="inlineCheckbox1">${vo.category_detail_NM }</label>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div id="two"></div>
				<div id="three"></div>
				<div id="categoryCancel" hidden="hidden" class="btn-outline">취소하기</div>
		</fieldset>
<hr>
	
	
		<fieldset >
			<legend>제품 정보<span>*</span></legend>
			<div class="form-group ">
				<label class=" form-label">상품명</label>
				<input name="productName" value="${productVO.productName }"
				class="form-control " type="text" placeholder="Please ProductName">
			</div>
		</fieldset>
<hr>
		<fieldset >
			<legend>이미지</legend>
			<div class="form-group">
				<label class=" form-label">대표 이미지<span>*</span></label>
				<div class="preview-box">
					<label class="rep text-center file-label" for="rep">
						<img class="preview repImg" src="/upload/productImages/${productVO.productPic}">
					</label>
					<input hidden="hidden" id="rep" type="file" name="rep" style="" value="${productVO.productPic}">
				</div>
				
			</div>
			
			<div class="form-group ">
				<label class=" form-label" >추가 이미지</label>
				<div id="files" class="preview-box">
					<c:forEach items="${productVO.images }" var="img" varStatus="i">
						<label class="file-label" for="add-file-image-${i.index }">
							<img title="add-file-image-${i.index }" class="add-img preview" src="/upload/productImages/${img.fileName}">
						</label>
						<input id="add-file-image-${i.index }" class="add-file-image" hidden="hidden" type="file" name="files" value="${img.fileName}">
					</c:forEach>
					<!-- 추가 이미지 장소 -->
				</div>
				<div id="imageAdd" class="btn-outline">+</div>
				<div id="filesSample"  style="display: none">
					<div class="priview-box">
						<label class="file-label" for="add-file-image">
							<img class="add-img preview-item" src="/images/plusIcon.png">
						</label>
						<input id="add-file-image" class="add-file-image"  hidden="hidden"  type="file" name="files">
						<div class="deleteImage">x</div></div> 
					</div>
				</div>
		</fieldset>
<hr>

		<fieldset>
			<legend>상세 페이지 작성</legend>
			<div class=" ">
				<textarea id="summernote" name="contents" class="form-control" id="exampleFormControlTextarea1" placeholder="Please contents">
					${productVO.contents}
				</textarea>
			</div> 
			
		</fieldset>	
		
<hr>	
		<fieldset >
		<legend>판매가<span>*</span></legend>
			<div class="form-group ">
				<label class=" form-label">가격</label>
				<div class=" ">
					<input class="form-control" name="productPrice" value="${productVO.productPrice }"
					type="number" placeholder="Please number">
				</div>
			</div>
		
			<div class="form-group ">
				<label class=" form-label">판매가격</label>
				<div class=" ">
					<input class="form-control" name="discountPrice" value="${productVO.discountPrice }"
					type="number" placeholder="Please number">
				</div>
			</div>
			
			<div class="form-group ">
				<label class=" form-label">배송비 설정</label>
				<div class=" ">
					<input class="form-control" name="shippingFee" value="${productVO.shippingFee }"
					type="number" placeholder="Please number">
				</div>
			</div>
		</fieldset>
<hr>
		<fieldset>
				<legend>옵션</legend>
				<div id="form-group">
					<label class=" form-label">옵션 구성 타입 
						<p>옵션은 한 개 이상 넣어주세요.</p>
					</label>
					<input type="radio" id="notUse" name="o1" checked>조합 일체선택형
					<input type="radio" id="use" name="o1">조합 분리선택형
					<div class="btn btn-outline" id="optionUpdateButton">수정하기</div>
					<!-- Button trigger modal -->
					<div id="optionButton" type="button" class="btn btn-outline" data-toggle="modal" data-target="#exampleModal">
						옵션추가하기
					</div>
					<div id="optionUpdateCancel" class="btn btn-outline">취소하기</div>
				</div>	
				<div class="" id="table"><!-- 옵션 테이블 자리 --></div>
				<div id="importForm">
					<c:import url="../options/optionForm.jsp"></c:import>
				</div>
					
					
		
				<div id="options" hidden="hidden">
					<c:forEach items="${optionList }" var="op">
						<div class="optionKinds">${op.optionKinds }</div>
						<div class="optionName">${op.optionName }</div>
						<div class="optionPrice">${op.optionPrice }</div>
						<div class="step">${op.step }</div>
					</c:forEach>
				</div>

			</fieldset>
			
		<div class="right">
			<button class="btn-outline">저장하기</button>
		</div>
	</form>
	
</div>
</div>		
</main>

<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript" src="/js/productSet.js"></script>
<script type="text/javascript" src="/js/optionUpdate.js"></script>
</body>
</html>