<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/bootStrap.jsp"></c:import>
<link rel="stylesheet" type="text/css" href="/css/productList.css">
<link rel="stylesheet" type="text/css" href="/css/brand.css">
<title>내일부터 하는 인테리어, 내일의 집</title>
</head>
<body>

<c:import url="../template/header.jsp"></c:import>
	<main class="brandHome-box">
		<div>
			<div title="brandName"><a href="brand/home?brandNum=${brandVO.brandNum }">${brandVO.brandName }</a></div>
			<div class="brandHome-category">
				
				<div id="brandNum" title="${brandVO.brandNum }"></div>
				<div id="select-categoryOne"><!-- categoryOne 이름 뜰 곳 --></div>
				<div id="select-category">
					
					<!--ajax통해서 brandHome_selectCategory append  -->
				</div>
				
				
				<div class="category">
					<div class="categoryOne">
						<c:forEach items="${one}" var="one" varStatus="i">
							<dl>
								<dt title="${one.categoryID}" class="category-list">${one.category_detail_NM}</dt>
							</dl>
						</c:forEach>
					</div>
				</div>
				
			</div>
		</div>
			
		<div id="productList" class="brandHome-productList">
			<c:import url="../template/productList_brandHome.jsp"></c:import>
		</div>
	</main>
	
	

	
<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript" src="/js/brand.js"></script>


</body>
</html>