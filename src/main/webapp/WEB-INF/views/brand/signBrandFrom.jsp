<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/bootStrap.jsp"></c:import>
<title>내일의 집 파트너</title>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<div class="container">
	<h1>입점신청</h1>
	<ul>
		<li>작성해주신 정보를 바탕으로 카테고리별 담당 MD가 입점을 검토하여 이메일을 드립니다.</li>
		<li>입점 불가에 대한 통보는 불가 사유와 함께 이메일로 보내드립니다. 회신을 주셔도 답변이 불가한 점 양해 부탁드립니다.</li>
		<li>사업자가 이미 등록되어 있어 입점 신청이 불가한 경우 @@@@@@으로 이메일을 보내주세요.</li>
		<li>입점 신청과 관련된 내용은 일반 고객센터 접수가 불가능합니다. 참고 바랍니다.</li>
	</ul>
	
	<form action="./signBrand" method="post">
		<h3>회사정보</h3>
		<div class="form-group">
			<span>회사이름</span><input type="text" name="@@@" class="form-control" placeholder="내일의 집">
		</div>
		<div class="form-group">
			<span>사업자 등록번호</span><input type="text" name="@@@" class="form-control" placeholder="내일의 집">
		</div>
		<div class="form-group">
			<span>홈페이지</span><input type="text" name="@@@" class="form-control" placeholder="내일의 집">
		</div>
		<button class="btn btn-primary">button</button>
	</form>




</div>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>