<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
a{
   text-decoration:none !important
}
.order_list_menu_list_title{
    font-size: 20px;
    margin-bottom: 15px;

}

.order_list_menu_list:not(:last-of-type):after {
    position: absolute;
    display: block;
    content: "";
    width: 12px;
    height: 12px;
    transform: rotate(
    45deg
    );
    border: solid #bdbdbd;
    border-width: 2px 2px 0 0;
    right: 0;
}

.order_list_menu_list{
webkit-box-flex: 1; */
    /* -webkit-flex: 1 0 0px; */
    -moz-box-flex: 1;
    -moz-flex: 1 0 0px;
    -ms-flex: 1 0 0px;
    flex: 1 0 0px;
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    -webkit-justify-content: center;
    -moz-justify-content: center;
    justify-content: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    -webkit-align-items: center;
    -moz-align-items: center;
    align-items: center;
    position: relative;
    cursor: pointer;
    }

.order_list_menu_list_wrap {
    text-align: center;
}
.order_list_menu{
    box-shadow: 0 1px 3px 0 #dbdbdb;
    margin-top: 20px;
    display: flex;
    width: 100%;
    height: 150px;
}

.order_list_content{
    box-shadow: 0 1px 3px 0 #dbdbdb;
    margin-top: 50px;
    width: 100%;
    height: 150px; 
    margin-bottom: 30px;
    padding: 30px;
}
</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<div class="container">
 주문배송내역 조회
 	<div class="order_list_menu rounded">
 		<a class="order_list_menu_list" href="/orders/list?before=24&status=">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">입금대기</div>
 				<div class="order_list_menu_list_value"> 0 </div>
 				
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/orders/list?before=24&status=2">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">결제완료</div>
 				<div class="order_list_menu_list_value"> 0 </div>
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/orders/list?before=24&status=3">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">배송준비</div>
 				<div class="order_list_menu_list_value"> 0 </div>
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/orders/list?before=24&status=4">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">배송중</div>
 				<div class="order_list_menu_list_value"> 0 </div>
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/orders/list?before=24&status=5">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">배송완료</div>
 				<div class="order_list_menu_list_value"> 0 </div>
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/orders/list?before=24&status=6">
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
 			
 						  
 						  <c:forEach items="${orderList}" var="ordersVO">
 						   ordernum:  ${ordersVO.orderNum}
 						  </c:forEach>
 							<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
							    기간
							  </button>
							  <div class="dropdown-menu">
							    <a class="dropdown-item" href="list?before=1">1개월 전</a>
							    <a class="dropdown-item" href="list?before=3">3개월 전</a>
							    <a class="dropdown-item" href="list?before=6">6개월 전</a>
							    <a class="dropdown-item" href="list?before=12">1년 전</a>
							    <a class="dropdown-item" href="list?before=24">2년 전</a>
							    <a class="dropdown-item" href="list?before=36">3년 전</a>
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