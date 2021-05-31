<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>cover image</p>
	</div>


	<div class="container" style="margin-top: 30px">
		<div class="row">
			<h5 class="pb-4 mb-4">온라인 집들이</h5>

			<div class="blog-post">
				<h2 class="blog-post-title">${vo.title}</h2>
				<p class="blog-post-meta">
					<a href="#">${vo.username}</a>
					<input type="button" class="btn btn-primary" value="팔로우">
				</p>
				<div class="jumbotron mt-3">
				    <p>공간 ${vo.space}</p>
				    <p>평수 ${vo.spaceSize}</p>
				    <p>작업 ${vo.work}</p>
				    <p>분야 ${vo.field}</p>
				    <p>가족형태 ${vo.familyType}</p>
				    <p>지역 ${vo.area}</p>
				    <p>기간 ${vo.period}</p>
				    <p>예산 ${vo.budget}</p>
				    <p>세부공사 ${vo.detail}</p>
				</div>

				<p>
					${vo.contents}
				</p>
				<p>
					Yeah, she dances to her own beat. Oh, no. You could've been the
					greatest. 'Cause, baby, <a href="#">you're a firework</a>. Maybe a
					reason why all the doors are closed. Open up your heart and just
					let it begin. So très chic, yeah, she's a classic.
				</p>
				
			</div>

		</div>
	</div>

	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>