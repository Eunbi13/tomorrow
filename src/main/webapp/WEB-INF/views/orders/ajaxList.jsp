<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
   <!-- order -->
 						   <c:forEach items="${orderAr}" var="ordersVO">
	 						    <div style="margin-bottom:0px; border: 1px solid #FFF;">
		 							<div style="float:left; margin: 40px 0px 40px 20px; font-weight: bold; font-size:18px;">
		 						       	 ${ordersVO.orderNum} | ${ordersVO.orderDay}
		 						    </div>
	 						       	 <div class="detailSelect" style="float:right; margin: 45px 20px 40px 0px;">
	 						        		<a class="detailSelect" href="select?orderNum=${ordersVO.orderNum}" >상세보기 ></a>
	 						         </div>
	 						     </div>
	 						        	    	 
	 					        <hr style="margin-top:75px;">
	 						    
	 					  
	 					         <!-- brand -->
	 						     <c:forEach items="${brandAr}" var="brandVO">
	 						    	 <c:if test="${brandVO.orderNum eq ordersVO.orderNum}">
	 						    	    <!-- order -- cart, product, shipping -->
	 						    		 <c:forEach items="${ar}" var="VO">
	 						            	 <c:if test="${ordersVO.orderNum eq VO.orderNum}">
	 						            		 <c:forEach items="${VO.cartList}" var="cartVO">
	 						            			 <c:if test="${brandVO.brandNum eq cartVO.brandNum}">
	 						                        	 <li>
	 						                        	 <table>
														    <tr>
															    <td style="width: 10%; max-width:100px;">
															      <img class="productPic" alt="" src="/upload/productImages/${cartVO.productVO.productPic}">

															  </td>
															    <td style="width: 38%; font-size: 16px;">
															      ${brandVO.brandName}
															      <div class="prName" style="font-weight: bold; margin-top:10px;"> ${cartVO.productVO.productName} </div>
															     </td>
															     
															    <td style="width: 37%; font-size:18px; ">
																    <div class="opDetail"> ${cartVO.unitName} </div>
																    <div class="opDetail"> ${cartVO.cartPrice}원 | ${cartVO.amount}개</div>
							 						                         <div class="opDetail" style="color:#A63F82;"> 
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
								 					                             	환불요청 | 일반택배배송
								 						                         </c:if> 
								 						                         <c:if test="${cartVO.validity==9}">
								 					                             	환불진행중 | 일반택배배송
								 						                         </c:if> 
								 						                         <c:if test="${cartVO.validity==10}">
								 					                             	환불완료 | 일반택배배송
								 						                         </c:if> 
								 						                         <c:if test="${cartVO.validity==11}">
								 					                             	취소요청 | 일반택배배송
								 						                         </c:if> 
								 						                          <c:if test="${cartVO.validity==12}">
								 					                             	취소완료 | 일반택배배송
								 						                         </c:if> 
								 						                         <c:if test="${cartVO.validity==13}">
								 					                             	교환요청 | 일반택배배송
								 						                         </c:if> 
								 						                          <c:if test="${cartVO.validity==14}">
								 					                             	교환진행중 | 일반택배배송
								 						                         </c:if> 
								 						                          <c:if test="${cartVO.validity==15}">
								 					                             	교환완료 | 일반택배배송
								 						                         </c:if> 
								 						                        
								 						                         
							 						                         </div>
															    </td>
															    
															     <td style="width: 15%">
															     
															     <input type="hidden" id="brandShipping${cartVO.brandNum}order${ordersVO.orderNum}" value="${cartVO.brandShipping}">
															   
															     <!-- 결제완료 단계에선 취소요청시, 바로 취소가능 -->
															     <c:if test="${cartVO.validity==2}">
								 					               <button class="btn btn-orders" onclick="location.href='./cancel?cartNum=${cartVO.cartNum}&kind=1'"> 주문취소 </button>       
								 						         </c:if> 
								 						          <!-- 배송준비 단계에서 부턴 취소,환불,교환은 상세페이지에서만 확인 가능 -->
								 						          <c:if test="${cartVO.validity==3}">
								 					                
								 					               <button class="btn btn-orders" onclick="location.href='./confirm?cartNum=${cartVO.cartNum}'"> 구매확정 </button>   
								 						         </c:if> 
								 						          <c:if test="${cartVO.validity==4}">
								 					             
								 					               <button class="btn  two-btn" onclick="location.href='./confirm?cartNum=${cartVO.cartNum}'"> 구매확정 </button>  
								 					               <button class="btn btn-orders" onclick="delivery_tracking('https://tracker.delivery/#/${cartVO.carrierId}/${cartVO.trackId}');"> 배송추적  </button>
     
								 						         </c:if> 
								 						          <c:if test="${cartVO.validity==5}">
								 					                 
								 					                 <button class="btn  two-btn" onclick="location.href='./confirm?cartNum=${cartVO.cartNum}'"> 구매확정 </button>  
								 					                 <button class="btn btn-orders" onclick="delivery_tracking('https://tracker.delivery/#/${cartVO.carrierId}/${cartVO.trackId}');"> 배송추적 </button>
          
								 						         </c:if> 
								 						          <c:if test="${cartVO.validity==6}">
								 					               <button class="btn two-btn"> 리뷰작성 </button>   
								 					       		   <button class="btn btn-orders" onclick="delivery_tracking('https://tracker.delivery/#/${cartVO.carrierId}/${cartVO.trackId}');"> 배송추적  </button>
								 						         </c:if> 						     
															     </td>
														   </tr>
												   	     </table>
		 						        
		 						                         </li>
		 						                  	</c:if>
		 						                 </c:forEach>
		 						              </c:if>
		 						          </c:forEach>
	 				                         		<div class="card1">
	 				                         		        <div id="shipping${brandVO.brandNum}order${ordersVO.orderNum}" class="shipping" title="${brandVO.brandNum}" data-orderNum="${ordersVO.orderNum}"> 선배송비 3000원 </div>
				 						                   <div class="cart-in" style="font-weight:600;" >${brandVO.companyName}</div> 
				 						                   <div class="cart-in" style="color:#A63F82; font-weight:600;">${brandVO.managerPhone} </div>
				 						            </div>  
	 				                 </c:if>  
 				                 </c:forEach>      
		 						      <!-- brand end -->       
	 				        </c:forEach>
	 				        <!-- order end -->