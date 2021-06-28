<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
 <div id="shippingListSize" title="${fn:length(shippingAr)}">
	            <c:forEach items="${shippingAr}" var="shipping" varStatus="status">
	           
	            
	        	<!-- shipping select -->
		          <div class="card cardShip" >
					  <div class="card-body mb-0 pb-0">
				         
					  
					      <div class="card-title" style="float:left; font-weight: bold; font-size: 18px;">${shipping.shipTitle}</div>
					           <c:if test="${shipping.isDefault == true}">
								<div>
									<div class="_2w0fH" style="float:left;">기본배송지</div>
								</div>
								</c:if>
					     
					          <div style="font-size: 16px;  clear:both; "> ${shipping.shipAddress}  ${shipping.shipDetailAddress}</div>
					    	  <div  class="mt-1 mb-1 pb-1" style="font-size: 14px; font-weight: lighter;  "> ${shipping.shipName} ${shipping.shipPhone} </div>
					    	
							
					    	 <div title="${shipping.shipNum}" style="width:150px; height:50px; float: left; margin-bottom:0px;">
								 <button type="button" class="btn shipDelBtn shipBtn" title="${shipping.shipNum}"  style="font-size:14px; border: 1px solid LightGray">삭제</button>   
								 <button type="button" class="btn shipUpdateBtn shipBtn" id="shipUpdateBtn${shipping.shipNum}" title="${shipping.shipNum}" data-toggle="modal" data-target="#shippingUpdateModal" style="font-size:14px; border: 1px solid LightGray">수정</button>
							 </div>
							 <div style="width:70px; height:50px;  float: right; margin-bottom:0px;">
							   <button type="button" class="btn btn-default shipSelect shipBtn" style="font-size:14px;" title="${shipping.shipNum}" >선택</button>
							 </div>
						  
					  </div>
				  </div>
				  	<!-- shipping select  end -->
				  	
				  	</c:forEach>
				  </div>	