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
<link rel="stylesheet" type="text/css" href="/css/manager.css">
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
	<main>
		<div class="inform">
		<dl>
			<dt>별명</dt>
			<dd>${vo.username }</dd>
		</dl>
		<hr>
		<dl>	
			<dt>회사 이름</dt>
			<dd>${vo.companyName }</dd>
		</dl>
		<dl>	
			<dt>사업자 등록번호</dt>
			<dd>${vo.registrationNum }</dd>
		</dl>
		<dl>	
			<dt>홈페이지</dt>
			<dd>${vo.companyHomepage }</dd>
		</dl>
		<hr>
		<dl>
			<dt>이름</dt>
			<dd>${vo.managerName }</dd>
		</dl>
		<dl>	
			<dt>전화번호</dt>
			<dd>${vo.managerPhone }</dd>
		</dl>
		<dl>	
			<dt>이메일</dt>
			<dd>${vo.managerEmail}</dd>
		</dl>
		<hr>
		<dl>
			<dt>대표브랜드 이름</dt>
			<dd>${vo.brandName }</dd>
		</dl>
		<dl>	
			<dt>취급 카테고리</dt>
			<c:forEach items="${categoryVOs}" var="c">
				<dd>${c.category_detail_NM }</dd>
			</c:forEach>
		</dl>
		<dl>	
			<dt>상품소개</dt>
			<dd>${vo.brandIntro}</dd>
		</dl>
		<dl>	
			<dt>판매 관련 파일 첨부</dt>
			<dd>${vo.referenceFile}</dd>
			<dd>fileDown 미구현</dd>
		</dl>
		<hr>
		<dl>	
			<dt>입점 상태</dt>
			<c:if test="${vo.accept eq true}"><dd>수락</dd></c:if>
			<c:if test="${vo.accept eq false }"><dd>미수락</dd></c:if>
		</dl>
		
			<form id="acceptFrm" action="./accept" method="post" >
				<input hidden="hidden" name="brandNum" value="${vo.brandNum }" type="text">
				<input hidden="hidden" name="username" value="${vo.username }" type="text">
				<div class="row">
					<div id="accept" class="btn-default-custom">입접 수락</div>
					<div id="back" class="btn-outline">뒤로가기</div>
				</div>
			</form>
		</div>
	</main>
<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript" src="/js/manager.js"></script>

</body>
</html>