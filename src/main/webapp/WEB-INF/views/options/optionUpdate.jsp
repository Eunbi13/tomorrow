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
	<h1>@@@</h1>
<!-- 만약 step이 0보다 큰게 있다면 조합형으로 자동 선택되고 변경하면 전부 삭제되는 ㅇㅇ 
그리고 이 페이지는 ajax로 불러오기 -->

<form id="optionFrm" action="./update">
<legend>옵션</legend>
			<small>옵션은 한 개 이상 넣어주세요.</small>
			<label class="col-sm-2 col-form-label">옵션 구성 타입 </label>
				조합 일체선택형<input type="radio" id="notUse" name="o1" checked>
				조합 분리선택형<input type="radio" id="use" name="o1">
			
<!-- Button trigger modal -->
	<button id="optionButton" type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
		옵션추가하기
	</button>
			
		<div>
			<div id="importForm">
				<c:import url="./optionForm.jsp"></c:import>
			</div>
		</div>
			
			
		<div class="container-sml" id="table">
			
		</div>

	<div id="options" hidden="hidden">
		<c:forEach items="${options }" var="op">
			<div class="optionKinds">${op.optionKinds }</div>
			<div class="optionName">${op.optionName }</div>
			<div class="optionPrice">${op.optionPrice }</div>
			<div class="step">${op.step }</div>
		</c:forEach>
	</div>
	<button>수정하기</button>
</form>

</div>
<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript" src="/js/productInsert.js"></script>
<script type="text/javascript" src="/js/productUpdate.js"></script>

</body>
</html>