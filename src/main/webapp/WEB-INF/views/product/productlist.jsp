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

/* item list */
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

.store-list-item-card {
	width: 300px;
	margin: 20px;
	float: left;
}

.item-img {
	width: 300px;
}

.card-price {
	font-weight: bold;
	font-size: 20px;
}

.item-price {
	float: left;
}

.
btn-secondary {
	float: left;
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

	<!-- 카테고리 슬라이드 -->
	<c:import url="../template/categorySlideT.jsp"></c:import>

	<!-- 상품 리스트 -->
	<c:import url="../template/productlistT.jsp"></c:import>
	

	<script type="text/javascript" src="../resources/js/productList.js"></script>

</body>
</html>