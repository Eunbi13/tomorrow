<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/bootStrap.jsp"></c:import>
<title>내일부터 하는 인테리어, 내일의 집</title>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<div class="container" style="margin-top: 50px; margin-bottom: 50px;">
	<form:form id="frm" action="./memberJoin" method="post" modelAttribute="memberVO">
		<div class="form-group">
			<form:input class="form-control" placeholder="이메일" path="email" ></form:input>
			<form:errors path="email" cssStyle="font-size: 0.8em"></form:errors> 
		</div>
		<div class="form-group">
			<small>4자 이상 입력해주세요.</small>
			<form:password class="form-control" placeholder="비밀번호" path="password"></form:password>
			<form:errors path="password" cssStyle="font-size: 0.8em"></form:errors> 
		</div>
		<div class="form-group">
			<form:password class="form-control" placeholder="비밀번호 재입력" path="passwordCheck"></form:password>
			<form:errors path="passwordCheck" cssStyle="font-size: 0.8em"></form:errors> 
		</div>
		<div class="form-group">
			<small>다른 유저와 겹치지 않는 별명을 입력해주세요. (2~15자)</small>
			<form:input type="text" class="form-control" placeholder="별명" path="username"></form:input>
			<form:errors path="username" cssStyle="font-size: 0.8em"></form:errors> 
		</div>
		
	
<br><br>
		<div>
			<div class="custom-control custom-checkbox">			
				<input type="checkbox" id="all"> 전체 동의
			</div>
			
			<div class="custom-control custom-checkbox">
				<input type="checkbox" class="one"> 만 14세 이상입니다.(필수)
				
			</div>
			<div class="custom-control custom-checkbox">
				<input type="checkbox" class="one"> 이용약관(필수)
			
			</div>
			<div class="custom-control custom-checkbox">
				<input type="checkbox" class="one"> 개입정보 수집 및 이용동의(필수)
				
			</div>
			<div class="custom-control custom-checkbox">
				<input type="checkbox" class="other"> 이벤트, 프로모션 알람 메일 수신(선택)
			</div>
			<!-- 메일수신 미정 -->
		</div>
<br><br>
		<div id="error"></div>
		<div class="btn btn-primary">button</div>
	</form:form>

</div>
<c:import url="../template/footer.jsp"></c:import>

<script type="text/javascript" src="/js/memberJoin.js"></script>
</body>
</html>