<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- PRODUCT SELECT //// STORE -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>store select</title>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="product-selling">
		<div class="product-selling-container">
			<div>
				<ol>
					category 대>중>소
					<!-- icon > 각 카테고리 링크 -->
					<!-- 		<li>대카테고리</li>
					<li>중카테고리</li>
					<li>소카테고리</li> -->
				</ol>
			</div>

			<div class="product-selling-container-row">
				<div class="product-selling-container-image">pic</div>
				<div class="product-selling-container-content">
					<div class="product-selling-header">
						<h1 class="product-selling-header__title">
							<p>브랜드</p>
							<div>${vo.productName}</div>
						</h1>
						<div class="product-selling-header__content"></div>
						<div class="product-selling-header__info"></div>
						<a> 브랜드 홈페이지로 이동</a>
					</div>
					<div class="product-selling-option"></div>
				
				</div>
			</div>
		</div>
		<div class="product-selling-card-gallery-wrap-container"></div>
	</div>
</body>
</html>