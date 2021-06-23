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
	<div id="brandNum">${vo.brandNum }</div>
	<div>${vo.username }</div>
	<div>${vo.companyName }</div>
	<div>${vo.registrationNum }</div>
	<div>${vo.companyHomepage }</div>
	<div>${vo.managerName }</div>
	<div>${vo.managerPhone }</div>
	<div>${vo.managerEmail}</div>
	<div>${vo.brandName }</div>
	<div>${vo.brandIntro}</div>
	<div>${vo.referenceFile}</div>
	<div>${vo.accept}</div>

	<div id="accept">수락</div>

</div>
<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript">
//eb_수락할 경우
let brandNum = $('#brandNum').text();
$('#accept').click(function(){
	$.ajax({
		type:"POST",
		url:"./accept"
		data:{brandNum: brandNum},
		success:function(data){
			
		}
	})
});
</script>
</body>
</html>