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
						<option value="optionKinds" >${optionKinds} </option> <!-- 수정 -->
						<c:forEach items="${optionsar}" var="OPvo" varStatus="status">
							<option value="${OPvo.optionNum }">
								<div>${OPvo.optionName}</div>,
								<div>${vo.discountPrice + OPvo.optionPrice}</div>	
							</option>
						</c:forEach>
					</select>
					
					<ul id='opPrint'></ul>
					<div id="opWrap">
  						<p class="original">
   						 original
  						</p>
					</div>
					<input type='button' value='삭제' onclick='removeItem()' />
					
						<li id="carts${i.index}" title="${cartVO.brandNum}">
							<div title="${cartVO.productNum}"
								style="width: 100%; height: 100%; padding-bottom: 40px; word-break: break-all; word-wrap: break-word;"
								class="cartCheck${cartVO.productNum} alert alert-secondary alert-dismissible fade show"
								role="">
								<div class="option">
									<div id="result"></div>
								</div>
								<div style="width: 70px; height: 20px; font-size: 12px; float: left;">
									<!-- 상단의 select box에 수량 10개이상 선택시 나타날 인풋박스/ 숫자만 입력할수 있도록 type number 지정 -->
									<!-- 수량 -->
									<input style="width: 70px; height: 20px; ime-mode: disabled;"
										type="number" min="1" class="directInputBox"
										data-product-num="${productVO.productNum}"
										title="${cartVO.cartNum}" id="directInputBox" name="amount"
										value="${cartVO.amount}" onkeyup='priceResult()'/>
								</div>
								<div
									style="width: 200px; height: 23px; font-size: 16px; padding-bottom: 20px; font-weight: bold; float: right;">

									<input type="text" readonly="readonly"
										id="cartVOPrice${cartVO.cartNum}"
										class="cartPricePlus${productVO.productNum} cartPricePlus"
										title="${productVO.productNum}" name="cartPrice"
										value="${cartVO.cartPrice}"
										style="width: 180px; height: 20px; background-color: transparent; border: 0 solid black; text-align: right;" />
									<div id="priceresult"></div>원

								</div>
								<button type="button" class="close delete" title="${i.index}"
									data-dismiss="" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div></li>

					

					<div class="store-select-buttons">
						<button type="submit"
							class="store-select-button btn btn-outline-primary"
							style="color: #A63F82;">장바구니</button>
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

	<script type="text/javascript" src="../resources/js/productSelect.js"></script>

</body>
</html>