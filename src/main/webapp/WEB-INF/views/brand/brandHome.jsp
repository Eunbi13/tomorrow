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
	
	
	<div class="아이템리스트ㅡㅡ">
		<h1>프로덕트 개수: ${productListSize}</h1>
		<c:forEach items="${productList}" var="pvo" varStatus="i">
			<div class="">
				<div>
					<a href="./productselect?productNum=${pvo.productNum}">
						<img alt="" src="/upload/productImages/${pvo.productPic }" style="width: 250px; height: 250px">
					</a>
				</div>
				<small>${brandName.brandName }</small>
				<small>${i.index }</small>
				<div>
					<a href="./productselect?productNum=${pvo.productNum}">${pvo.productName }</a>
				</div>
				<span hidden="hidden" class="price">${pvo.productPrice}</span>
				<div>
					<span class="percent"></span><span>%</span>
					<span class="disPrice" title="${pvo.discountPrice }"><fmt:formatNumber value="${pvo.discountPrice }" groupingUsed="true"/></span>
				</div>
				<c:if test="${pvo.shippingFee eq 0}"><div>무료배송</div></c:if>
			</div>
		</c:forEach>
	</div>
</div>
<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript" src="/js/brandHome.js"></script>
</body>
</html>