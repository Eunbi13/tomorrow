<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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

.content-detail-content-section__content {
    margin: 0px auto;
    max-width: 750px;
    padding: 0px 15px;
    box-sizing: border-box;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
	.project-detail-metadata {
    margin: 0px 0px 50px;
    padding: 0px 24px 25px;
    background-color: rgb(247, 248, 250);
    border-radius: 4px;
    border: none;
	}
}
</style>
<!-- Custom styles for this template -->
<!-- <link href="album.css" rel="stylesheet"> -->
<!----------------- /Bootstrap ----------------->




</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	
	<div class="content">
		<!-- coverImg -->
		<div>
			<%-- <c:forEach items="${vo.hwfile}" var="file"> --%>
				<a href="/upload/housewarming/${vo.hwfile.fileName}">${file.originName}</a>
			<%-- </c:forEach> --%>
		</div>
	
		<div class="content-detail-content-section__content" style="margin-top: 30px">
			<div class="row">
				<h5 class="pb-4 mb-4">온라인 집들이</h5>
	
				<div class="blog-post">
					<h2 class="blog-post-title">${vo.title}</h2>
					<p class="blog-post-meta">
						<h5>${vo.username}</h5> 
					</p>
					<div class="jumbotron mt-3 project-detail-metadata">
						<table class="table table-borderless">
							<tbody>
								<tr>
									<th scope="row">공간</th>
									<td>${vo.space}</td>
								</tr>
								<tr>
									<th scope="row">평수</th>
									<td>${vo.spaceSize}</td>
								</tr>
								<tr>
									<th scope="row">작업</th>
									<td>${vo.work}</td>
								</tr>
								<tr>
									<th scope="row">분야</th>
									<td>${vo.field}</td>
								</tr>
								<tr>
									<th scope="row">가족형태</th>
									<td>${vo.familyType}</td>
								</tr>
								<tr>
									<th scope="row">지역</th>
									<td>${vo.area}</td>
								</tr>
								<tr>
									<th scope="row">기간</th>
									<td>${vo.period}</td>
								</tr>
								<tr>
									<th scope="row">예산</th>
									<td>${vo.budget}</td>
								</tr>
								<tr>
									<th scope="row">세부공사</th>
									<td>${vo.detail}</td>
								</tr>
							</tbody>
						</table>
					</div>
	
					<p>${vo.contents}</p>
	
				</div>
	
			</div>
		</div>

		<sec:authentication property="principal" var="pinfo" />
		<sec:authorize access="isAuthenticated()">
			<c:if test="${pinfo.username eq admin}">
				<c:if test="${vo.coverImg eq 0}">
					<a href="./update?hwNum=${vo.hwNum}" class="btn btn-success">Update</a>
					<a href="./delete?hwNum=${vo.hwNum}" class="btn btn-danger">Delete</a>
				</c:if>
			</c:if>
		</sec:authorize>
		
		
		<div>
			<input type="button" class="btn btn-primary" id="like" value="Like">
			<p> 좋아요 : ${vo.like} </p>
			<input type="button" class="btn btn-success" id="scrap" value="Scrap">
			<p> 스크랩 : ${vo.scrap} </p>
		</div>
		
		<div class="reply">
			<h4>댓글</h4>
			<div class="form-group">
				<input type="hidden" class="form-control" id="username" name="username" value="${pinfo.username}">
				<input type="text" class="form-control" placeholder="격려와 칭찬은 작성자에게 큰 힘이 됩니다 :)" id="comment" name="comment">
				<input type="button" class="btn" id="write" value="등록">
			</div>
			<div id="comments" title="${vo.hwNum}">
				<!-- reply list -->
			</div>
		</div>
	</div>

	<c:import url="../template/footer.jsp"></c:import>
	
	<script type="text/javascript" src="../js/hwReply.js"></script>
	<script type="text/javascript" src="../js/hwSelect.js"></script>
</body>
</html>