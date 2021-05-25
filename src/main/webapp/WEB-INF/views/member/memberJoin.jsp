<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/bootStrap.jsp"></c:import>
<title>${title}</title>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<div class="container">
	<form action="./memberJoin" method="post">
	<input type="email" class="form-control" placeholder="이메일" name="email">
	<input type="password" class="form-control" placeholder="비밀번호" name="password">
	<input type="text" class="form-control" placeholder="별명" name="userName">
	<!-- <div name="email">
		<input type="text" class="form-control" placeholder="이메일">
		@
		<select>
			<option disabled="disabled">선택해주세요</option>	
			<option>naver.com</option>
			<option>daum.net</option>
			<option>gmail.com</option>
			<option>hanmail.net</option>
			<option>nate.com</option>
			<option>hotmail.com</option>
			<option>outlook.com</option>
			<option>icloud.com</option>
			<option>직접 입력</option>
		</select>
		</div> -->
		
		<button>button</button>
	</form>





</div>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>