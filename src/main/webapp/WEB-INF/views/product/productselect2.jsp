<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
</style>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>

	<div class="main">
		<!-- select 메인 우측 사진 -->
		<div class="main-pic">
			<img class="store-select-content-image" alt="상품이미지"
				src="../resources/images/storeEX/glove.webp">
		</div>

		<!-- select 메인 좌측 -->
		<div class="main-contents">
			<div class="brand">
				<c:if test="${brandVO.brandNum eq productVO.brandNum}">
					${vo.brandVO.brandName }
				</c:if>
			</div>

			<div class="title">${vo.productName}</div>

			<div class="price">
				<!-- 할인율 계산 후 표시 -->
				<c:if test="${((vo.productPrice - vo.discountPrice)/100) != 0}">
					<div class="price-percent">${(vo.productPrice - vo.discountPrice)/100}%
					</div>
				</c:if>
				<!-- 원가 -->
				<div class="price-origin" style="font-weight: lighter;">
					${vo.productPrice}원</div>
				<!-- 할인가 -->
				<div class="price-final">${vo.discountPrice}원</div>
			</div>
			<!-- price 클래스 끝 -->

			<div class="ship">
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
			<!-- ship 클래스 끝 -->

			<div class="brand-url">
				<c:if test="${brandVO.brandNum eq productVO.brandNum}">
					<a href=""> ${brand }</a>
				</c:if>
			</div>

			<div class="option">
				<form action="test">
					<input type="hidden" name="brandNum" value="${vo.brandNum} ">
					<input type="hidden" name="productNum" value="${vo.productNum} ">
					<select id="selectop" name="options" onchange='addList()'>
									<!-- 0 쓰지마라 ... -->
						<option value="optionKinds" selected disabled>${vo.optionsVOs.get(0).optionKinds} </option> <!-- 수정 -->
						<c:forEach items="${optionsar}" var="OPvo" varStatus="status">
							<option value="${OPvo.optionNum }">
								<div id="OPname">${OPvo.optionName}</div>,
								<div id="OPprice">${vo.discountPrice + OPvo.optionPrice}</div>	
							</option>
						</c:forEach>
					</select>
					<br>*** <br>
					
					<!-- option 값 출력되는 곳 -->
					<ul id='opPrint'>
		
					</ul>
					<div id='optionResult'></div>
					
					<!-- 옵션 삭제 버튼 -->
					<input type='button' value='X' onclick='removeItem()' />
					
						

					

					<div class="store-select-buttons">
						<button type="submit"
							class="store-select-button btn btn-outline-primary"
							style="color: #A63F82;" onclick="inputOp">장바구니</button>
						<button type="button" class="store-select-button btn btn-primary"
							style="background-color: #A63F82;">바로구매</button>
					</div>

				</form>
			</div>
			<!-- option 클래스 끝 -->

		</div>
		<!-- main contents 클래스 끝 -->
	</div>
	<!-- main 클래스 끝 -->

	<!-- <script type="text/javascript" src="../resources/js/productSelect.js"></script> -->
	<script type="text/javascript" src="../resources/js/productSelect2.js"></script>
</body>
</html>