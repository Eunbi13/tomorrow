<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/bootStrap.jsp"></c:import>
<title>내일부터 하는 인테리어, 내일의 집</title>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
	<div class="container">
	<h1>마이페이지</h1>
		<img alt="" src="<sec:authentication property="principal.profileImage"/>"><br>
		<h3><sec:authentication property="principal.username"/></h3><br>
		<a class="btn btn-link" href="#">설정</a>
	</div>
<br><br>
	<sec:authorize access="hasRole('ROLE_U')"> 
		<c:import url="./memberPages/u_Page.jsp"></c:import>
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_B')">
		<c:import url="./memberPages/b_Page.jsp"></c:import>
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_M')">
		<c:import url="./memberPages/m_Page.jsp"></c:import>
	</sec:authorize>




<c:import url="../template/footer.jsp"></c:import>
</body>
</html>