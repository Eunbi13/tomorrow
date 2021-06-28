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
<link rel="stylesheet" type="text/css" href="/css/member.css">
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
	<main>
	
	<!-- eb_mypage상단네비주소 -->
	<c:import url="../template/myPageNav.jsp"></c:import>
	
	
		<hr>
		<div id="ajaxDIV">
			<ul class="mpSubNav ">
					<li class="mpSubNav-item "><a class="on" href="#">모두보기</a></li>
					<li class="mpSubNav-item "><a class=" " href="#">집들이</a></li>
				<sec:authorize access="hasRole('ROLE_B')">
					<li class="mpSubNav-item "><a id="brandHome" class=" " href="/brand/home?username=<sec:authentication property="principal.username"/>">브랜드홈</a></li>
					<li class="mpSubNav-item "><a class=" " href="/brand/brandOrder?username=<sec:authentication property="principal.username"/>">주문조회</a></li>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_M')">
					<li class="mpSubNav-item "><a class=" " href="#">브랜드수락</a></li>
					<li class="mpSubNav-item "><a class=" " href="#">집들이수락</a></li>
				</sec:authorize>
			</ul>
			<hr>
	
	
			<div class="flex-center">
			
				<div class="profileBox">
					<img alt="" src="/upload/member/<sec:authentication property="principal.profileImage"/>"><br>
					<div id="username">
						<h4><sec:authentication property="principal.username"/></h4>
					</div>
					<a class="memberUpdate" href="/member/update">설정</a>
				</div>
	
	
	
	
				<div id="contents">
					<strong>집들이</strong>
					<div class="contentsBox"></div>
				</div>
	
			</div>
		</div>
		
</main>
	
	




<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript" src="/js/memberPage.js"></script>
</body>
</html>