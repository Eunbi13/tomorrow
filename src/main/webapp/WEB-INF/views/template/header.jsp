<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="jumbotron text-center" style="margin-bottom:0">
  <h1>tmhouse index test</h1>
  <p>tmhouse index test tmhouse index test</p> 
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="#">내일의집</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      
      <sec:authorize access="!isAuthenticated()">
	      <li class="nav-item">
	        <a class="nav-link" href="/member/memberJoin">Join</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="/member/login">Login</a>
	      </li>
      </sec:authorize>
      <sec:authorize access="isAuthenticated()">
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          profileImage
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="/member/myPage">Mypage</a>
	          <sec:authorize access="hasRole('ROLE_U')"> 
	          <a class="dropdown-item" href="/brand/signBrand">판매자 신청</a>
	          </sec:authorize>
	          <div class="dropdown-divider"></div>
	          <a class="dropdown-item" href="#">a</a>
	        </div>
	      </li>
	       <li class="nav-item">
	        <a class="nav-link" href="/member/logout">Logout</a>
	      </li>
      </sec:authorize>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>