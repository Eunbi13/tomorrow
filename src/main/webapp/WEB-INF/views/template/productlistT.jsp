<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:forEach items="${productlist}" var="vo">
		<div class="store-list-item-card">
			<a href="./productselect2?productNum=${vo.productNum}">
			<img class="item-img" src="../resources/images/storeEX/glove.webp"
				alt="item pic">
				
				<!-- 브랜드 이름 -->
				<div class="brand" style="color: gray;">
					<c:if test="${brandVO.brandNum eq productVO.brandNum}">
						${vo.brandVO.brandName }
					</c:if>
				</div>
				
				<!-- 제품 이름 title -->
				<div class="item-title" style="color: black;">
					${vo.productName}</div> <!-- 가격 -->
				<div class="card-price" >
					<!-- 할인 x 거르기 / 할인 %-->
					<c:choose>
						<c:when test="${vo.discountPrice eq vo.productPrice}"></c:when>
						<c:otherwise>
							<div class="item-price discountpercent" 
								style="color: #A63F82; margin-right: 10px;">${(vo.productPrice - vo.discountPrice)/100}%</div>
						</c:otherwise>
					</c:choose>

					<!-- 가격 표시 (원) -->
					<div class="item-price won" style="color: black;">
						${vo.discountPrice}원</div>
				</div>
	
				<!-- 무배 특가 미니배너 -->
				<div class="minbanner">
					<div class="minbanner-ship">
						<c:if test="${vo.shippingFee eq 0 }">
							<div>무료배송</div>
						</c:if>
					</div>

					<div class="minbanner-price">
						<c:if test="${((vo.productPrice - vo.discountPrice)/100) >=20}">
							<div>특가</div>
						</c:if>
					</div>
					
				</div>
			</a>
		</div>
	</c:forEach>


</body>
</html>