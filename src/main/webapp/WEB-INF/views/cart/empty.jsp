<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<meta charset="UTF-8">
<title>내일부터 하는 인테리어, 내일의 집</title>
<style type="text/css">

.container_empty{
    margin-top: 120px;
	margin-bottom:200px; 
 	text-align: center; 

	width:250px; 
	height:300px; 
	line-height:200px; 

}
.catImg{
	max-width:80%; 
	max-height:80%;
	vertical-align:middle;
}


.btn-default{
    width: 220px;
    height: 60px;
	padding:11px 30px;
	font-weight: bold;
	font-size: 18px;
	background-color: #A63F82;
	color:#FFF;
	border-color: #A63F82;
	border:3px solid;
	margin-bottom:130px;
	border-radius:8px;
}

.btn-default:hover, .btn-default:focus, .btn-default:active, .btn-default.active, .open .dropdown-toggle.btn-default {
    padding:11px 30px;
	font-weight: bold;
	font-size: 18px;
	background-color:  #732944;
	color:#FFF;
	border-color:  #732944;
	border:3px solid;
	margin-bottom:130px;
	border-radius:8px;
}
</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<main>

<div class="container container_empty">

<img class="catImg" src="/images/oPic/cat.png"><br>
<button type="button" class="btn btn-default" onclick="location.href='/product/productlist'"> 상품 담으러 가기 </button>



</div>
</main>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>