<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/bootStrap.jsp"></c:import>
<link rel="stylesheet" type="text/css" href="/css/productList.css">
<title>내일부터 하는 인테리어, 내일의 집</title>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<div class="container" style="margin-top: 50px; margin-bottom: 50px;">
	<h1>${brandName.brandName }</h1>
		<div class="카테고리">
			<div class="categoryOne">
			<ul>
				<c:forEach items="${one}" var="one" varStatus="i">
					<li title="${one.categoryID}"><span >${one.categoryID}</span><span>${one.groupID}</span><span>${one.category_detail_NM}</span></li>
				</c:forEach>
			</ul>
				 <%--<c:forEach items="${one}" var="one" varStatus="i">
					<div class="one">
					<span>${one.groupID}</span><span>${one.category_detail_NM}</span>
					
					<div class="categoryTwo">
						<c:forEach items="${two}" var="two" varStatus="i">
							<c:if test="${one.groupID eq two.groupID && two.category_LEV==2}">
								<div class="two"><span>-</span><span>${two.groupID}</span>${two.category_detail_NM}</div>
								
								<div class="categoryThree">
									<c:forEach items="${three}" var="three" varStatus="i">
										<c:if test="${one.groupID eq three.groupID &&three.category_LEV==3}">
											<div class="three"><span>--</span><span>${three.groupID}</span>${three.category_detail_NM}</div>
										</c:if>
									</c:forEach>
								</div>
								
							</c:if>
						</c:forEach>
					</div>
					
					</div>
				</c:forEach> --%>
			</div>
		</div>

		<div class="아이템리스트">
		<h1>프로덕트 개수: ${productListSize}</h1>
		<c:forEach items="${productList}" var="vo" varStatus="i">
			<div class="">
				<div>
					<a href="./productselect?productNum=${vo.productNum}">
						<img alt="" src="/upload/productImages/${vo.productPic }" style="width: 250px; height: 250px">
					</a>
				</div>
				<small>${brandName.brandName }</small>
				<small>${i.index }</small>
				<div>
					<a href="./productselect?productNum=${vo.productNum}">${vo.productName }</a>
				</div>
				<span hidden="hidden" class="price">${vo.productPrice}</span>
				<div>
					<span class="percent"></span><span>%</span>
					<span class="disPrice" title="${vo.discountPrice }"><fmt:formatNumber value="${vo.discountPrice }" groupingUsed="true"/></span>
				</div>
				<c:if test="${vo.shippingFee eq 0}"><div>무료배송</div></c:if>
			</div>
		</c:forEach>
	</div>
</div>
<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript" src="/js/brandHome.js"></script>
</body>
</html>