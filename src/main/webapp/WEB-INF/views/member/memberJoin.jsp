<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/bootStrap.jsp"></c:import>
<title>내일부터 하는 인테리어, 내일의 집</title>

<link rel="stylesheet" type="text/css" href="/css/common.css">
<link rel="stylesheet" type="text/css" href="/css/member.css">
</head>
<body>
	<header>
		<img class="joinLogo" alt="" src="/images/logoName.png">
	</header>
	
	<main class="flex-center">
		<div class="joinFrm">
			<h5><strong>회원가입</strong></h5>
			<hr>
			<form:form id="frm" action="./memberJoin" method="post" modelAttribute="memberVO">
				<div class="form-group">
					<div class="bold">이메일</div>
					<div class="email">
						<input class="id form-control" type="text">
						<div>@</div>
						<select name="domain" class="form-control">
							<option value="0">선택해주세요</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="gamil.com">gamil.com</option>
							<option value="nate.com">nate.com</option>
							<option value="1">직접입력</option>
						</select>
						<input style="display: none;" class="domain form-control" type="text">
						<div id="x" style="display: none;">x</div>
					</div>
					<div  hidden="hidden">
						<form:input class="form-control" placeholder="이메일" path="email" ></form:input>
					</div>
					<form:errors path="email" cssStyle="font-size: 0.8em; color: red;"></form:errors> 
				</div>
				<div class="form-group">
					<div class="bold">비밀번호</div>
					<div><small>4자 이상 입력해주세요.</small></div>
					<form:password class="form-control" placeholder="비밀번호" path="password"></form:password>
					<form:errors path="password" cssStyle="font-size: 0.8em; color: red;"></form:errors> 
				</div>
				<div class="form-group">
					<div class="bold">비밀번호 확인</div>
					<form:password class="form-control" placeholder="비밀번호 확인" path="passwordCheck"></form:password>
					<form:errors path="passwordCheck" cssStyle="font-size: 0.8em; color: red;"></form:errors> 
				</div>
				<div class="form-group">
					<div class="bold">별명</div>
					<div><small>다른 유저와 겹치지 않는 별명을 입력해주세요. (2~15자)</small></div>
					<form:input type="text" class="form-control" placeholder="별명 (2~15자)" path="username"></form:input>
					<form:errors path="username" cssStyle="font-size: 0.8em; color: red;"></form:errors> 
				</div>
				
			<div class="bold">약관동의</div>
	
				<div class="accept">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="all">  
						<label>전체 동의</label> 
					</div>
					<hr>
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="one"> <label>만 14세 이상입니다.(필수)</label> 
						
					</div>
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="one"> <label>이용약관(필수)</label>
					
					</div>
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="one"> <label>개입정보 수집 및 이용동의(필수)</label>
						
					</div>
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="other"> <label>이벤트, 프로모션 알람 메일 수신(선택)</label>
					</div>
					<!-- 메일수신 미정 -->
				</div>
		
		
		
				<div id="error" style="font-size: 0.8em; color: red; margin: 0.8rem 0;"></div>
				<div id="btn" class="btn-big btn-default">회원가입 완료</div>
			</form:form>
	
		</div>
</main>
<script type="text/javascript" src="/js/memberJoin.js"></script> 
</body>
</html>