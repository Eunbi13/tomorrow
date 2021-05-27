<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/bootStrap.jsp"></c:import>
<title>내일의 집 파트너</title>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<div class="container">
	<h1>입점신청</h1>
	<ul>
		<li>작성해주신 정보를 바탕으로 카테고리별 담당 MD가 입점을 검토하여 이메일을 드립니다.</li>
		<li>입점 불가에 대한 통보는 불가 사유와 함께 이메일로 보내드립니다. 회신을 주셔도 답변이 불가한 점 양해 부탁드립니다.</li>
		<li>사업자가 이미 등록되어 있어 입점 신청이 불가한 경우 @@@@@@으로 이메일을 보내주세요.</li>
		<li>입점 신청과 관련된 내용은 일반 고객센터 접수가 불가능합니다. 참고 바랍니다.</li>
	</ul>
	
	<form action="./signBrand" method="post">

		<div>
			<h3>회사 정보</h3>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">회사이름<span>*</span></label>
				<div class="col-sm-10">
					<input type="text" name="companyName" class="form-control" placeholder="내일의 집">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">사업자 등록번호<span>*</span></label>
				<div class="col-sm-10">
					<input type="text" name="registrationNum" class="form-control" placeholder="123-45-67890">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">홈페이지</label>
				<div class="col-sm-10">
					<input type="text" name="companyHomepage" class="form-control" placeholder="www.tmh.t1">
				</div>
			</div>
		</div>
		<div>	
			<h3>영업담당자 정보</h3>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">이름<span>*</span></label>
				<div class="col-sm-10">
					<input type="text" name="managerName" class="form-control" placeholder="집냥이">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">전화번호<span>*</span></label>
				<div class="col-sm-10">
					<input type="text" name="managerPhone" class="form-control" placeholder="010-1234-5678">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">이메일<span>*</span></label>
				<div class="col-sm-10">
					<input type="text" name="managerEmail" class="form-control" placeholder="zipnyang@tmh.t1">
				</div>
			</div>
		</div>	
		<div>
			<h3>상품 정보</h3>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">대표브랜드 이름<span>*</span></label>
				<div class="col-sm-10">
					<input type="text" name="brandName" class="form-control" placeholder="내일의집 가구">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">취급 카테고리(checkBox)</label>
				<div class="col-sm-10">
				<div class=" form-check form-check-inline ">
					<input class="form-check-input" type="checkbox" name="categoryID">
					<label class="form-check-label" for="inlineCheckbox1">카테고리 아이디와 브랜드번호를 인서트할것</label>
					<input class="form-check-input" type="checkbox" name="categoryID">
					<label class="form-check-label" for="inlineCheckbox1">브랜드 번호는 미리 받아서 넣으면 됨,,</label>
					<input class="form-check-input" type="checkbox" name="categoryID">
					<label class="form-check-label" for="inlineCheckbox1">카테고리도 대분류인거 선택해서 조회하고</label>
					<input class="form-check-input" type="checkbox" name="categoryID">
					<label class="form-check-label" for="inlineCheckbox1">모델에 담아서 여기에 뿌리면 됨</label>
					<input class="form-check-input" type="checkbox" name="categoryID">
					<label class="form-check-label" for="inlineCheckbox1">벨류에 카테고리아이디 담고</label>
					<input class="form-check-input" type="checkbox" name="categoryID">
					<label class="form-check-label" for="inlineCheckbox1">이름은 여기에 뿌리고</label>
					<input class="form-check-input" type="checkbox" name="categoryID">
					<label class="form-check-label" for="inlineCheckbox1">어쩌구 저쩌구 </label>
				</div>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">상품 소개<span>*</span></label>
				<div class="col-sm-10">
					<textarea rows="2"  style="width:100%; resize: none;" name="@@@" placeholder="판매하시는 상품에 대한 설명을 입력해주세요"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">판매 관련 파일 첨부</label>
				<div class="input-group col-sm-10">
					<input type="file"><p></p> 
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label"></label>
				<div class="col-sm-10">
					<small>※ 참고할 수 있는 파일을 10MB 용량 이하의 이미지, ZIP, PDF 등의 파일 형태로 첨부해주세요.<br>
						첨부파일 관련 URL주소가 있다면 상품 소개 입력창에 남겨주세요.</small>
				</div>
			</div>
		</div>
		<button class="btn btn-primary">button</button>
	</form>




</div>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>