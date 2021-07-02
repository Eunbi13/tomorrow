<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
</head>

<body>
	<c:import url="../template/header.jsp"></c:import>


	<div class="container" style="margin-top: 30px">
	
			<sec:authentication property="principal" var="pinfo" />
			<sec:authorize access="isAuthenticated()">
			<c:if test="${pinfo.username eq 'admin'}">
				<div>
					<button class="btn btn-default coverImg1">발행 목록</button>
					<button class="btn btn-default coverImg0">발행 대기 목록</button>
				</div>
			</c:if>
			</sec:authorize>

		<div class="row">
			
			<c:forEach items="${list}" var="vo">
				<%-- <c:choose>
					<c:when test="${vo.coverImg eq 1}"> --%>
						<div class="col-md-4 coverImg">
							<a href="./select?hwNum=${vo.hwNum}">
								<div class="card mb-4 shadow-sm">
									<img class="bd-placeholder-img card-img-top" width="100%" height="225" alt="coverImg" src="../upload/housewarming/${vo.hwfile.fileName}">
									<div class="card-body">
										<p class="card-text">${vo.title}</p>
										<p class="coverImgT" >${vo.coverImg}</p>
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
					<%-- </c:when>
				</c:choose> --%>
			</c:forEach>
			
		</div>
	</div>
	
	<div id="sample0" hidden="hidden">
		<div id="coverImg0">
			<c:if test="${vo.coverImg eq 0}">
				<div class="col-md-4">
					<a href="./select?hwNum=${vo.hwNum}">
						<div class="card mb-4 shadow-sm">
							<img class="bd-placeholder-img card-img-top" width="100%" height="225" alt="coverImg" src="../resources/upload/housewarming/${vo.hwfile.fileName}">
		
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
			</c:if>
		</div>
	</div>
	<div id="sample1" hidden="hidden">
		<div class="coverImg1">
			<c:if test="${vo.coverImg eq 1}">
				<div class="col-md-4">
					<a href="./select?hwNum=${vo.hwNum}">
						<div class="card mb-4 shadow-sm">
							<img class="bd-placeholder-img card-img-top" width="100%" height="225" alt="coverImg" src="../resources/upload/housewarming/${vo.hwfile.fileName}">
	
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
			</c:if>
		</div>
	</div>

	<c:import url="../template/footer.jsp"></c:import>
	<script type="text/javascript" src="/js/hwList.js"></script>
</body>
</html>