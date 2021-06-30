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
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<main>
	<div class="mid-main">
	<h1>판매자 수락하기 위한 리스트 출력 페이지</h1>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">num</th>
					<th scope="col">회사명</th>
					<th scope="col">브랜드명</th>
					<th scope="col">수락여부</th>
				</tr>
			</thead>
			<tbody>
			
				<tr>
	<c:forEach items="${list}" var="vo" varStatus="i">
				<tr>
					<th scope="row">${i.count }</th>
					<td><a href="./select?brandNum=${vo.brandNum }">${vo.companyName}</a></td>
					<td>${vo.brandName}</td>
					<c:if test="${vo.accept eq true}"><td>수락</td></c:if>
					<c:if test="${vo.accept eq false }"><td>미수락</td></c:if>
				</tr>
	</c:forEach>
			</tbody>
		</table>
	</div>	
</main>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>