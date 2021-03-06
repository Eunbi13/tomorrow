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
 .two-btns{
 margin-top: 20px;
 }
 .two-btn{
  
    width:125px;
    max-width:100%;
	padding:11px 22px;
	font-weight: bold;
	font-size: 18px;
	border-radius:0;
	background-color: #A63F82;
	color: #FFF;
	border-color: #A63F82;
	border:1px solid;
	border-radius:6px;
    margin: 0px 0px 10px 0px;
}

.two-btn:hover, .two-btn:focus, .two-btn:active, .two-btn.active, .open .dropdown-toggle.two-btn {
 
	background-color: #e5b8d7;
	color:#A63F82;
	border-color: #A63F82;;
}

.four-btns{
margin: 20px 0px 0px 0px;


}

.four-btn{

    width:100px;
    max-width:100%;
	padding:11px 22px;
	font-weight: bold;
	font-size: 12px;
	border-radius:0;
	background-color: #FFF;
	color:#A63F82;
	border-color: #A63F82;
	border:1px solid;
	border-radius:6px;
	margin-left: 5px;
	margin-bottom:5px;

}

.four-btn:hover, .four-btn:focus, .four-btnt:active, .four-btn.active, .open .dropdown-toggle.four-btn {
 
	background-color: #e5b8d7;
	color:#A63F82;
	border-color: #A63F82;;
}

.btn-orders{
    
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
.btn-orders:hover, .btn-orders:focus, .bbtn-orders:active, .btn-orders.active, .open .dropdown-toggle.btn-orders {
 
	background-color: #e5b8d7;
	color:#A63F82;
	border-color: #A63F82;;
}

.order {
  border-collapse: collapse;
  margin: 0 auto;
  witdh:1200px;
  padding:0;
}
.order td {
 
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
witdh:1200px;
border-left: none; 
border-right: none; 
}

.productPic{
	margin-right:15px;
	width:84px;
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
.bigTitle{

font-size:26px; 
font-weight:bold; 
margin-top:40px;

}



</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<main>
       <div class="container">
         <div class="bigTitle">??????????????????</div> 
         
           
       
	                 <ul class="no-bullets">
 						   
	 						   <li style="clear:both;">
		 							<div style="margin: 10px 0px; font-weight: bold; font-size:18px;">
		 						       	 ????????????: ${ordersVO.orderNum} | ????????????: ${ordersVO.orderDay}
		 						    </div>
	 						       	    
	 					       </li>  
	 					       
	 					   <hr style="margin-top:50px;" tyle="width:1200px;">
	 						     <c:forEach items="${brandAr}" var="brandVO">
	 						        <table class="order">
	 						    	  <c:forEach items="${ordersVO.cartList}" var="cartVO">
	 						    	       <c:if test="${brandVO.brandNum eq cartVO.brandNum}">
	 						    	  
                
	 						    		
	 						            
	 						                        	 
	 						                        	
	 						          
														    <tr style="width:1200px;">
															    <td style="width: 10%; border-right:none; max-width:100px;">
															      <img class="productPic" alt="" src="/upload/productImages/${cartVO.productVO.productPic}">
															  </td>
															    <td style="width: 66%; border-left:none; font-size: 16px; ">
															   
															      <div style="font-weight: bold; margin-top:10px;"> [${brandVO.brandName}]  ${cartVO.productVO.productName} </div>
															    
																     <div style="margin:10px 0px">${cartVO.unitName}</div> 
																    <div> <div style="float:left; font-weight:bold;">${cartVO.cartPrice}??? &#160; </div> <div style="float:left; color:gray;">| ${cartVO.amount}???</div></div>
							 						                         <div style="clear:both;"> 
							 						                             <c:if test="${cartVO.validity==2}">
								 					                             	???????????? | ??????????????????
								 						                         </c:if> 
								 						                         <c:if test="${cartVO.validity==3}">
								 					                             	???????????? | ??????????????????
								 						                         </c:if> 
								 						                         <c:if test="${cartVO.validity==4}">
								 					                             	????????? | ??????????????????
								 						                         </c:if> 
								 						                         <c:if test="${cartVO.validity==5}">
								 					                             	???????????? | ??????????????????
								 						                         </c:if> 
								 						                          <c:if test="${cartVO.validity==6}">
								 					                             	???????????? | ??????????????????
								 						                         </c:if> 
								 						                         <c:if test="${cartVO.validity==7}">
								 					                             	???????????? | ??????????????????
								 						                         </c:if> 
								 						                         <c:if test="${cartVO.validity==8}">
								 					                             	???????????? | ??????????????????
								 						                         </c:if> 
								 						                         <c:if test="${cartVO.validity==9}">
								 					                             	??????????????? | ??????????????????
								 						                         </c:if> 
								 						                         <c:if test="${cartVO.validity==10}">
								 					                             	???????????? | ??????????????????
								 						                         </c:if> 
								 						                         <c:if test="${cartVO.validity==11}">
								 					                             	???????????? | ??????????????????
								 						                         </c:if> 
								 						                          <c:if test="${cartVO.validity==12}">
								 					                             	???????????? | ??????????????????
								 						                         </c:if> 
								 						                         <c:if test="${cartVO.validity==13}">
								 					                             	???????????? | ??????????????????
								 						                         </c:if> 
								 						                          <c:if test="${cartVO.validity==14}">
								 					                             	??????????????? | ??????????????????
								 						                         </c:if> 
								 						                          <c:if test="${cartVO.validity==15}">
								 					                             	???????????? | ??????????????????
								 						                         </c:if> 
							 						                         </div>
															    </td>
															    
															     <td style="width: 30%; text-align: center; text-align:center; vertical-align: center;">
															    <input type="hidden" id="brandShipping${cartVO.brandNum}" value="${cartVO.brandShipping}">
															    <!-- ???????????? ???????????? ???????????????, ?????? ???????????? -->
															     <c:if test="${cartVO.validity==2}">
								 					               <button class="btn btn-orders" onclick="location.href='./cancel?cartNum=${cartVO.cartNum}&kind=1'"> ???????????? </button>       
								 						         </c:if> 
								 						          <!-- ???????????? ???????????? ?????? ???????????????, ???????????? ????????? ????????? ?????? -->
								 						          <c:if test="${cartVO.validity==3}">
									 						          <div class="two-btns">
										 					               <div><button class="btn two-btn" onclick="location.href='./cancel?cartNum=${cartVO.cartNum}&kind=1'"> ???????????? </button> </div>  
										 					                    <button class="btn btn-orders" onclick="location.href='./confirm?cartNum=${cartVO.cartNum}'"> ???????????? </button>   
									 						          </div>
								 						         </c:if> 
								 						           <!-- ????????? -->
								 						          <c:if test="${cartVO.validity==4}">
									 						          <div class="four-btns" style="text-align:center;">
										 					               <button class="btn four-btn" onclick="location.href='./cancel?cartNum=${cartVO.cartNum}&kind=2'"> ?????? </button>   
										 					               <button class="btn four-btn" onclick="location.href='./cancel?cartNum=${cartVO.cartNum}&kind=3'"> ?????? </button>  
										 					               <button class="btn four-btn" onclick="location.href='./confirm?cartNum=${cartVO.cartNum}'"> ???????????? </button>  
										 					               <button class="btn four-btn" onclick="delivery_tracking('https://tracker.delivery/#/${cartVO.carrierId}/${cartVO.trackId}');"> ????????????  </button>
	        														   
	        														  </div>
								 						         </c:if> 
								 						         <!-- ???????????? -->
								 						          <c:if test="${cartVO.validity==5}">
								 						              <div class="four-btns" style="text-align:center;">
										 					               <button class="btn four-btn" onclick="location.href='./cancel?cartNum=${cartVO.cartNum}&kind=2'"> ?????? </button>   
										 					               <button class="btn four-btn" onclick="location.href='./cancel?cartNum=${cartVO.cartNum}&kind=3'"> ?????? </button>  
										 					               <button class="btn four-btn" onclick="location.href='./confirm?cartNum=${cartVO.cartNum}'"> ???????????? </button>  
										 					               <button class="btn four-btn" onclick="delivery_tracking('https://tracker.delivery/#/${cartVO.carrierId}/${cartVO.trackId}');"> ????????????  </button>
	        														  </div>
								 					              
								 					                 
          
								 						         </c:if> 
								 						          <!-- ???????????? -->
								 						          <c:if test="${cartVO.validity==6}">
								 						           	<div class="two-btns">
									 					               <div> <button class="btn two-btn"> ???????????? </button> </div>
									 					       		   <button class="btn btn-orders" onclick="delivery_tracking('https://tracker.delivery/#/${cartVO.carrierId}/${cartVO.trackId}');"> ????????????  </button>
								 						           </div>
								 						         </c:if> 
															     </td>
														   </tr>
												   	    
		 						        
		 						                       
		 						                
		 						              </c:if>
		 						          </c:forEach>
		 						           </table>
	 				                         		<div class="card1">
	 				                         		        <div id="shipping${brandVO.brandNum}" class="shipping" title="${brandVO.brandNum}"> ???????????? 3000??? </div>
				 						                   <div class="cart-in" style="font-weight:600; ;" >${brandVO.companyName}</div> 
				 						                   <div class="cart-in" style="color:#A63F82;">${brandVO.managerPhone} </div>
				 						            </div>  
				 						           
	 				           
 				                 </c:forEach>      
		 						            
	 				       
	 			
 				   
 						
 					 </ul>
 					 
 					 <div class="title">
		 				?????? ??????
		 			 </div>
 					 
 		             <hr style="margin-top:10px;">
 					 
 					 
 					 <table class="info" style="margin-bottom:60px;">
 					 	<tr style="margin: 20px 0px;">
 					 		<td class="subTitle">????????????</td>
 					 		<td class="content">${ordersVO.itemsPrice}???</td>
 					 		<td class="subTitle">?????????</td>
 					 		<td class="content">${ordersVO.name}</td>
 					 	</tr>
 					 	<tr>
 					 		<td class="subTitle">???????????????</td>
 					 		<td class="content" >${ordersVO.shippingFee}???</td>
 					 		<td class="subTitle">?????????</td>
 					 		<td class="content">${ordersVO.phone}</td>
 					 	</tr>
 					 	<tr>
 					 		<td class="subTitle">????????????</td>
 					 		<td class="content" style="width: 40%;">${ordersVO.payment}???</td>
 					 		<td class="subTitle">?????????</td>
 					 		<td class="content">${ordersVO.email}</td>
 					 	</tr>
 					 	<tr>
 					 		<td class="subTitle">????????????</td>
 					 		<td class="content">${ordersVO.paymentType}</td>
 					 		<td class="subTitle"></td>
 					 		<td class="content"></td>
 					 	</tr>
 					 </table>
 					 
 				    <div class="title">
		 					????????? ??????
		 			 </div>
 					 
 					 <hr style="margin-top:10px;" >
 					 
 					 
 					 <table class="info" style="margin-bottom:70px;">
 					 	<tr>
 					 		<td class="subTitle">?????? ??????</td>
 					 		<td style="width: 90%;">${ordersVO.shipName} </td>
 					 	</tr>
 					 	<tr>
 					 		<td class="subTitle">?????????</td>
 					 		<td style="width: 90%;">${ordersVO.shipPhone} </td>
 					 	</tr>
 					 	<tr>
 					 		<td class="subTitle">??????</td>
 					 		<td style="width: 90%;">(${ordersVO.postcode})${ordersVO.shipAddress}  </td>
 					 	</tr>
 					 	<tr>
 					 		<td class="subTitle">????????????</td>
 					 		<td style="width: 90%;">
 					 		<c:choose>
 					 			<c:when test="${ordersVO.shippingMemo==1}">
 					 		     ????????? ????????? ???????????????
	 					 		</c:when>
	 					 		<c:when test="${ordersVO.shippingMemo==2}">
	 					 		???????????? ?????? ???????????????
	 					 		</c:when>
	 					 		<c:when test="${ordersVO.shippingMemo==3}">
	 					 		????????? ???????????? ?????? ?????????
	 					 		</c:when>
	 					 		<c:when test="${ordersVO.shippingMemo==4}">
	 					 		????????? ?????????????????? ?????? ?????? ?????????
	 					 		</c:when>
	 					 		
	 					 		<c:otherwise>
	 					 		  ${ordersVO.shippingMemo} 
	 					 		</c:otherwise>
 					 			
 					 		</c:choose>
 					 		
 					 		</td>
 					 	</tr>
 					 </table>
 			
 			</div>
 			

<script type="text/javascript">

	//delivery_tracking pop up ?????????
	
	function delivery_tracking(link01){
		
		window.open(link01,"_blank","width=500, height=740;");
	}


  //???????????? ????????? 
	$(".shipping").each(function(){
		
		let brandNum = $(this).attr("title");
		let brandShipping =$("#brandShipping"+brandNum).val();
		brandShipping = parseInt(brandShipping);
		let brandShippingShow="????????????";
		if(brandShipping!=0){
		     brandShippingShow= "???????????? "+ brandShipping +"???";
		}
		
		$("#shipping"+brandNum).text(brandShippingShow);
		
	});
</script>
</main>
<c:import url="../template/footer.jsp"></c:import>

</body>
</html>