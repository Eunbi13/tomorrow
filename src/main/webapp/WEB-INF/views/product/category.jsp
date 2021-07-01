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

</style>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<main></main>
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