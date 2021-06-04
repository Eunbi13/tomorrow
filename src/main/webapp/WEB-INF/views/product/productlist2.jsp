<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- PRODUCT LIST //// STORE -->
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.store-index-section{
	margin-top: 50px;
}
.store-index-section>h1{
	color: #000;
    font-weight: 700;
    font-size: 20px;
    margin-bottom: 14px;
    position: relative;
}
</style>
<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>

	<section class="container store-index-section store-index-product-list">
	<h1> 인기상품 </h1>
		<div> filter </div> <br>
		<div> <!-- 반복 ... -->
			<article>
				<div>image</div>
				<div>
				item content
					<h1 class=""> header
						<span>브랜드이름</span>
						<span>제품이름</span>
					</h1>
					<span class=""> price
						<span>discount</span>
						<span>price-(price*discount)</span>
					</span>
				</div>
			</article>

		</div>
	</section>

</body>
</html>