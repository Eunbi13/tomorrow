<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
	 				        