<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet" type="text/css" href="/css/common.css">
<!-- 상단 카테고리 -->
<div class="container">


<ul>
<li>
	<a href="/">
		<img class="logo" src="/images/logo.PNG"  alt="내일의집 로고">
	</a>
</li>
<li>
	<a class="nav-link primaryKeyMenu " href="/housewarming/list">커뮤니티</a>
</li>
<li>
	<a class="nav-link primaryKeyMenu " href="/product/productlist">스토어</a>
</li>
<li>
	<a class="memberMenu" href="/cart/list">
		<img src="/images/cartIcon.png" style="width:20px; height:20px;" alt="장바구니">
	</a>
</li>
<sec:authorize access="!isAuthenticated()">
<li>
	<a class="nav-link loginMenu memberMenu" href="/member/login">로그인</a>
</li>
<li>
	<a class="nav-link memberMenu" href="/member/memberJoin">회원가입</a>
</li>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
<li>5</li>
</sec:authorize>
<li>5</li>
</ul>

<%-- <div id="headNav">
	<nav class="headNav">
		<div class="row">
			<a href="/">
				<img id="logo" src="/images/logo.PNG"  alt="내일의집 로고">
			</a>
			<!-- https://noonnu.cc/font_page/497 폰트 -->

			<!-- 스토어&커뮤니티 부분 -->
			<a class="nav-link primaryKeyMenu " href="/housewarming/list">커뮤니티</a>
			<a class="nav-link primaryKeyMenu " href="/product/productlist">스토어</a>
			
			<!-- 정렬위한 div -->
			<div class="col"></div>
			<!-- member부분 -->
			
			<a class="memberMenu" href="/cart/list">
				<img src="/images/cartIcon.png" style="width:20px; height:20px;" alt="장바구니">
			</a>
			
				<sec:authorize access="!isAuthenticated()">
					<a class="nav-link loginMenu memberMenu" href="/member/login">로그인</a>
					<a class="nav-link memberMenu" href="/member/memberJoin">회원가입</a>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<div class="dropdown ">
						<a class="nav-link dropdown-toggle memberMenu" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<img src="/images/none.jpg" style="width:40px; height:40px;" alt="">
						</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="/member/myPage">마이페이지</a>
							<a class="dropdown-item" href="/orders/list">나의 쇼핑</a>
							<sec:authorize access="hasRole('ROLE_U')">
								<a class="dropdown-item" href="/brand/signBrand">판매자 신청</a>
							</sec:authorize>
							<a class="dropdown-item" href="/member/logout">로그아웃</a>
							
						</div>
					</div>
				</sec:authorize>
				
				<div class="dropdown">
					<a class="nav-link dropdown-toggle memberMenu" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						글쓰기
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="/housewarming/insert">집들이 글쓰기</a>
						<a class="dropdown-item" href="#">고객센터</a>
					</div>
				</div>
				
			</div>	
		
		
	</nav>	
</div>
	<!-- 하단 카테고리 스토어홈-->
	<nav id="store" class="subNav navbar navbar-expand-sm">
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
					<a class="nav-link" href="/product/productlist">스토어홈</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">카테고리</a>
				</li>
			</ul>
		</div>
	</nav>
	
	<!-- 하단 커뮤니티 커뮤니티 -->
	<nav id="community" class="subNav navbar navbar-expand-sm">
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
					<a class="nav-link" href="#">홈</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/product/productlist">집들이</a><!-- 로그인 유무는 마지막에 시큐리티에서 작업할 예정 -->
				</li>
			</ul>
		</div>
	</nav>
	 --%>
</div>