<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" type="text/css" href="/css/common.css">
<link rel="stylesheet" type="text/css" href="/css/header.css">
<script type="text/javascript" src="/js/header.js"></script>
<!-- 상단 카테고리// -->
<header>
	<div class="mainNav">
		<div class="mainNav-item">
			<a href="/">
				<img class="logo" src="/images/logo.PNG"  alt="내일의집 로고">
			</a>
		</div>
		<nav class="mainNav-item ">

			<a class="mainNav-item-one mainNav-item-T" title="item-community" href="/housewarming/list">커뮤니티</a>
			<a class="mainNav-item-one mainNav-item-T" title="item-store" href="/product/productlist">스토어</a>

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
				<div class="dropdown">
					<a class="dropdown-toggle write" title="write" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						글쓰기
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="/housewarming/insert">집들이 글쓰기</a>
						<sec:authorize access="hasRole('ROLE_B')">
							<a class="dropdown-item" href="/product/insert">상품 등록하기</a>
						</sec:authorize>
						<a class="dropdown-item" href="#">고객센터</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>	
	<!-- 스크롤 올라가면  y축 올리고 hover일때 y정상복귀 -->
	<div class="sticky-chlid">
		<div>
			<div class="subNav ">	
				<div class="subNav-item  aa" id="item-community" >
					<a class="subNav-item-one" href="/">홈</a>
					<a class="subNav-item-one" href="/housewarming/list">집들이</a>
				</div>
		
				
				<div class="subNav-item  aa" id="item-store"  >
					<a class="subNav-item-one on" href="">스토어홈</a>
					<a class="subNav-item-one" href="">카테고리</a>
				</div>
			</div>
		</div>
	</div>
