<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
    
    <a class="btn" href="/product/insert">글쓰기</a>
    <a class="btn" href="/product/delete">판매중지하기</a>
<div class="아이템리스트">
	<h1>프로덕트 개수: ${productListSize}</h1>
	<c:forEach items="${productList}" var="vo" varStatus="i">
		<div class="">
			<div>
				<div hidden="hidden">${vo.productNum}</div>
				<a href="/product/productselect?productNum=${vo.productNum}">
					<img alt="" src="/upload/productImages/${vo.productPic }" style="width: 250px; height: 250px">
				</a>
			</div>
			<small>${brandName.brandName }</small>
			<small>${i.index }</small>
			<div>
				<a href="/product/productselect?productNum=${vo.productNum}">${vo.productName }</a>
			</div>
			<span hidden="hidden" class="price">${vo.productPrice}</span>
			<div>
				<span class="percent"></span><span>%</span>
				<span class="disPrice" title="${vo.discountPrice }"><fmt:formatNumber value="${vo.discountPrice }" groupingUsed="true"/></span>
			</div>
			<c:if test="${vo.shippingFee eq 0}"><div>무료배송</div></c:if>
		</div>
		<a href="./update?productNum=${vo.productNum}">편집</a>
	</c:forEach>
</div>