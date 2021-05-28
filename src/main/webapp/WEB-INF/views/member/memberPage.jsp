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

	
	<sec:authorize access="hasRole('ROLE_U')"> 
	<h1>유저</h1>
		<c:import url="./memberPages/u_Page.jsp"></c:import>
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_B')">
	<h1>판매자</h1>
		<c:import url="./memberPages/b_Page.jsp"></c:import>
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_M')">
	<h1>관리자</h1>
		<c:import url="./memberPages/m_Page.jsp"></c:import>
	</sec:authorize>




<c:import url="../template/footer.jsp"></c:import>
</body>
</html>