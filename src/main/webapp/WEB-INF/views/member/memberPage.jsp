<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/bootStrap.jsp"></c:import>
<title>내일부터 하는 인테리어, 내일의 집</title>
<link rel="stylesheet" type="text/css" href="/css/member.css">
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
	<main>
	
	<!-- eb_mypage상단네비주소 -->
	<c:import url="../template/myPageNav.jsp"></c:import>
	
	
		<hr>
		<div id="ajaxDIV">
			<ul class="mpSubNav ">
					<li class="mpSubNav-item "><a class="on" href="#">집들이</a></li>
				<sec:authorize access="hasRole('ROLE_B')">
					<li class="mpSubNav-item "><a id="brandHome" class=" " href="/brand/home?username=<sec:authentication property="principal.username"/>">브랜드홈</a></li>
					<li class="mpSubNav-item "><a class=" " href="/brand/brandOrder?username=<sec:authentication property="principal.username"/>">주문조회</a></li>
					<li><a class="" href="/product/insert">상품 등록하기</a></li>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_M')">
					<li class="mpSubNav-item "><a class=" " href="/brand/mList">브랜드수락리스트</a></li>
					<li class="mpSubNav-item "><a class=" " href="/housewarming/list0">집들이수락</a></li>
				</sec:authorize>
			</ul>
			<hr>
	
	
			<div class="flex-center">
			
				<div class="profileBox">
					<img alt="" src="/upload/member/<sec:authentication property="principal.profileImage"/>"><br>
					<div id="username">
						<h4><sec:authentication property="principal.username"/></h4>
					</div>
					<a class="memberUpdate" href="/member/update">설정</a>
				</div>
	
	
	
	
				<div id="contents">
					<strong>내가 쓴 글</strong>
					<div class="contentsBox">
						<c:forEach items="${list}" var="vo">
							<c:choose>
								<c:when test="${vo.coverImg eq 1 and vo.username eq pinfo.username}">
									<div class="col-md-4 coverImg">
										<a href="./select?hwNum=${vo.hwNum}">
											<div class="card mb-4 shadow-sm">
												<img class="bd-placeholder-img card-img-top" width="100%" height="225" alt="coverImg" src="../upload/housewarming/${vo.hwfile.fileName}">
												<div class="card-body">
													<p class="card-text">${vo.title}</p>
													<p class="coverImgT" hidden="hidden">${vo.coverImg}</p>
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
								</c:when>
							</c:choose>
						</c:forEach>
					</div>
				</div>
	
			</div>
		</div>
		
</main>
	
	




<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript" src="/js/memberPage.js"></script>
</body>
</html>