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
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<div class="container" style="margin-top: 50px; margin-bottom: 50px;">
<h1>login form</h1>
<spring:message code="${message}" ></spring:message>
<br>
	<form action="./login" method="post">
		<div class="form-group">
			<input type="email" name="email" class="form-control" placeholder="이메일">
		</div>
		<div class="form-group">
			<input type="password" name="password" class="form-control" placeholder="비밀번호">
		</div>
		<button class="btn btn-primary">button</button>
		
	</form>
	



</div>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>