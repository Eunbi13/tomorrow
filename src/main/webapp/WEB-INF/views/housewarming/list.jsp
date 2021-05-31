<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!-- <link href="/docs/4.6/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous"> -->
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


	<div class="container" style="margin-top: 30px">

		<div class="row">
			<c:forEach items="#{list}" var="vo">
				<div class="col-md-4">
					<a href="select">
						<div class="card mb-4 shadow-sm">
							<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img"
								aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
		      					<title>Placeholder</title>
		      					<rect width="100%" height="100%" fill="#55595c"></rect>
		      					<text x="50%" y="50%" fill="#eceeef" dy=".3em">cover image</text>
		      				</svg>

							<div class="card-body">
								<p class="card-text">${vo.title}</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary">${vo.username}</button>
									</div>
								</div>
								<div>
									<small class="text-muted">조회 ${vo.hit}</small>
								</div>
							</div>
						</div>
					</a>
				</div>
			</c:forEach>


			<!-- <div class="col-md-4">
		    <div class="card mb-4 shadow-sm">
		      <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
		
		      <div class="card-body">
		        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
		        <div class="d-flex justify-content-between align-items-center">
		          <div class="btn-group">
		            <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
		            <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
		          </div>
		          <small class="text-muted">9 mins</small>
		        </div>
		      </div>
		    </div>
		  </div> -->
		</div>
	</div>

	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>