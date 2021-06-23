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
<div class="container">
	<h1>판매자 수락하기 위한 리스트 출력 페이지</h1>
		<table>
			<thead>
				<tr>
					<th>num</th>
					<th>companyName</th>
					<th>brandName</th>		
					<th>accept</th>
				</tr>
			</thead>
			<tbody>
	<c:forEach items="${list}" var="vo" varStatus="i">
				<tr>
					<td>${i.index }</td>
					<td><a href="./select?brandNum=${vo.brandNum }">${vo.companyName}</a></td>
					<td>${vo.brandName}</td>
					<td>${vo.accept }</td>
				</tr>
	</c:forEach>
			</tbody>
		</table>




</div>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>