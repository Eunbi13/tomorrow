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
.store-select {
	margin: 30px;
}

.store-select-wrap {
	float: left;
	margin: 15px;
	width: 45%;
}

.store-select-content-name {
	font-size: 22px;
	line-height: 33px;
	min-height: 43px;
}

.store-select-content-image {
	width: 100%;
}

.store-select-content-price {
	font-size: 30px;
	line-height: 33px;
	min-height: 43px;
	float: left;
	font-weight: bold;
}

.store-select-content-price-won {
	margin-left: 10px;
}
.store-select-content-ship{
	float: left;
}
</style>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>

	<!-- 카테고리 불러오기 -->

	<div class="store-select">
		<div class="store-select-category">대>중>소</div>
		<div class="store-select-wrap image">
			<img class="store-select-content-image" alt="상품이미지"
				src="../resources/images/storeEX/glove.webp">
		</div>
		<div class="store-select-wrap content">
			<div class="store-select-content-brand"> ${brand } 브랜드 </div>
			<div class="store-select-content-name">${vo.productName}</div>
			<div class="store-select-content-price">
				<div class="store-select-content-price-discount"
					style="color: #75bdff;">${vo.discountPrice}%</div>
			</div>
			<div class="store-select-content-price">
				<div class="store-select-content-price-won">${vo.productPrice}</div>
			</div> <br><br>
			<div class="store-select-content-ship">배송</div>
			<div class="store-select-content-ship" style="margin-left: 10px; font-weight: bold;">
				<c:choose>
					<c:when test="${vo.shippingFee eq 0}">
					무료배송
					</c:when>
					<c:otherwise>
					${vo.shippingFee}원
					<div style="font-weight: lighter;">(30,000원 이상 구매시 무료배송)</div>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="store-select-content-options">
				<c:forEach items="${options}" var="optionsVO">
					<option value="${options}">${options}</option>
				</c:forEach>
			</div>
		</div>
	</div>

</body>
</html>