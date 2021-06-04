<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- PRODUCT LIST //// STORE -->
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
h5 {
	margin-left: 30px;
}

* {
	box-sizing: border-box
}

.bannerslideshow-container {
	width: 100%;
	height: 15%;
	position: static;
	margin: auto;
}

.bannermain_slideImg {
	width: 100%;
	height: 15%;
}

/*buttons */
.prev, .next {
	cursor: pointer;
	position: absolute;
	text-align: center;
	top: 0;
	top: 20%;
	width: 3%;
	padding: 16px;
	margin-top: -22px;
	color: white;
	font-weight: bold;
	font-size: 18px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
	z-index: 100;
}

.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}

.prev:hover, .next:hover {
	background-color: rgba(0, 0, 0, 0.8);
}

/* Number text (1/3 etc) */
.numbertext {
	color: #f2f2f2;
	font-size: 12px;
	padding: 8px 12px;
	position: absolute;
	top: 0;
}
/* The dots/bullets/indicators */
.dot {
	cursor: pointer;
	height: 13px;
	width: 13px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

.active, .dot:hover {
	background-color: #717171;
}
/* Fading animation */
.fade2 {
	-webkit-animation-name: fade;
	-webkit-animation-duration: 0.5s;
	animation-name: fade;
	animation-duration: 5s;
}

@
-webkit-keyframes fade2 {
	from {opacity: .4
}

to {
	opacity: 1
}

}
@
keyframes fade2 {
	from {opacity: .4
}

to {
	opacity: 1
}

}
/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
	.slprev, .slnext, .text {
		font-size: 11px
	}
}

.product-card-body {
	flex-direction: row;
}
</style>
<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>store list</title>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>

	<div class="bannerslideshow-container">
		<div class="mySlides fade2">
			<img class="bannermain_slideImg"
				src="../resources/images/bannerPic/162209186771469586.webp">
		</div>
		<div class="mySlides fade2">
			<img class="bannermain_slideImg"
				src="../resources/images/bannerPic/162218735790467604.webp">
		</div>
		<div class="mySlides fade2">
			<img class="bannermain_slideImg"
				src="../resources/images/bannerPic/162219370940295239.webp">
		</div>
		<div class="mySlides fade2">
			<img class="bannermain_slideImg"
				src="../resources/images/bannerPic/162219375916346105.webp">
		</div>
		<a class="prev" onclick="plusSlides(-1)">❮</a> <a class="next"
			onclick="plusSlides(1)">❯</a>
	</div>
	<br>
	<div style="text-align: center">
		<span class="dot" onclick="currentSlide(1)"></span> <span class="dot"
			onclick="currentSlide(2)"></span> <span class="dot"
			onclick="currentSlide(3)"></span> <span class="dot"
			onclick="currentSlide(4)"></span>
	</div>

	<br>
	<section
		class="container store-index-sectoin store-index-cateogry-list">
		<h1 class="store-index-category-list-title">카테고리</h1>
		<div class="category-list-wrap">
			<div class="category-list_fold">
				<!-- 카테고리 리스트 -->
				<!-- flex -->
				<div class="category-item-wrap">
					<a href=""> <!-- 각 카테고리 항목 -->
						<div class="category-item">
							<img class="category-item image"
								src="../resources/images/categoryPic/A1.webp">
							<div class="category-item title">가구</div>
						</div>
					</a> <a href=""> <!-- 각 카테고리 항목 -->
						<div class="category-item">
							<img class="category-item image"
								src="../resources/images/categoryPic/B2.webp">
							<div class="category-item title">패브릭</div>
						</div>
					</a> <a href=""> <!-- 각 카테고리 항목 -->
						<div class="category-item">
							<img class="category-item image"
								src="../resources/images/categoryPic/C3.webp">
							<div class="category-item title">홈데코/조명</div>
						</div>
					</a> <a href=""> <!-- 각 카테고리 항목 -->
						<div class="category-item">
							<img class="category-item image"
								src="../resources/images/categoryPic/D4.webp">
							<div class="category-item title">가전</div>
						</div>
					</a> <a href=""> <!-- 각 카테고리 항목 -->
						<div class="category-item">
							<img class="category-item image"
								src="../resources/images/categoryPic/E5.webp">
							<div class="category-item title">수납/정리</div>
						</div>
					</a> <a href=""> <!-- 각 카테고리 항목 -->
						<div class="category-item">
							<img class="category-item image"
								src="../resources/images/categoryPic/F6.webp">
							<div class="category-item title">생활용품</div>
						</div>
					</a> <a href=""> <!-- 각 카테고리 항목 -->
						<div class="category-item">
							<img class="category-item image"
								src="../resources/images/categoryPic/G7.webp">
							<div class="category-item title">주방</div>
						</div>
					</a> <a href=""> <!-- 각 카테고리 항목 -->
						<div class="category-item">
							<img class="category-item image"
								src="../resources/images/categoryPic/H8.webp">
							<div class="category-item title">생필품</div>
						</div>
					</a> <a href=""> <!-- 각 카테고리 항목 -->
						<div class="category-item">
							<img class="category-item image"
								src="../resources/images/categoryPic/I9.webp">
							<div class="category-item title">DIY/공구</div>
						</div>
					</a> <a href=""> <!-- 각 카테고리 항목 -->
						<div class="category-item">
							<img class="category-item image"
								src="../resources/images/categoryPic/J10.webp">
							<div class="category-item title">반려동물</div>
						</div>
					</a> <a href=""> <!-- 각 카테고리 항목 -->
						<div class="category-item">
							<img class="category-item image"
								src="../resources/images/categoryPic/K11.webp">
							<div class="category-item title">홈트레이닝</div>
						</div>
					</a>

				</div>
			</div>
		</div>
	</section>
	<br>

	<c:forEach items="${list}" var="vo">
		<div class="card">
			<div class="product-card-body">
				<h5 class="card-title">${vo.productName}</h5>
				<p class="card-text">${vo.productPrice}</p>
			</div>
		</div>
	</c:forEach>


	<script type="text/javascript" src="../resources/js/productList.js"></script>

</body>
</html>