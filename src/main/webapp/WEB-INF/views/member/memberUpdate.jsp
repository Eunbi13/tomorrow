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
		<div class="form-group">
			<input class="form-control" readonly="readonly" placeholder="이메일" name="email" ></input> 
			<small>이메일을 변경하시려면 운영자에게 이메일을 보내주세요</small>
		</div>
		<div class="form-group">
			<form:input type="text" class="form-control" placeholder="별명" path="username"></form:input>
			<form:errors path="username" cssStyle="font-size: 0.8em"></form:errors> 
		</div>
		<div class="form-group">
			<input class="form-control" type="text" placeholder="홈페이지" name="" ></input> 
			<small>이메일을 변경하시려면 운영자에게 이메일을 보내주세요</small>
		</div>
		
		
	</form>
</div>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>