<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet" type="text/css" href="/css/common.css">
<!-- 상단 카테고리 -->
<div class="container">
	<nav id="headNav" class="navbar navbar-expand-sm">
		<a class="navbar-brand" href="/">
			<img id="logo" src="/images/none.jpg"  alt="">
		</a>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="#">커뮤니티</a></li>
				<li class="nav-item"><a class="nav-link" href="/product/productlist">스토어</a></li>

			</ul>
			<ul class="navbar-nav">
				<sec:authorize access="!isAuthenticated()">
					<li class="nav-item">
						<a class="nav-link" href="/member/login">로그인</a></li>
					
					<li class="nav-item">
						<a class="nav-link" href="/member/memberJoin">회원가입</a></li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<img src="/images/none.jpg" style="width:40px; height:40px;" alt="">
						</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="/member/myPage">마이페이지</a>
							<a class="dropdown-item" href="#">나의 쇼핑</a>
							<sec:authorize access="hasRole('ROLE_U')">
								<a class="dropdown-item" href="/brand/signBrand">판매자 신청</a>
							</sec:authorize>
							<a class="dropdown-item" href="/member/logout">로그아웃</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">a</a>
						</div>
					</li>
				</sec:authorize>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<img src="/images/none.jpg" style="width:40px; height:40px;" alt="">
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">집들이 글쓰기</a>
						<a class="dropdown-item" href="#">고객센터</a>
					</div></li>
			</ul>
		</div>
	</nav>	
<!-- 하단 카테고리 -->
<nav id="subNav"class="navbar navbar-expand-sm">
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
	<%-- 		<li class="nav-item">
        <a class="nav-link" href="/brand/home?brandNum=2">임시브랜드홈</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/housewarming/list">Housewarming</a>
      </li>
      <li class="nav-item dropdown">
		<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		  Write
		</a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
        	<sec:authorize access="!isAuthenticated()">
        		<a class="dropdown-item" href="/member/login">Housewarming</a>
        	</sec:authorize>
        	<sec:authorize access="isAuthenticated()">
        		<a class="dropdown-item" href="/housewarming/insert">Housewarming</a>
        	</sec:authorize>
        </div>
      </li>
 --%>
      
    <!--  
      
      <li class="nav-item">
        <a class="nav-link" href="/cart/list">Cart</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/orders/list">OrderList</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/product/productlist">list1</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav> -->
</div>