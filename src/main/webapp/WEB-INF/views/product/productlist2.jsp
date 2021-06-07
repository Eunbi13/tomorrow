<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- PRODUCT LIST //// STORE -->
<!DOCTYPE html>
<html>
<head>
<!-- 카테고리 수정중 -->
<style type="text/css">
.store-category-flex-container {
	display: flex;
	flex-wrap: nowrap;
	width: 80px;
}

.store-category-flex-container>img {
	margin: 10px;
	padding: 20px;
}

.cateogry-list-name {
	text-align: center;
	font-size: 15px;
	margin-top: 10px;
}

.store-category-list-head {
	margin: 20px;
}
</style>
<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>

	<!-- 카테고리 리스트 -->
	<h1 class="store-category-list-head">카테고리</h1>
	<div class="store-category-flex-container">
		<div>
			<img class="category-item image"
				src="../resources/images/categoryPic/A1.webp">
			<div class="cateogry-list-name">가구</div>
		</div>
		<div>
			<img class="category-item image"
				src="../resources/images/categoryPic/B2.webp">
			<div class="cateogry-list-name">패브릭</div>
		</div>
		<div>
			<img class="category-item image"
				src="../resources/images/categoryPic/C3.webp">
			<div class="cateogry-list-name">홈데코/조명</div>
		</div>
		<div>
			<img class="category-item image"
				src="../resources/images/categoryPic/D4.webp">
			<div class="cateogry-list-name">가전</div>
		</div>
		<div>
			<img class="category-item image"
				src="../resources/images/categoryPic/E5.webp">
			<div class="cateogry-list-name">수납/정리</div>
		</div>
		<div>
			<img class="category-item image"
				src="../resources/images/categoryPic/F6.webp">
			<div class="cateogry-list-name">생활용품</div>
		</div>
		<div>
			<img class="category-item image"
				src="../resources/images/categoryPic/G7.webp">
			<div class="cateogry-list-name">주방</div>
		</div>
		<div>
			<img class="category-item image"
				src="../resources/images/categoryPic/H8.webp">
			<div class="cateogry-list-name">생필품</div>
		</div>
		<div>
			<img class="category-item image"
				src="../resources/images/categoryPic/I9.webp">
			<div class="cateogry-list-name">DIY/공구</div>
		</div>
		<div>
			<img class="category-item image"
				src="../resources/images/categoryPic/J10.webp">
			<div class="cateogry-list-name">반려동물</div>
		</div>
		<div>
			<img class="category-item image"
				src="../resources/images/categoryPic/K11.webp">
			<div class="cateogry-list-name">홈트레이닝</div>
		</div>
	</div>

	<div class="store-list-item">
		<c:forEach items="${list}" var="vo">
			<div class="store-item-list">
				<a href="./productselect?productNum=${vo.productNum}"> <img
					class="item-img" src="../resources/images/storeEX/glove.webp"
					alt="item pic">
					<div class="card-body">
						<h4 class="item-title">${vo.productName}</h4>
						<p class="item-price">${vo.productPrice}</p>
						<a href="#" class="btn btn-primary">See Profile</a>
					</div>
				</a>
			</div>
		</c:forEach>

	</div>


</body>
</html>