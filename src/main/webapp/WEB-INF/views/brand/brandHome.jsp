<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/bootStrap.jsp"></c:import>
<link rel="stylesheet" type="text/css" href="/css/productList.css">
<title>내일부터 하는 인테리어, 내일의 집</title>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<div class="container">
	<h1>${brandVO.brandName }</h1>
	<h1>${brandVO.brandNum }</h1>
	<div id="brandNum" title="${brandVO.brandNum }"></div>
		<div class="카테고리">
			<div class="categoryOne">
			<ul>
				<c:forEach items="${one}" var="one" varStatus="i">
					<li title="${one.categoryID}"><span >${one.categoryID}</span><span>${one.groupID}</span><span>${one.category_detail_NM}</span></li>
				</c:forEach>
			</ul>
				
			</div>
		</div>
 
		<div id="productList">
			<c:import url="../template/productList.jsp"></c:import>
		</div>
</div>
<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript" src="/js/brandHome.js"></script>
</body>
</html>