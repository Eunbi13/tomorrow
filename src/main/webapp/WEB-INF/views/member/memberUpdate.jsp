<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
<h3 class="font-weight-bold">회원정보수정</h3>
<p class="text-right font-weight-light"><a href="./delete" class="text-reset">탈퇴하기</a></p>
	
	<form:form action="./update" modelAttribute="memberVO" method="post" enctype="multipart/form-data">
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">이메일<span>*</span></label>
			<div class="col-sm-10">
				<input class="form-control" readonly="readonly" placeholder="이메일" name="email" value="<sec:authentication property="principal.email"/>"></input> 
				<small>이메일을 변경하시려면 운영자에게 이메일을 보내주세요</small>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">별명<span>*</span></label>
			<div class="col-sm-10">
				<form:input id="un" type="text" class="form-control" placeholder="별명" path="username" value=""></form:input>
				<form:errors path="username" cssStyle="font-size: 0.8em"></form:errors>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">홈페이지</label>
			<div class="col-sm-10">
				<input class="form-control" type="text" placeholder="홈페이지" name="homePage" value="<sec:authentication property="principal.homePage"/>"></input> 
				<small>이메일을 변경하시려면 운영자에게 이메일을 보내주세요</small>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">성별</label>
			<div class="col-sm-10">
				<div hidden="hidden"><sec:authentication property="principal.gender"/></div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" id="F" name="gender" class="custom-control-input" value="F">
					<label class="custom-control-label" for="F">여성</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" id="M" name="gender" class="custom-control-input" value="M">
					<label class="custom-control-label" for="M">남성</label>
				</div>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">나이</label>
			<div class="col-sm-10">
				<input class="form-control" type="date" name="birthDay"  value="<sec:authentication property="principal.birthDay"/>">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">프로필 이미지</label>
			<div class="col-sm-10">
				<img src="/upload/member/<sec:authentication property="principal.profileImage"/>" class="img-thumbnail" alt="profileImage">
				<input hidden="hidden" class="form-control" type="file" name="profileImage">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">한줄 소개</label>
			<div class="col-sm-10">
				<input class="form-control" type="text" name="intro" value="<sec:authentication property="principal.intro"/>">
			</div>
		</div>
		
		<button>회원 정보 수정</button>
	</form:form>
</div>
<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript" >
	let username = '<sec:authentication property="principal.username"/>';
	$('#un').val(username);
	
	let gender = '<sec:authentication property="principal.gender"/>';
//	let gender = $('#gender').text(); 
	if(gender == 'F'){
		$('#F').prop('checked', true);
	}else if(gender=='M'){
		$('#M').prop('checked', true);
	}
</script>
<script type="text/javascript" src="/js/memberUpdate.js"></script>
</body>
</html>