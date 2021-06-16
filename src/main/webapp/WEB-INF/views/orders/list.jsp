<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='https://css.gg/close-o.css' rel='stylesheet'>
<style>

.detailSelect{
 color:gray; 

}
.btn-sel{
	background-color: #e5b8d7;
	color:#A63F82;
	border-color: #e5b8d7;
	padding:2px 5px 2px 10px;
	border-radius: 5px;
	border: 0;
	outlin:0;

}
.filter-bar_tag-list_item{
clear:both;
}
.sm-btn{
	background-color: #A63F82;
	color:#FFF;
	border-color: #A63F82;
	border-radius:50px;
	font-size: 15px;
	padding:1px 0px 1px 10px;
	
}

.sm-btn:hover, .sm-btnt:focus, .sm-btn:active, .sm-btn.active, .open .dropdown-toggle.sm-btn {
 
	background-color: #732944;
	color:#FFF;
	border-color: #732944;
}

.btn-default{
    
    width:125px;
    max-width:100%;
	padding:11px 22px;
	font-weight: bold;
	font-size: 18px;
	border-radius:0;
	background-color: #FFF;
	color:#A63F82;
	border-color: #A63F82;
	border:1px solid;
	border-radius:6px;

}
.btn-default:hover, .btn-default:focus, .btn-default:active, .btn-default.active, .open .dropdown-toggle.btn-default {
 
	background-color: #e5b8d7;
	color:#A63F82;
	border-color: #A63F82;;
}

img{
width:74px;
max-width: 100px;
border-radius: 10px;
}
table {
font-size:18px;
width:100%;
margin: 25px 0px;
}
table tr td{
/* border: blue 1px solid; */
}
.cart-in{
 display: inline-block;
 margin-top: 10px;
/*  width: 120px;
 height: 30px; */
 
}

.card1{
 width:100%;
  margin: 0 auto;
 text-align: center;

 padding: 15px;
 background-color: #F5F5F5;
 border-color: #F5F5F5;
 border-radius: 5px;

}

.filter-bar_control-list_item-icon{
margin:0px;
}

.filter-bar_control-list_left{
list-style-type: none;
  margin: 0;
  padding: 0;

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
 <div style="font-size:24px; font-weight:bold; margin-top:40px;"> 주문배송내역 조회</div> 

 	<div class="order_list_menu rounded">
 		<a class="order_list_menu_list" href="/orders/list">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">입금대기</div>
 				<div class="order_list_menu_list_value"> 0 </div>
 				
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/orders/list?status=2">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">결제완료</div>
 				<div class="order_list_menu_list_value"> 0 </div>
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/orders/list?status=3">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">배송준비</div>
 				<div class="order_list_menu_list_value"> 0 </div>
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/orders/list?status=4">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">배송중</div>
 				<div class="order_list_menu_list_value"> 0 </div>
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/orders/list?status=5">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">배송완료</div>
 				<div class="order_list_menu_list_value"> 0 </div>
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/orders/list?status=6">
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
 						   <div class="dropBtn" style="float:left; margin: 0px 10px 15px 0px;  ">
 			                <button type="button" class="btn-sel dropdown-toggle" data-toggle="dropdown" style="font-size:16px;">
							    기간
							  </button>
							  <div class="dropdown-menu"  style="font-size:16px;">
							    <a class="dropdown-item" href="list?before=1">1개월 전</a>
							    <a class="dropdown-item" href="list?before=3">3개월 전</a>
							    <a class="dropdown-item" href="list?before=6">6개월 전</a>
							    <a class="dropdown-item" href="list?before=12">1년 전</a>
							    <a class="dropdown-item" href="list?before=24">2년 전</a>
							    <a class="dropdown-item" href="list?before=36">3년 전</a>
							  </div>
							 </div>
							  
							 <div class="dropBtn" style="float:left; font-size:16px; ">
							   <button type="button" class="btn-sel dropdown-toggle" data-toggle="dropdown" style="font-size:16px;">
							    주문상태 
							  </button>
							  <div class="dropdown-menu" style="font-size:16px;"> 
							    <a class="dropdown-item" href="list">입금대기</a>
							    <a class="dropdown-item" href="list?status=2">결제완료</a>
							    <a class="dropdown-item" href="list?status=3">배송준비</a>
							    <a class="dropdown-item" href="list?status=4">배송중</a>
							    <a class="dropdown-item" href="list?status=5">배송완료</a>
							    <a class="dropdown-item" href="list?status=6">구매확정</a>
							    <a class="dropdown-item" href="list?status=7">리뷰작성</a>
							    <a class="dropdown-item" href="list?status=8">취소</a>
							    <a class="dropdown-item" href="list?status=9">교환</a>
							    <a class="dropdown-item" href="list?status=10">환불</a>
							  </div>
							 </div>
						  </li>
						  <li class="filter-bar_tag-list_item filter-bar_control-list_item-icon" style="margin: 0px 10px 30px 0px; ">
						  <button class="btn sm-btn">구매확정
						   
						    <svg
							  width="24" height="24" viewBox="0 0 24 24" fill="none"
							  xmlns="http://www.w3.org/2000/svg">
							  <path
							    d="M16.3394 9.32245C16.7434 8.94589 16.7657 8.31312 16.3891 7.90911C16.0126 7.50509 15.3798 7.48283 14.9758 7.85938L12.0497 10.5866L9.32245 7.66048C8.94589 7.25647 8.31312 7.23421 7.90911 7.61076C7.50509 7.98731 7.48283 8.62008 7.85938 9.0241L10.5866 11.9502L7.66048 14.6775C7.25647 15.054 7.23421 15.6868 7.61076 16.0908C7.98731 16.4948 8.62008 16.5171 9.0241 16.1405L11.9502 13.4133L14.6775 16.3394C15.054 16.7434 15.6868 16.7657 16.0908 16.3891C16.4948 16.0126 16.5171 15.3798 16.1405 14.9758L13.4133 12.0497L16.3394 9.32245Z"
							    fill="currentColor" />
							  <path
							    fill-rule="evenodd"
							    clip-rule="evenodd"
							    d="M1 12C1 5.92487 5.92487 1 12 1C18.0751 1 23 5.92487 23 12C23 18.0751 18.0751 23 12 23C5.92487 23 1 18.0751 1 12ZM12 21C7.02944 21 3 16.9706 3 12C3 7.02944 7.02944 3 12 3C16.9706 3 21 7.02944 21 12C21 16.9706 16.9706 21 12 21Z"
							    fill="currentColor" />
							</svg>
						  </button>
						  <button class="btn sm-btn">1년 전
						   
						    <svg
							  width="24" height="24" viewBox="0 0 24 24" fill="none"
							  xmlns="http://www.w3.org/2000/svg">
							  <path
							    d="M16.3394 9.32245C16.7434 8.94589 16.7657 8.31312 16.3891 7.90911C16.0126 7.50509 15.3798 7.48283 14.9758 7.85938L12.0497 10.5866L9.32245 7.66048C8.94589 7.25647 8.31312 7.23421 7.90911 7.61076C7.50509 7.98731 7.48283 8.62008 7.85938 9.0241L10.5866 11.9502L7.66048 14.6775C7.25647 15.054 7.23421 15.6868 7.61076 16.0908C7.98731 16.4948 8.62008 16.5171 9.0241 16.1405L11.9502 13.4133L14.6775 16.3394C15.054 16.7434 15.6868 16.7657 16.0908 16.3891C16.4948 16.0126 16.5171 15.3798 16.1405 14.9758L13.4133 12.0497L16.3394 9.32245Z"
							    fill="currentColor" />
							  <path
							    fill-rule="evenodd"
							    clip-rule="evenodd"
							    d="M1 12C1 5.92487 5.92487 1 12 1C18.0751 1 23 5.92487 23 12C23 18.0751 18.0751 23 12 23C5.92487 23 1 18.0751 1 12ZM12 21C7.02944 21 3 16.9706 3 12C3 7.02944 7.02944 3 12 3C16.9706 3 21 7.02944 21 12C21 16.9706 16.9706 21 12 21Z"
							    fill="currentColor" />
							</svg>
						  </button>
						  </li>
						
							  
 						   <c:forEach items="${orderAr}" var="ordersVO">
	 						   <li style="clear:both;">
		 							<div style="float:left; margin: 40px 0px 0px 20px; font-weight: bold; font-size:18px;">
		 						       	 ${ordersVO.orderNum} | ${ordersVO.orderDay}
		 						    </div>
	 						       	    <div class="detailSelect" style="float:right; margin: 45px 20px 0px 0px;">
	 						        		<a class="detailSelect" href="select?orderNum=${ordersVO.orderNum}" >상세보기 ></a>
	 						        	</div>
	 					       </li>  
	 					       
	 					   <hr style="margin-top:80px;">
	 						     <c:forEach items="${brandAr}" var="brandVO">
	 						    	 <c:if test="${brandVO.orderNum eq ordersVO.orderNum}">
	 						    		 <c:forEach items="${ar}" var="VO">
	 						            	 <c:if test="${ordersVO.orderNum eq VO.orderNum}">
	 						            		 <c:forEach items="${VO.cartList}" var="cartVO">
	 						            			 <c:if test="${brandVO.brandNum eq cartVO.brandNum}">
	 						                        	 <li>
	 						                        	 <table>
														    <tr>
															    <td style="width: 10%; max-width:100px;">
															    <img src="../resources/images/glove.webp" class="mr-3" alt="...">
															  </td>
															    <td style="width: 38%; font-size: 16px;">
															      ${brandVO.brandName}
															      <div style="font-weight: bold; margin-top:10px;"> ${cartVO.productVO.productName} </div>
															     </td>
															     
															    <td style="width: 37%; font-size:18px;">
																    ${cartVO.unitName}
																    <div> ${cartVO.cartPrice}원 | ${cartVO.amount}개</div>
							 						                         <div style="color:#A63F82;"> 
								 						                         <c:if test="${cartVO.validity==2}">
								 					                             	결제완료 | 일반택배배송
								 						                         </c:if> 
								 						                         <c:if test="${cartVO.validity==3}">
								 					                             	배송준비 | 일반택배배송
								 						                         </c:if> 
								 						                         <c:if test="${cartVO.validity==4}">
								 					                             	배송중 | 일반택배배송
								 						                         </c:if> 
								 						                         <c:if test="${cartVO.validity==5}">
								 					                             	배송완료 | 일반택배배송
								 						                         </c:if> 
								 						                          <c:if test="${cartVO.validity==6}">
								 					                             	구매확정 | 일반택배배송
								 						                         </c:if> 
								 						                         <c:if test="${cartVO.validity==7}">
								 					                             	리뷰작성 | 일반택배배송
								 						                         </c:if> 
								 						                         <c:if test="${cartVO.validity==8}">
								 					                             	취소 | 일반택배배송
								 						                         </c:if> 
								 						                         <c:if test="${cartVO.validity==9}">
								 					                             	교환 | 일반택배배송
								 						                         </c:if> 
								 						                         <c:if test="${cartVO.validity==10}">
								 					                             	환불 | 일반택배배송
								 						                         </c:if> 
							 						                         </div>
															    </td>
															    
															     <td style="width: 15%">
															     <button class="btn btn-default"> 배송추적 </button>
															     </td>
														   </tr>
												   	     </table>
		 						        
		 						                         </li>
		 						                  	</c:if>
		 						                 </c:forEach>
		 						              </c:if>
		 						          </c:forEach>
	 				                         		<div class="card1">
	 				                         		       <div> 선배송비 3000원</div>
				 						                   <div class="cart-in" style="font-weight:600;" >${brandVO.companyName}</div> 
				 						                   <div class="cart-in" style="color:#A63F82; font-weight:600;">${brandVO.managerPhone} </div>
				 						            </div>  
	 				                 </c:if>  
 				                 </c:forEach>      
		 						            
	 				        </c:forEach>
	 			
 				   
 						
 					 </ul>
 			   	</div>
 			</div>
 		</div>
 	</div>
 


</div>

<c:import url="../template/footer.jsp"></c:import>

</body>
</html>