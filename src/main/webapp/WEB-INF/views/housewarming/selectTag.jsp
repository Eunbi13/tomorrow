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
	
	<style>
	.fakeimg {
		height: 200px;
		background: #aaa;
	}
	
	.content-detail-cover-image {
	    position: relative;
	    overflow: hidden;
	    box-sizing: border-box;
	}

	.content-detail-cover-image__sizer {
	    width: 100%;
	    max-height: calc(100vh - 350px);
	}
	
	.content-detail-cover-image__inner-sizer {
	    width: 100%;
	    padding-bottom: 66.6666666667%;
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
</head>

<body>
	<c:import url="../template/header.jsp"></c:import>
	
	<div class="content">
		<!-- coverImg -->
		<div class="content-detail-cover-image">
			<div class="content-detail-cover-image__sizer">
				<div class="content-detail-cover-image__inner-sizer">
					<div class="content-detail-cover-image__image">
						<img alt="coverImg" src="../upload/housewarming/${vo.hwfile.fileName}">
					</div>
				</div>
			</div>
		</div>
	
	
		<div class="content-detail-content-section__content" style="margin-top: 30px">
			<div class="row">
				<h5 class="pb-4 mb-4">온라인 집들이</h5>
	
				<div class="blog-post">
					<h2 class="blog-post-title">${vo.title}</h2>
					<p class="blog-post-meta">
						<%-- <img src="../upload/member/${member.profileImage}" alt="profile"> --%>
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
					
					<p class="hwNumText" hidden="hidden">${vo.hwNum}</p>
					
					<div id="sncontents">${vo.contents}</div>
					<form id="frm" action="../hwTag/hwTagInsert" method="post" enctype="multipart/form-data">
						<div class="form-group">
							<input type="text" id="productNum" name="productNum" placeholder="URL을 입력하세요.">
						</div>
						<button class="btn btn-default plus">+</button>
						<div id="submitB">
							<button type="submit" class="btn btn-outline-primary">발행</button>
						</div>
					</form>
	
				</div>
	
			</div>
		</div>
		
	</div>
	
	<div class="tagSample" hidden="hidden">
			<div class="form-group">
				<input type="text" id="productNum" name="productNum" placeholder="URL을 입력하세요.">
			</div>
	</div>

	<c:import url="../template/footer.jsp"></c:import>
	
	<script type="text/javascript" src="../js/hwSelect.js"></script>
	<script type="text/javascript" src="../js/hwSelectTag.js"></script>
</body>
</html>