<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet" type="text/css" href="/css/common.css">
<link rel="stylesheet" type="text/css" href="/css/header.css">
<script type="text/javascript" src="/js/header.js"></script>
<!-- 상단 카테고리 -->
<header>
	<div class="mainNav">
		<div class="mainNav-item">
			<a href="/">
				<img class="logo" src="/images/logo.PNG"  alt="내일의집 로고">
			</a>
		</div>
		<nav class="mainNav-item">

			<a class="" title="item-community" href="#">커뮤니티</a>
			<a class="on" title="item-store" href="/product/productlist">스토어</a>

		</nav>
		<div class="mainNav-item">
			<!-- 빈공간 포함 -->
			<a title="cartIcon" class="mainNav-item-one" href="/cart/list">
				<img src="/images/cartIcon.png" >
			</a>
			<div class="mainNav-item-one member">
				<sec:authorize access="!isAuthenticated()">
					<a class="member-item" href="/member/login">로그인</a>
					<a class="member-item" href="/member/memberJoin">회원가입</a>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<div class="dropdown ">
						<a class="dropdown-toggle profile" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<img src="/upload/member/<sec:authentication property="principal.profileImage"/>" alt="profile">
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
			</div>
			<div class="mainNav-item-one">
				<div class="dropdown ">
					<a class="dropdown-toggle write" title="write" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						글쓰기
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="/housewarming/insert">집들이 글쓰기</a>
						<a class="dropdown-item" href="#">고객센터</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>	

<div class="subNav ">	
	<div class="item-community">
		<div class="subNav-item ">
			<div class="subNav-item-one">홈</div>
			<div class="subNav-item-one">집들이</div>
		</div>
	</div>
	<div class="item-store">
		<div class="subNav-item ">
			<div class="subNav-item-one">스토어홈</div>
			<div class="subNav-item-one">카테고리</div>
		</div>
	</div>

	
	
</div>		
