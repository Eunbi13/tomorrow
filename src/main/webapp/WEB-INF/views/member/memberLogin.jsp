<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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

<script type="text/javascript" src="/js/memberLogin.js"></script>
	<main>
		<div class="flex-center column">
			<a href="/">	
				<img class="loginLogo" alt="" src="/images/logoName.png">
			</a>
			<div class="message" hidden="hidden">
				<spring:message code="${message}" ></spring:message>
			</div>
			<form class="loginFrm" action="./login" method="post">
				<div class="form-group">
					<input type="email" name="email" class="form-control loginInput-email" placeholder="이메일" >
				</div>
				<div class="form-group">
					<input type="password" name="password" class="form-control loginInput-pw" placeholder="비밀번호" >
				</div>
				
				<button class="btn-default-custom  btn-big ">button</button>
				
			</form>

		</div>
	
	
	
	</main>
</body>
</html>