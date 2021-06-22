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
	<nav>
		<ul class="nav justify-content-center nav-pills">
				<li class="nav-item"><a class="nav-link active" href="/member/myPage">프로필</a></li>
				<li class="nav-item"><a class="nav-link" href="#">나의 쇼핑</a></li>
				<li class="nav-item"><a class="nav-link" href="/member/update">설정</a></li>
			<sec:authorize access="hasRole('ROLE_B')">
				<li class="nav-item"><a id="brandHome" class="nav-link" href="#">브랜드 설정</a></li>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_M')">
				<li class="nav-item"><a class="nav-link" href="#">관리자 페이지</a></li>
			</sec:authorize>
		</ul>
	</nav>
	<nav>
		<ul class="nav justify-content-center nav-pills">
				<li class="nav-item"><a class="nav-link active" href="#">모두보기</a></li>
				<li class="nav-item"><a class="nav-link" href="#">집들이</a></li>
			<sec:authorize access="hasRole('ROLE_B')">
				<li class="nav-item"><a id="brandHome" class="nav-link" href="/brand/home?username=<sec:authentication property="principal.username"/>">브랜드홈</a></li>
				<li class="nav-item"><a class="nav-link" href="/brand/brandOrder?username=<sec:authentication property="principal.username"/>">주문조회</a></li>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_M')">
				<li class="nav-item"><a class="nav-link" href="#">브랜드수락</a></li>
				<li class="nav-item"><a class="nav-link" href="#">집들이수락</a></li>
			</sec:authorize>
		</ul>
	</nav>
</div>

	<div class="container">
		<div class="row">
			<div class="profile col-3">
				<div style="border:solid thin; width: 252px;">
					<img alt="" src="/upload/member/<sec:authentication property="principal.profileImage"/>" style=" height: 150px"><br>
					<div id="username"><h3><sec:authentication property="principal.username"/></h3><br></div>
					<a class="btn btn-link" href="./update">설정</a>
				</div>
			</div>
			
			<div class="col-1"></div>
			
			<div class="col-8">
				
				
				<div id="contents"></div>	
			</div>
		</div>
	</div>
<br><br>
	
	




<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript" src="/js/memberPage.js"></script>
</body>
</html>