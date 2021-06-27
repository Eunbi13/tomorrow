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
<title>내일부터 하는 인테리어, 내일의 집</title>
<link rel="stylesheet" type="text/css" href="/css/member.css">
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
	<main>
	
		<ul class="mpNav">
				<li class="mpNav-item ">
					<a class="" href="/member/myPage">프로필</a></li>
				<li class="mpNav-item ">
					<a class=" " href="#">나의 쇼핑</a></li>
				<li class="mpNav-item ">
					<a class="memberUpdate on " href="/member/update">설정</a></li>
			<sec:authorize access="hasRole('ROLE_B')">
				<li class="mpNav-item ">
					<a id="brandHome" class=" " href="#">브랜드 설정</a></li>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_M')">
				<li class="mpNav-item ">
					<a class=" " href="#">관리자 페이지</a></li>
			</sec:authorize>
		</ul>
		<hr>
			<ul class="mpSubNav ">
					<li class="mpSubNav-item "><a class="on memberUpdate" href="#">회원정보수정</a></li>
					<li class="mpSubNav-item "><a class=" " href="#">비밀번호 변경</a></li>
				<sec:authorize access="hasRole('ROLE_B')">
					<li class="mpSubNav-item "><a id="brandHome" class=" " href="/brand/home?username=<sec:authentication property="principal.username"/>">브랜드설정</a></li>
				</sec:authorize>
			</ul>
			<hr>
			<div class="updateBox">
			
<div class="big-bold">회원정보수정</div>
<p class="text-right font-weight-light"><a href="./delete" class="text-reset">탈퇴하기</a></p>
	
	<form:form class="updateFrm" action="./update" modelAttribute="memberVO" method="post" enctype="multipart/form-data">
		<div class="updateFrm-group">
		
			<label class="form-label">이메일 <small>*필수항목</small> </label>
			<div class="col-sm-10">
					<div class="email">
						<input class="id form-control" type="text" readonly="readonly">
						<div>@</div>
						<input class="domain form-control" type="text" readonly="readonly">
						
					</div>
				<small>이메일을 변경하시려면 운영자에게 이메일을 보내주세요</small>
		
			</div>
		</div>
		<div class="updateFrm-group">
			<label class="form-label">별명<small>*필수항목</small></label>
			<div class="col-sm-10">
			<form:input id="un" type="text" class="form-control" placeholder="별명" path="username" value=""></form:input>
			<form:errors path="username" cssStyle="font-size: 0.8em"></form:errors>
				</div>
		</div>
		<div class="updateFrm-group">
			<label class="form-label">홈페이지</label>
			<div class="col-sm-10">
				<input class="form-control" type="text" placeholder="홈페이지" name="homePage" value="<sec:authentication property="principal.homePage"/>"></input> 
				<small>이메일을 변경하시려면 운영자에게 이메일을 보내주세요</small>
			</div>
			<div  hidden="hidden">
				<form:input class="form-control" placeholder="이메일" path="email" ></form:input>
			</div>
			<form:errors path="email" cssStyle="font-size: 0.8em; color: red;"></form:errors> 	
		</div>
		<div class="updateFrm-group">
			<label class="form-label">성별</label>
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
		<div class="updateFrm-group">
			<label class="form-label">나이</label>
			<div class="col-sm-10">
				<input class="form-control" type="date" name="birthDay"  value="<sec:authentication property="principal.birthDay"/>">
			</div>
		</div>
		<div class="updateFrm-group">
			<label class="form-label">프로필 이미지</label>
			<div class="col-sm-10">
				<img src="/upload/member/<sec:authentication property="principal.profileImage"/>" class="profileImage-add" alt="profileImage">
				<input hidden="hidden" class="form-control" type="file" name="profileImage">
			</div>
		</div>
		<div class="updateFrm-group">
			<label class="form-label">한줄 소개</label>
			<div class="col-sm-10">
				<input class="form-control" type="text" name="intro" value="<sec:authentication property="principal.intro"/>">
			</div>
		</div>
		
		<button class="btn btn-default">회원 정보 수정</button>
	</form:form>
</div>
</main>
<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript" src="/js/memberJoin.js"></script> 
<script type="text/javascript" >
	//email보이기
	let getE = '<sec:authentication property="principal.email"/>';
	console.log(getE)
	let es = getE.split('&#64;');
	$('.id').val(es[0]);
	$('.domain').val(es[1])
	
	
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

</body>
</html>