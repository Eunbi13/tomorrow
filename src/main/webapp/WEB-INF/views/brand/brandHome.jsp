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
<script type="text/javascript">
	$('.write').hide();
	let brandUsername = '${brandVO.username}';
	let username = $('div[title="username"]').text();
	
	
	if(username==brandUsername){
		$('.write').show();
	}
</script>
<c:import url="../template/header.jsp"></c:import>
	<main class="brandHome-box">
		<div class="brandHome-category">
		
			<div title="brandName"><a href="brand/home?brandNum=${brandVO.brandNum }">${brandVO.brandName }</a></div>
			<div id="brandNum" title="${brandVO.brandNum }"></div>
			<div class="category">
				<div class="categoryOne">
					<ul>
						<c:forEach items="${one}" var="one" varStatus="i">
							<li title="${one.categoryID}">${one.category_detail_NM}</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<sec:authorize access="isAuthenticated()">
				<div class="write" >
					<div hidden="hidden" title="username"><sec:authentication property="principal.username"/></div>
					<a class="btn-outline" href="/product/insert">글쓰기</a>
					<!-- <a class="btn-outline" href="/product/delete">판매중지하기</a> -->
				</div>
			</sec:authorize>
		</div>
			
		<div id="productList" class="brandHome-productList">
			<c:import url="../template/productList_brandHome.jsp"></c:import>
		</div>
	</main>
	
	
<!-- eun productList -->	
<script type="text/javascript" src="../js/productList.js"></script>
	
<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript" src="/js/brand.js"></script>


</body>
</html>