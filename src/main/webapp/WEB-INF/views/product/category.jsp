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
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}
/* Dropdown Button */
.dropbtn {
  background-color: #3498DB;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

/* Dropdown button on hover & focus */
.dropbtn:hover, .dropbtn:focus {
  background-color: #2980B9;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
  position: relative;
  display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #ddd}

/* Show the dropdown menu (use JS to add this class to the .dropdown-content container when the user clicks on the dropdown button) */
.show {display:block;}
</style>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<!-- 사이드 메뉴 -->
	<%-- <c:forEach></c:forEach> --%>
	<div class="dropdown">
		<button onclick="myFunction()" class="dropbtn">가구 (대카테고리)</button>
		<div id="myDropdown" class="dropdown-content">
			<a href="#">중카테고리 반복</a> <a href="#">Link 2</a> <a href="#">Link 3</a>
		</div> --dropdown?
	</div><br>
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
	<a href="#">생활</a>
	<a href="#">주방</a>
	</div>

	<!-- 메인 -->
	<div class="main">
		<h2>Sidenav Example</h2>


	</div>


<script type="text/javascript">
/* When the user clicks on the button,
toggle between hiding and showing the dropdown content */
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown menu if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
</script>
</body>
</html>