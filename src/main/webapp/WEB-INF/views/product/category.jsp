<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>category</title>
<c:import url="../template/bootStrap.jsp"></c:import>
<style>
body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  height: 100%;
  width: 200px;
  float: left;
  background-color: #75bdff;;
  overflow-x: hidden;
  padding-top: 20px;
}

.sidenav a {
  padding: 6px 6px 6px 32px;
  text-decoration: none;
  font-size: 25px;
  color: black;
  display: block;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.main {
  margin-left: 250px; /* Same as the width of the sidenav 200 -> 250*/
  margin-top: 30px;
  
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<!-- 사이드 메뉴 -->
	<%-- <c:forEach></c:forEach> --%>
	<div class="sidenav">
		<a href="#">가구</a>
			<ul>
				<li>소파/거실가구</li>
				<li>침실가구</li>
				<li>드레스룸</li>
			</ul>
		<a href="#">Services</a>
		<a href="#">패브릭</a>
		<a href="#">홈데코</a>
		<a href="#">가전</a>
		<a href="#">수납/정리</a>
<!-- 		<a href="#">{vo.detail_category_name }</a> -->
		<a href="#">생활</a>
		<a href="#">주방</a>
	</div>

	<!-- 메인 -->
	<div class="main">
		<h2>Sidenav Example</h2>
		<p>분류별 select page</p>
	</div>

	

</body>
</html>