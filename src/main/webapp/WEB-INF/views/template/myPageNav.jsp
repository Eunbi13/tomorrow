<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
 <!-- 마이페이지, 마이쇼핑에서 사용하는 네비게이션 css -->   
 <style>
	 ul, li{
	 	list-style:none;
	 	margin:0.5rem 0;
	 }
	/* 상단네비 */

	.mpNav{
		display: flex;
		justify-content : center;
	}
	.mpNav-item{
		padding: 0 1.2rem;
		font-size: 1.1rem;
		font-weight: bold;
	}
	.mpNav-item:hover{
		color:#A63F82;
	}
	
	.on{
		color:#A63F82;
	}
</style>
<!-- eb_마이페이지, 마이쇼핑에서 사용하는 네비게이션 -->
		<ul class="mpNav">
				<li class="mpNav-item ">
					<a class="" href="/member/myPage">프로필</a></li>
				<li class="mpNav-item ">
					<a class="" href="/orders/list">나의 쇼핑</a></li>
				<li class="mpNav-item ">
					<a class="memberUpdate" href="/member/update">설정</a></li>
			<sec:authorize access="hasRole('ROLE_B')">
				<li class="mpNav-item ">
					<a id="brandHome" class=" " href="#">브랜드 설정</a></li>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_M')">
				<li class="mpNav-item ">
					<a class=" " href="#">관리자 페이지</a></li>
			</sec:authorize>
		</ul>
<!-- 마이페이지, 마이쇼핑에서 사용하는 js 
 페이지의 url주소와 a태그의 href가 같을 경우 class에 on을 추가 -->
<script type="text/javascript">
$(document).ready(function(){
	//요청하는 주소 찾는 코드 = location.href //http://localhost/member/myPage
	//location.href('@@@')는 a 태그와 동일 
	let url = location.href;
	let urlNum = url.lastIndexOf('localhost')+('localhost').length;
	$('.mpNav-item a').removeClass('on');
	$('a[href="'+url.substring(urlNum)+'"]').addClass('on');
})
</script>