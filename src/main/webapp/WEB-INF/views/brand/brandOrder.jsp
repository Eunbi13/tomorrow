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
<style>

.productPic{
width:54px;
}
.tab{
border: gray 1px solid;

}
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
    color:#A63F82;
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
    font-size: 16px;
    box-shadow: 0 1px 3px 0 #dbdbdb;
    margin-top: 50px;
    width: 100%;
    /* height: 150px;  */
    margin-bottom: 30px;
    padding: 30px;
    padding-bottom:60px;
}

</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<div class="container">
 판매진행현황/주문관리(최근 한달 기준)
 brandNum: ${brandVO.brandNum}
  brandName: ${brandVO.brandName}
 
  	   <div><li>발송전</li></div> 
 	<div class="order_list_menu rounded">

 		<a class="order_list_menu_list" href="/order/list?before=24&status=0">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">
	 				<div>주문관리</div>
	 				<div>신규주문</div>
 				</div>
 				<div class="order_list_menu_list_value"> 0 </div>
 				
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/order/list?before=24&status=1">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">
 					<div>발송관리</div>
	 				<div>발송대상</div>
 				</div>
 				<div class="order_list_menu_list_value"> 0 </div>
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/order/list?before=24&status=2">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">
 					<div>취소관리</div>
	 				<div>취소요청</div>
 				</div>
 				<div class="order_list_menu_list_value"> 0 </div>
 			</div>
 		</a>

 	</div> <div><li>발송후</li></div> 
 	<div class="order_list_menu rounded">

 		<a class="order_list_menu_list" href="/order/list?before=24&status=0">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">
	 				<div>배송관리</div>
	 				<div>배송중</div>
 				</div>
 				<div class="order_list_menu_list_value"> 0 </div>
 				
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/order/list?before=24&status=1">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">
 					<div>클레임관리</div>
	 				<div>반품접수</div>
 				</div>
 				<div class="order_list_menu_list_value"> 0 </div>
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/order/list?before=24&status=2">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">
 					<div>클레임관리</div>
	 				<div>교환접수</div>
 				</div>
 				<div class="order_list_menu_list_value"> 0 </div>
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/order/list?before=24&status=2">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">
 					<div>정산관리</div>
	 				<div>정산확정금액</div>
 				</div>
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
 						   <div class="dropBtn" style="float:left; margin: 0px 10px 15px 0px;  ">
 			                <button type="button" class="btn-sel dropdown-toggle" data-toggle="dropdown" style="font-size:16px;">
							    기간
							  </button>
							  <div class="dropdown-menu"  style="font-size:16px;">
							    <div class="dropdown-item before" title="1">1개월 전</div>
							    <div class="dropdown-item before" title="3">3개월 전</div>
							    <div class="dropdown-item before" title="6">6개월 전</div>
							    <div class="dropdown-item before" title="12">1년 전</div>
							    <div class="dropdown-item before" title="24">2년 전</div>
							    <div class="dropdown-item before" title="36">3년 전</div>
							  </div>
							 </div>
							  
							 <div class="dropBtn" style="float:left; font-size:16px; ">
							   <button type="button" class="btn-sel dropdown-toggle" data-toggle="dropdown" style="font-size:16px;">
							    주문상태 
							  </button>
							  <div class="dropdown-menu" style="font-size:16px;"> 
							    <div class="dropdown-item status" title="list">입금대기</div>
							    <div class="dropdown-item status" title="2">결제완료</div>
							    <div class="dropdown-item status" title="3">배송준비</div>
							    <div class="dropdown-item status" title="4">배송중</div>
							    <div class="dropdown-item status" title="5">배송완료</div>
							    <div class="dropdown-item status" title="6">구매확정</div>
							    <div class="dropdown-item status" title="7">리뷰작성</div>
							    <div class="dropdown-item status" title="8">취소</div>
							    <div class="dropdown-item status" title="9">교환</div>
							    <div class="dropdown-item status" title="10">환불</div>
							  </div>
							 </div>
						  </li>
						  <li class="filter-bar_tag-list_item filter-bar_control-list_item-icon" style="margin: 0px 10px 30px 0px; ">
						     <form id="listFrm" action="../orders/list" method="get">
							    <div id="before_search" class="search" style="float:left; margin-right:10px;">
								  
								    
							
								  
								 </div>
								  <div id="status_search"  class="search" style="float:left;">
								  
								    
							
								  
								 </div>
							</form>
						  </li>
						  
				     </ul>
 			   	</div>
 			</div>
 			<div class="filter-table">
		 			  
		 			    주문접수내역(주문관리 + 결제내역, 배송관리, 구매확정)
		 				<table class="tab">
		 					<tr>
		 						<th>주문상태</th>
		 						<th>주문번호</th>
		 						<th>주문자명</th>
		 						<th>상품이미지</th> 
		 						<th>주문상품</th>
		 					    <th>주문수량</th>
		 					    <th>결제수단</th>
		 					    <th>결제금액</th>
		 					    <th>할인합계</th>
		 					    
		 					</tr>
		 			     <c:forEach items="${ar}" var="cartVO">
		 					<tr>
		 						<td>${cartVO.validity}</td>
		 						<td>${cartVO.ordersVO.orderNum}</td>
		 						<td>${cartVO.ordersVO.name}</td>
		 						<td> <img class="productPic" alt="" src="/upload/productImages/${cartVO.productVO.productPic}">
		 						</td> 
		 						<td>${cartVO.productVO.productName}</td>
		 					    <td>${cartVO.amount}</td>
		 					    <td>${cartVO.ordersVO.paymentType}</td>
		 					    <td>결제금액</td>
		 					    <td>할인합계</td>
		 					    
		 					</tr>
		 				</c:forEach>
		 				
		 				</table>
		 				
		 				취소내역
		 				<table>
		 					<tr>
		 						<th>취소상태</th>
		 						<th>취소방식</th>
		 						<th>취소수단</th>
		 						<th>취소번호</th> 
		 						<th>취소금액</th>
		 					    <th>취소상품</th>
		 					    <th>취소수량</th>
		 					    <th>취소요청자</th>
		 					    <th>취소사유</th>
		 					    <th>결제수단</th>
		 					</tr>
		 				
		 				
		 				</table>
		 				
		 			    교환관리
		 				<table>
		 					<tr>
		 						<th>교환상태</th>
		 						<th>교환번호</th>
		 						<th>주문자명</th>
		 						<th>교환시점</th> 
		 						<th>교환비용</th>
		 					    <th>교환사유</th>
		 					    <th>회수수단</th>
		 					    <th>재배송 수단</th>
		 					    <th>운송장(재배송)</th>
		 					    <th>교환 요청자</th>
		 					    <th>교환 접수일</th>
		 					</tr>
		 				
		 				
		 				</table>

                        반품관리
		 				<table>
		 					<tr>
		 						<th>반품상태</th>
		 						<th>반품번호</th>
		 						<th>주문자명</th>
		 						<th>반품시점</th> 
		 						<th>환불수단</th>
		 					    <th>환불예정액</th>
		 					    <th>반품사유</th>
		 					    <th>잔여상품</th>
		 					    <th>회수 수단</th>
		 					    <th>반품요청자</th>
		 					    <th>반품 접수일</th>
		 					</tr>
		 				
		 				
		 				</table>
 			
 			
 			
 			</div>
 		</div> <!-- filer end -->
 	</div>
 	

 </div>
						  


</div>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>