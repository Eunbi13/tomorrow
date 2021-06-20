<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/bootStrap.jsp"></c:import>
<title>내일의 집 파트너</title>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<div class="container" style="margin-top: 50px; margin-bottom: 50px;">
	<h1>입점신청</h1>
	<ul>
		<li>작성해주신 정보를 바탕으로 카테고리별 담당 MD가 입점을 검토하여 이메일을 드립니다.</li>
		<li>입점 불가에 대한 통보는 불가 사유와 함께 이메일로 보내드립니다. 회신을 주셔도 답변이 불가한 점 양해 부탁드립니다.</li>
		<li>사업자가 이미 등록되어 있어 입점 신청이 불가한 경우 @@@@@@으로 이메일을 보내주세요.</li>
		<li>입점 신청과 관련된 내용은 일반 고객센터 접수가 불가능합니다. 참고 바랍니다.</li>
	</ul>
	
	<form:form action="./signBrand" modelAttribute="brandVO" method="post" enctype="multipart/form-data">
		<fieldset>
			<legend>회사 정보</legend>
		<div>
			
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">회사이름<span>*</span></label>
				<div class="col-sm-10">
					<form:input type="text" path="companyName" class="form-control" placeholder="내일의 집"></form:input>
					<form:errors path="companyName" cssStyle="font-size: 0.8em"></form:errors> 
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">사업자 등록번호<span>*</span></label>
				<div class="col-sm-10">
					<form:input type="text" path="registrationNum" class="form-control" placeholder="123-45-67890"></form:input>
					<form:errors path="registrationNum" cssStyle="font-size: 0.8em"></form:errors> 
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">홈페이지</label>
				<div class="col-sm-10">
					<input type="text" name="companyHomepage" class="form-control" placeholder="www.tmh.t1">
				</div>
			</div>
		</div>
		</fieldset>
		<fieldset>
			<legend>영업담당자 정보</legend>
		<div>	
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">이름<span>*</span></label>
				<div class="col-sm-10">
					<form:input type="text" path="managerName" class="form-control" placeholder="집냥이"></form:input>
					<form:errors path="managerName" cssStyle="font-size: 0.8em"></form:errors> 
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">전화번호<span>*</span></label>
				<div class="col-sm-10">
					<form:input type="text" path="managerPhone" class="form-control" placeholder="010-1234-5678"></form:input>
					<form:errors path="managerPhone" cssStyle="font-size: 0.8em"></form:errors>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">이메일<span>*</span></label>
				<div class="col-sm-10">
					<form:input type="text" path="managerEmail" class="form-control" placeholder="zipnyang@tmh.t1"></form:input>
					<form:errors path="managerEmail" cssStyle="font-size: 0.8em"></form:errors>
				</div>
			</div>
		</div>	
		</fieldset>
		<fieldset>
			<legend>상품 정보</legend>
		<div>
			
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">대표브랜드 이름<span>*</span></label>
				<div class="col-sm-10">
					<form:input type="text" path="brandName" class="form-control" placeholder="내일의집 가구"></form:input>
					<form:errors path="brandName" cssStyle="font-size: 0.8em"></form:errors>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">취급 카테고리<span>*</span></label>
				<div class="col-sm-10">
				<c:forEach items="${categories }" var="vo">
					<div class=" form-check form-check-inline ">
						<input class="form-check-input" type="checkbox" name="categories" id="customCheck1" value="${vo.categoryID}">
						<label class="custom-control-label" for="customCheck1">${vo.category_detail_NM }</label>
					</div>
				</c:forEach>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">상품 소개<span>*</span></label>
				<div class="col-sm-10">
					<form:textarea rows="2" path="brandIntro" style="width:100%; resize: none;" placeholder="판매하시는 상품에 대한 설명을 입력해주세요"></form:textarea>
					<form:errors path="brandIntro" cssStyle="font-size: 0.8em"></form:errors>
				</div>
			</div> 
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">판매 관련 파일 첨부</label>
				<div class="input-group col-sm-10">
					<input type="file" name="files"><p></p> 
					
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
		</fieldset>
		<button class="btn btn-primary">button</button>
	</form:form>




</div>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>