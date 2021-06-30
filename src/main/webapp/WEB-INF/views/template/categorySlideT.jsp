<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
</head>
<body>
	<main>
		<!-- 카테고리 리스트 -->
		<h1 class="store-category-list-head">카테고리</h1>
		<!-- Swiper -->
		<div class="swiper-container mySwiper">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<img class="category-item image"
						src="../images/categoryPic/A1.webp">
					<div class="cateogry-list-name">가구</div>
				</div>
				<div class="swiper-slide">
					<img class="category-item image"
						src="../images/categoryPic/B2.webp">
					<div class="cateogry-list-name">패브릭</div>
				</div>
				<div class="swiper-slide">
					<img class="category-item image"
						src="../images/categoryPic/C3.webp">
					<div class="cateogry-list-name">홈데코/조명</div>
				</div>
				<div class="swiper-slide">
					<img class="category-item image"
						src="../images/categoryPic/D4.webp">
					<div class="cateogry-list-name">가전</div>
				</div>
				<div class="swiper-slide">
					<img class="category-item image"
						src="../images/categoryPic/E5.webp">
					<div class="cateogry-list-name">수납/정리</div>
				</div>
				<div class="swiper-slide">
					<img class="category-item image"
						src="../images/categoryPic/F6.webp">
					<div class="cateogry-list-name">생활용품</div>
				</div>
				<div class="swiper-slide">
					<img class="category-item image"
						src="../images/categoryPic/G7.webp">
					<div class="cateogry-list-name">주방</div>
				</div>
				<div class="swiper-slide">
					<img class="category-item image"
						src="../images/categoryPic/H8.webp">
					<div class="cateogry-list-name">생필품</div>
				</div>
				<div class="swiper-slide">
					<img class="category-item image"
						src="../images/categoryPic/I9.webp">
					<div class="cateogry-list-name">DIY/공구</div>
				</div>
				<div class="swiper-slide">
					<img class="category-item image"
						src="../images/categoryPic/J10.webp">
					<div class="cateogry-list-name">반려동물</div>
				</div>
				<div class="swiper-slide">
					<img class="category-item image"
						src="../images/categoryPic/K11.webp">
					<div class="cateogry-list-name">홈트레이닝</div>
				</div>
			</div>
			
		</div>

		<!-- Swiper JS -->
		<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

		<!-- Initialize Swiper -->
		<script>
			var swiper = new Swiper(".mySwiper", {
				slidesPerView : 8, // 한 슬라이드에 보여줄 갯수
				spaceBetween : 6, // 슬라이드 사이 여백
				loop : false, // 슬라이드 반복 여부 , X
				pagination : {
					el : ".swiper-pagination",
					clickable : true,
				},
			});
		</script>


	</main>
</body>
</html>