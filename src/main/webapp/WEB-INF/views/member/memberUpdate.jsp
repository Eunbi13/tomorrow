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
<div class="container">
<h3>회원정보수정</h3>
	<form action="./update" method="post" enctype="multipart/form-data">
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">이메일<span>*</span></label>
			<div class="col-sm-10">
				<input class="form-control" readonly="readonly" placeholder="이메일" ></input> 
				<small>이메일을 변경하시려면 운영자에게 이메일을 보내주세요</small>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">별명<span>*</span></label>
			<div class="col-sm-10">
				<%-- <form:input type="text" class="form-control" placeholder="별명" path="username"></form:input>
				<form:errors path="username" cssStyle="font-size: 0.8em"></form:errors>  --%>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">홈페이지</label>
			<div class="col-sm-10">
				<input class="form-control" type="text" placeholder="홈페이지" name="homePage" ></input> 
				<small>이메일을 변경하시려면 운영자에게 이메일을 보내주세요</small>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">성별</label>
			<div class="col-sm-10">
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" id="customRadioInline1" name="gender" class="custom-control-input" value="F">
					<label class="custom-control-label" for="customRadioInline1">여성</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" id="customRadioInline1" name="gender" class="custom-control-input" value="M">
					<label class="custom-control-label" for="customRadioInline1">남성</label>
				</div>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">나이</label>
			<div class="col-sm-10">
				<input class="form-control" type="date" name="birthday">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">프로필 이미지</label>
			<div class="col-sm-10">
				<img src="/upload/member/images/none.jpg<%-- ${vo.productPic } --%>" class="img-thumbnail" alt="profileImage">
				<input hidden="hidden" class="form-control" type="file" name="profileImage">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">한줄 소개</label>
			<div class="col-sm-10">
				<input class="form-control" type="text" name="intro">
			</div>
		</div>
		
		<button>회원 정보 수정</button>
	</form>
</div>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>