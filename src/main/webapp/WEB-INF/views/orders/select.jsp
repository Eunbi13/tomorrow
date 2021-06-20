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
.title{
margin: 50px 0px 10px 10px; 
font-weight: bold; 
font-size:18px;
}
.subTitle{
width: 10%; 
color:gray;
padding-left:10px;
}
.content{
text-align:right;
width: 40%;
padding-right: 30px;
}
.info{
max-width:1200px;
width:100%;
padding:0; 

}

.info tr{
 margin: 0px 0px;
 font-size: 16px;

 height: 40px;
 
}

.info td{
 margin: px 0px;
 font-size: 16px;
}

ul.no-bullets {
  list-style-type: none; /* Remove bullets */
  padding: 0; /* Remove padding */
  margin: 0; /* Remove margins */
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
.order {
  border-collapse: collapse;
  margin: 0 auto;

  max-width:1200px;
  padding:0;
}
.order td {
witdh:100%;
  border: 1px solid #e6e6e6; 
  padding-bottom:20px;
}
.order tr:first-child td {
  border-top: 0;
}
.order tr td:first-child {
  border-left: 0;
}
.order tr:last-child td {
  border-bottom: 0;
}
.order tr td:last-child {
  border-right: 0;
}

.container-fluid{
max-width:1200px;
}

.order tr{
witdh:100%;
border-left: none; 
border-right: none; 
}

img{
width:80px;
max-width: 100px;
border-radius: 10px;
}
.cart-in{ 

 display: inline-block;
 margin-top: 10px;
/*  width: 120px;
 height: 30px; */
 
}

.card1{
 font-size: 18px;
 width:100%;
  margin: 0 auto;
 text-align: center;

 padding: 15px;
 background-color: #F5F5F5;
 border-color: #F5F5F5;
 

}



</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

       <div class="container-fluid">
         <div style="font-size:24px; font-weight:bold; margin-top:40px;">주문상세정보</div> 
         
           
       
	                 <ul class="no-bullets">
 						   
	 						   <li style="clear:both;">
		 							<div style="margin: 10px 0px; font-weight: bold; font-size:18px;">
		 						       	 주문번호: ${ordersVO.orderNum} | 주문일자: ${ordersVO.orderDay}
		 						    </div>
	 						       	    
	 					       </li>  
	 					       
	 					   <hr style="margin-top:50px;">
	 						     <c:forEach items="${brandAr}" var="brandVO">
	 						        <table class="order">
	 						    	  <c:forEach items="${ordersVO.cartList}" var="cartVO">
	 						    	       <c:if test="${brandVO.brandNum eq cartVO.brandNum}">
	 						    	  
                
	 						    		
	 						            
	 						                        	 
	 						                        	
	 						          
														    <tr>
															    <td style="width: 10%; border-right:none; max-width:100px;">
															    <img src="../resources/images/glove.webp" class="mr-3" alt="...">
															  </td>
															    <td style="width: 66%; border-left:none; font-size: 16px;">
															   
															      <div style="font-weight: bold; margin-top:10px;"> [${brandVO.brandName}]  ${cartVO.productVO.productName} </div>
															    
																     <div style="margin:10px 0px">${cartVO.unitName}</div> 
																    <div> <div style="float:left; font-weight:bold;">${cartVO.cartPrice}원 &#160; </div> <div style="float:left; color:gray;">| ${cartVO.amount}개</div></div>
							 						                         <div style="clear:both;"> 
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
															    
															     <td style="width: 30%; text-align: center;">
															    <input type="hidden" id="brandShipping${cartVO.brandNum}" value="${cartVO.brandShipping}">
															     
															     <button class="btn btn-default" onclick="delivery_tracking('https://tracker.delivery/#/${cartVO.carrierId}/${cartVO.trackId}');"> 배송추적  </button>
															     </td>
														   </tr>
												   	    
		 						        
		 						                       
		 						                
		 						              </c:if>
		 						          </c:forEach>
		 						           </table>
	 				                         		<div class="card1">
	 				                         		        <div id="shipping${brandVO.brandNum}" class="shipping" title="${brandVO.brandNum}"> 선배송비 3000원 </div>
				 						                   <div class="cart-in" style="font-weight:600; ;" >${brandVO.companyName}</div> 
				 						                   <div class="cart-in" style="color:#A63F82;">${brandVO.managerPhone} </div>
				 						            </div>  
				 						           
	 				           
 				                 </c:forEach>      
		 						            
	 				       
	 			
 				   
 						
 					 </ul>
 					 
 					 <div class="title">
		 				결제 정보
		 			 </div>
 					 
 		             <hr style="margin-top:10px;">
 					 
 					 
 					 <table class="info" style="margin-bottom:60px;">
 					 	<tr style="margin: 20px 0px;">
 					 		<td class="subTitle">상품금액</td>
 					 		<td class="content">${ordersVO.itemsPrice}원</td>
 					 		<td class="subTitle">주문자</td>
 					 		<td class="content">${ordersVO.name}</td>
 					 	</tr>
 					 	<tr>
 					 		<td class="subTitle">선불배송비</td>
 					 		<td class="content" >${ordersVO.shippingFee}원</td>
 					 		<td class="subTitle">연락처</td>
 					 		<td class="content">${ordersVO.phone}</td>
 					 	</tr>
 					 	<tr>
 					 		<td class="subTitle">결제금액</td>
 					 		<td class="content" style="width: 40%;">${ordersVO.payment}원</td>
 					 		<td class="subTitle">이메일</td>
 					 		<td class="content">${ordersVO.email}</td>
 					 	</tr>
 					 	<tr>
 					 		<td class="subTitle">결제방법</td>
 					 		<td class="content">${ordersVO.paymentType}</td>
 					 		<td class="subTitle"></td>
 					 		<td class="content"></td>
 					 	</tr>
 					 </table>
 					 
 				    <div class="title">
		 					배송지 정보
		 			 </div>
 					 
 					 <hr style="margin-top:10px;" >
 					 
 					 
 					 <table class="info" style="margin-bottom:70px;">
 					 	<tr>
 					 		<td class="subTitle">받는 사람</td>
 					 		<td style="width: 90%;">${ordersVO.shippingVO.shipName} </td>
 					 	</tr>
 					 	<tr>
 					 		<td class="subTitle">연락처</td>
 					 		<td style="width: 90%;">${ordersVO.shippingVO.shipPhone} </td>
 					 	</tr>
 					 	<tr>
 					 		<td class="subTitle">주소</td>
 					 		<td style="width: 90%;">(${ordersVO.shippingVO.postcode})${ordersVO.shippingVO.shipAddress} ${ordersVO.shippingVO.shipDetailAddress} </td>
 					 	</tr>
 					 	<tr>
 					 		<td class="subTitle">배송메모</td>
 					 		<td style="width: 90%;">
 					 		<c:if test="${ordersVO.shippingMemo==1}">
 					 		부재시 문앞에 놓아주세요
 					 		</c:if>
 					 		<c:if test="${ordersVO.shippingMemo==2}">
 					 		배송전에 미리 연락주세요
 					 		</c:if>
 					 		<c:if test="${ordersVO.shippingMemo==3}">
 					 		부재시 경비실에 맡겨 주세요
 					 		</c:if>
 					 		<c:if test="${ordersVO.shippingMemo==4}">
 					 		부재시 전화주시거나 문자 남겨 주세요
 					 		</c:if>
 					 		<c:if test="${ordersVO.shippingMemo==5}">
 					 		${ordersVO.shippingMemo} 
 					 		</c:if>
 					 		
 					 		</td>
 					 	</tr>
 					 </table>
 			
 			</div>
 			

<script type="text/javascript">

  //브랜드별 배송비 표
	$(".shipping").each(function(){
		
		let brandNum = $(this).attr("title");
		let brandShipping =$("#brandShipping"+brandNum).val();
		brandShipping = parseInt(brandShipping);
		let brandShippingShow= "선배송비"+brandShipping+"원";
		$("#shipping"+brandNum).text(brandShippingShow);
		
	});
</script>
<c:import url="../template/footer.jsp"></c:import>

</body>
</html>