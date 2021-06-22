<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.container{
	margin-top: 120px;
	margin-bottom:200px;
	text-align: center;

	width:250px; 
	height:300px; 
	line-height:200px;

}

.bal{
	text-align: center;

}

.cancel{
	width:100%; 
	vertical-align:middle;
}
.compelete{
	max-width:80%; 
	max-height:80%;
	vertical-align:middle;
}


.btn-update{
	padding:11px 22px;
	font-weight: bold;
	font-size: 18px;
	border-radius:0;
	background-color: #FFF;
	color:#A63F82;
	border-color: #A63F82;
	border:3px solid;
	margin-bottom:130px;
}

.btn-update:hover, .btn-update:focus, .btn-updatet:active, .btn-update.active, .open .dropdown-toggle.btn-update {
 
	background-color: #A63F82;
	color:#FFF;
	border-color: #A63F82;
}
</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<div class="container">

<c:if test="${ordersVO.status eq null}">

<img class="compelete" src="/images/oPic/orderComplete.png"><br>
<button type="button" class="btn btn-update " onclick="location.href='./list?username=${ordersVO.username}'"> 주문현황보기 </button>
</c:if>


<c:if test="${ordersVO.status ne null}">
<div class="bal"> 
<img class="cancel" src="/images/oPic/cancel.png"><br>
<button type="button" class="btn btn-update " onclick="location.href='./list?username=${ordersVO.username}'"> 확인 </button>

</div>
</c:if>

</div>

<c:import url="../template/footer.jsp"></c:import>
</body>
</html>