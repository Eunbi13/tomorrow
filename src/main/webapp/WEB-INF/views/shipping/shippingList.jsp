<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<div id="shippingListSize" title="${fn:length(shippingAr)}">
        <c:forEach items="${shippingAr}" var="shipping" varStatus="status">
       
        
    	<!-- shipping select -->
       <div class="card" style="width: 100%; height:200px; margin-bottom: 10px; border: 1px solid LightGray; border-radius:10px;">
  <div class="card-body ">
       <input type="hidden" id="shipNum" value="${shippingVO.shipNum}">
      
        
  
      <div class="card-title" style="float:left; font-weight: bold; font-size: 18px;">${shipping.shipTitle}</div>
           <c:if test="${shipping.isDefault == true}">
			<div>
				<div class="_2w0fH" style="float:left;">기본배송지</div>
			</div>
			</c:if>
     
          <div style="font-size: 16px;  clear:both; "> ${shipping.shipAddress}</div>
    	  <div  style="font-size: 14px; font-weight: lighter; padding-bottom:10px;"> ${shipping.shipName} ${shipping.shipPhone} </div>
    	
		
    	 <div title="${shipping.shipNum}" style="width:150px; height:50px; float: left;">
			 <button type="button" class="btn shipDelBtn" title="${shipping.shipNum}"  style="font-size:14px; border: 1px solid LightGray">삭제</button>   
			 <button type="button" class="btn shipUpdateBtn" title="${shipping.shipNum}"  style="font-size:14px; border: 1px solid LightGray">수정</button>
		 </div>
		 <div style="width:70px; height:50px;  float: right;">
		   <button type="button" class="btn btn-default shipSelect" style="font-size:14px;" title="${shipping.shipNum}" >선택</button>
		 </div>
	  
  </div>
 </div>
 	<!-- shipping select  end -->
 	
 	</c:forEach>
 </div>	