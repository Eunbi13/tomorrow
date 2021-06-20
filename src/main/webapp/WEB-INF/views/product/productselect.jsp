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
							<div>
								<span>제습제 515ml x 24입</span> ${vo.productName}
							</div>
						</h1>
						<div class="product-selling-header__content">
							<div class="product-selling-heder__price">
								<span class="product-selling-header__price__pricewrap"> <span
									class="product-selling-header__price__discount"> <span
										class="num">${vo.discount}</span> <span class="percent">%</span>
								</span> <span class="product-selling-header__price__origin"> <span
										class="num">${vo.productPrice}</span> <span class="won">원</span>
								</span>
								</span>
							</div>
						</div>
						<div class="product-selling-header__info">
							<div class="product-selling-header-delivery">
								<div class="product-selling-header-delivery__titlewrap">
									<span>배송</span>
								</div>
								<div class="product-selling-header-delivery__contentwrap">
									<span class="product-selling-header-delivery__fee">
										<b>무료배송</b>
									</span>
								</div>
							</div>
						</div>
						<a> 브랜드 홈페이지로 이동</a>
					</div>
					<div class="product-selling-option">
						<section>
							<div>
								<div>
									<select>
										<option value disabled> 사이즈 </option>
										<option vlaue="0">S</option>
										<option value="1">M</option>
									</select>
								</div>
							</div>
						</section>
					</div>

				</div>
			</div>
		</div>
		<div class="product-selling-card-gallery-wrap-container"></div>
		
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