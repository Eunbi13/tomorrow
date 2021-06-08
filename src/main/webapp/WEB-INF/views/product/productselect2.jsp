<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- PRODUCT SELECT //// STORE -->
<!-- class 이름 정리 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>store select</title>
<style type="text/css">
.store-select-content{
	float: left;
}
</style>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>

	<!-- 카테고리 불러오기 -->

	<div class="store-select">
		<div class="store-select-content">
			<img class="store-select-content-image" alt="상품이미지" src="../resources/images/storeEX/glove.webp">
		</div>
		<div class="store-select-content">
			<div>브랜드</div>
			<div>${vo.productName}</div>
			<div>${vo.productPrice}</div>
			<div>${vo.discount}%</div>
			<div></div>
			
			<div></div>
		</div>
	</div>

</body>
</html>