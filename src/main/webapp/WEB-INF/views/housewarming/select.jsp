<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>내일부터 하는 인테리어, 내일의 집</title>


<!----------------- Bootstrap ----------------->
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.6/examples/album/">
<!-- Bootstrap core CSS -->
<!-- <link href="/docs/4.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous"> -->
<!-- Favicons -->
<link rel="apple-touch-icon"
	href="/docs/4.6/assets/img/favicons/apple-touch-icon.png"
	sizes="180x180">
<link rel="icon" href="/docs/4.6/assets/img/favicons/favicon-32x32.png"
	sizes="32x32" type="image/png">
<link rel="icon" href="/docs/4.6/assets/img/favicons/favicon-16x16.png"
	sizes="16x16" type="image/png">
<!-- <link rel="manifest" href="/docs/4.6/assets/img/favicons/manifest.json"> -->
<link rel="mask-icon"
	href="/docs/4.6/assets/img/favicons/safari-pinned-tab.svg"
	color="#563d7c">
<link rel="icon" href="/docs/4.6/assets/img/favicons/favicon.ico">
<meta name="msapplication-config"
	content="/docs/4.6/assets/img/favicons/browserconfig.xml">
<meta name="theme-color" content="#563d7c">
<style>
.fakeimg {
	height: 200px;
	background: #aaa;
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
<!-- Custom styles for this template -->
<!-- <link href="album.css" rel="stylesheet"> -->
<!----------------- /Bootstrap ----------------->




</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	
	<div>
		<!-- <img alt="coverImg" src="" > -->
		<c:forEach items="${vo.hwfile}" var="file">
			<a href="/upload/housewarming/${file.fileName}">${file.originName}</a>
		</c:forEach>
	</div>

	<div class="container">
	<h2>${vo.title}</h2>
	<h2>${vo.contents}</h2>
	
	<a href="@{./update(num=${vo.hwNum})}" class="btn btn-success">Update</a>
	<a href="@{./delete(num=${vo.hwNum})}" class="btn btn-danger">Delete</a>
	<a href="@{./reply(num=${vo.hwNum})}" class="btn btn-info">Reply</a>
	
	<c:forEach items="${vo.hwfile}" var="file">
		<!-- <a th:href="@{|/upload/${board}/${fileVO.fileName}|}" th:text="${fileVO.oriName}"></a> -->
		<a href="@{./fileDown(fileName=${file.fileName}, originName=${file.originName})}">${file.originName}</a>
	</c:forEach>>
	
</div>

	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>