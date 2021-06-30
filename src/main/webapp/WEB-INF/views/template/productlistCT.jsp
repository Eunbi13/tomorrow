<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* flex-item / 4개씩 정렬 */
.item-container{
	display: flex;
	justify-content: space-around;
	flex-flow: wrap;
}
.store-list-item-card{
	margin-right: 5px;
	flex-basis: 25%;
	height: auto;
	display: flex;
 	flex-direction: column;
}
.item-img{
	max-width:100%;
	max-height:100%;
	flex: auto;
}

</style>
</head>
<body>
<main>
	<h1 style="margin: 20px; margin-top: 70px;">오늘의 딜</h1> 
	<div class="item-container">
	
	<c:forEach items="${productlist}" var="vo">
		<div class="store-list-item-card">
			<a href="./productselect2?productNum=${vo.productNum}">
			<img class="item-img" src="../images/storeEX/plate.webp"
				alt="item pic">
				
				<!-- 브랜드 이름 -->
				<div class="brand" style="color: gray; margin-top:5px;">
					<c:if test="${brandVO.brandNum eq productVO.brandNum}">
						${vo.brandVO.brandName }
					</c:if>
				</div>
				
				<!-- 제품 이름 title -->
				<div class="item-title" style="color: black; margin-top:5px;">
					${vo.productName}</div> <!-- 가격 -->
				<div class="card-price" style="margin-top:5px;">
					<!-- 할인 x 거르기 / 할인 %-->
					<c:choose>
						<c:when test="${vo.discountPrice eq vo.productPrice}"></c:when>
						<c:otherwise>
							<div class="item-price discountpercent" id="item-price-discount"
								style="color: #A63F82; margin-right: 10px;">
								<fmt:parseNumber value="${(vo.productPrice - vo.discountPrice)/100}" integerOnly="true" />%
							</div>
						
						</c:otherwise>
					</c:choose>

					<!-- 가격 표시 (원) -->
					<div class="item-price won" style="color: black;">
						${vo.discountPrice}원</div>
				</div>
				
				<!-- 무배 특가 미니배너 -->
				
				<div class="minbanner" >
					<br><br>
					
					<div class="minbanner-ship" style="float:left; font-size:15px; color:#A63F82; text-align:left; margin-right: 3px;" >
						<c:if test="${vo.shippingFee eq 0 }">
							<div> <button disabled="disabled">무료배송</button>    </div>
						</c:if>
					</div>
					
					<div class="minbanner-price" style="float:left; font-size:15px; color:#A63F82; text-align:left; ">
						<c:if test="${((vo.productPrice - vo.discountPrice)/100) >=20}">
							<div><button disabled="disabled" style="b">특가</button></div>
						</c:if>
					</div>
					
				</div>
			</a>
		</div>
	</c:forEach>
	</div>


</main>
</body>
</html>