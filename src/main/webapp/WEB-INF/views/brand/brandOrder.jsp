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
 주문배송내역 조회 여기
 	<div class="order_list_menu rounded">
 		<a class="order_list_menu_list" href="/order/list?before=24&status=0">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">입금대기</div>
 				<div class="order_list_menu_list_value"> 0 </div>
 				
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/order/list?before=24&status=1">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">결제완료</div>
 				<div class="order_list_menu_list_value"> 0 </div>
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/order/list?before=24&status=2">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">배송준비</div>
 				<div class="order_list_menu_list_value"> 0 </div>
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/order/list?before=24&status=3">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">배송중</div>
 				<div class="order_list_menu_list_value"> 0 </div>
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/order/list?before=24&status=4">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">배송완료</div>
 				<div class="order_list_menu_list_value"> 0 </div>
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/order/list?before=24&status=5">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">구매확정</div>
 				<div class="order_list_menu_list_value"> 0 </div>
 			</div>
 		</a>
 	</div>
 	
 	
 	
 	
 	
 	<div class="order_list_content rounded">
 		<div class="filter">
 			<div class="filter-bar">
 				<div class="filter-bar_control-list">
 					<ul class="filter-bar_control-list_left">
 						<li class="filter-bar_control-list_item filter-bar_control-list_item-icon">
 							<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
							    기간
							  </button>
							  <div class="dropdown-menu">
							    <a class="dropdown-item" href="#">1개월 전</a>
							    <a class="dropdown-item" href="#">3개월 전</a>
							    <a class="dropdown-item" href="#">6개월 전</a>
							    <a class="dropdown-item" href="#">1년 전</a>
							    <a class="dropdown-item" href="#">2년 전</a>
							    <a class="dropdown-item" href="#">3년 전</a>
							  </div>
							  </li>
							  <li>
							   <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">
							    주문상태 
							  </button>
							
							
							  <div class="dropdown-menu">
							    <a class="dropdown-item" href="#">입금대기</a>
							    <a class="dropdown-item" href="#">결제완료</a>
							    <a class="dropdown-item" href="#">배송준비</a>
							    <a class="dropdown-item" href="#">배송중</a>
							    <a class="dropdown-item" href="#">배송완료</a>
							    <a class="dropdown-item" href="#">구매확정</a>
							    <a class="dropdown-item" href="#">리뷰작성</a>
							    <a class="dropdown-item" href="#">취소</a>
							    <a class="dropdown-item" href="#">교환</a>
							    <a class="dropdown-item" href="#">환불</a>
							  </div>
							  
 						</li>
 					</ul>
 				</div>
 			</div>
 		</div>
 	
 	</div>
 


</div>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>