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
<div style="margin-top: 50px; margin-bottom: 50px;">
	<ul class="nav justify-content-center nav-pills">
		<li class="nav-item"><a class="nav-link active" href="#">모두보기</a>
		</li>
		<li class="nav-item"><a class="nav-link" href="#">집들이</a></li>
		<sec:authorize access="hasRole('ROLE_B')">
			<li class="nav-item"><a id="brandHome" class="nav-link" href="#">브랜드홈</a></li>
			<li class="nav-item"><a class="nav-link" href="#">주문조회</a></li>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_M')">
			<li class="nav-item"><a class="nav-link" href="#">브랜드수락</a></li>
			<li class="nav-item"><a class="nav-link" href="#">집들이수락</a></li>
		</sec:authorize>	
	</ul>
</div>

	<div class="container">
		<h1>마이페이지</h1>
		<div class="row">
			<div class="profile col-3">
				<div style="border:solid thin; width: 252px;">
					<img alt="" src="<sec:authentication property="principal.profileImage"/>" style=" height: 150px"><br>
					<div id="username"><h3><sec:authentication property="principal.username"/></h3><br></div>
					<a class="btn btn-link" href="#">설정</a>
				</div>
			</div>
			<div class="col-1"></div>
			<div class="col-8">
				<div id="contents"></div>
			</div>
		</div>
	</div>
<br><br>
	
	
<%-- 
	<sec:authorize access="hasRole('ROLE_U')"> 
		<c:import url="./memberPages/u_Page.jsp"></c:import>
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_B')">
		<c:import url="./memberPages/b_Page.jsp"></c:import>
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_M')">
		<c:import url="./memberPages/m_Page.jsp"></c:import>
	</sec:authorize>
 --%>



<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript" src="/js/memberPage.js"></script>
</body>
</html>