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
<div class="deleteBox">
	<div class="mid-bold" style="margin-bottom: 2rem;">회원탈퇴 신청</div>

	<div class="bold">회원 탈퇴 신청에 앞서 아래 내용을 반드시 확인해주세요.</div>
	
	<div class="infoBox" >
		<div class="bold">회원탈퇴 시 처리내용</div>
		<ul>
			<li>내일의집 포인트·쿠폰은 소멸되며 환불되지 않습니다.</li>
			<li>내일의집 구매 정보가 삭제됩니다.</li>
			<li>소비자보호에 관한 법률 제6조에 의거,계약 또는 청약철회 등에 관한 기록은 5년, 대금결제 및 재화등의 공급에 관한 기록은 5년, 소비자의 불만 또는 분쟁처리에 관한 기록은 3년 동안 보관됩니다. 동 개인정보는 법률에 의한 보유 목적 외에 다른 목적으로는 이용되지 않습니다.
			</li>
		</ul>
		<div class="bold">회원탈퇴 시 게시물 관리</div>
		<ul>
			<li style="list-style:none;">회원탈퇴 후 내일의집 서비스에 입력한 게시물 및 댓글은 삭제되지 않으며, 회원정보 삭제로 인해 작성자 본인을 확인할 수 없으므로 게시물 편집 및 삭제 처리가 원천적으로 불가능 합니다. 게시물 삭제를 원하시는 경우에는 먼저 해당 게시물을 삭제 하신 후, 탈퇴를 신청하시기 바랍니다.
			</li>	
		</ul>
		<div class="bold">회원탈퇴 후 재가입 규정</div>
		<ul>
			<li style="list-style:none;">탈퇴 회원이 재가입하더라도 기존의 내일의집 포인트는 이미 소멸되었기 때문에 양도되지 않습니다.
			</li>	
		</ul>
	</div>
	
	<form class="deleteFrm"  action="./delete" method="post">
		<!-- pk.email -->
		<input hidden="hidden" name="email" value="<sec:authentication property="principal.email"/>">
		<!-- 체크 검사 -->
		<div class="form-checkbox">
			<input class="form-check-input accept" type="checkbox" >위 내용을 모두 확인하였습니다.<span class="red">필수</span>
		</div>
		<div class="center">고객센터 1670-0000</div>
	</form>
	<div class="row">
		<div class="btn-outline" id="running">탈퇴신청</div>
		<div class="btn-default-custom" id="cancel">취소하기</div>
	</div>


</div>
</main>
<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript" src="/js/memberDelete.js"></script>
</body>
</html>