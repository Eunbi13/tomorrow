<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- PRODUCT LIST //// STORE -->
<!DOCTYPE html>
<html>
<head><!-- 카테고리 수정중 -->
<style type="text/css">
.store-index-section{
	margin-top: 50px;
}
.store-index-section>h1{
	color: #000;
    font-weight: 700;
    font-size: 20px;
    margin-bottom: 14px;
    position: relative;
}
</style>
<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>

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

</body>
</html>