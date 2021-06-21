<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



				
								<div class="_2s2Nq">
								  <input type="hidden" id="shipNum" title="${shippingVO.shipNum}" value="${shippingVO.shipNum}">
								   <div id="shipTitle" class="shippingTitle${shippingVO.shipNum}" style="float:left; font-size:20px; font-weight: bold;"> ${shippingVO.shipTitle} </div>
									
									<c:if test="${shippingVO.isDefault == true}">
									<div>
										<div class="_2w0fH" style="float:left;">기본배송지</div>
									</div>
									</c:if>
							   </div>
							  <input type="hidden" id="shipPostcode" value="${shippingVO.postcode}">
							<div id="shipAddress" class="shippingAddress${shippingVO.shipNum}" title="${shippingVO.shipAddress}" style="clear:both; font-size:18px;">${shippingVO.shipAddress}, ${shippingVO.shipDetailAddress}</div>
						<div class="">
							<input id="shipName" class="shipNP" value="${shippingVO.shipName}">
						    <input id="shipPhone" class="shipNP" value="${shippingVO.shipPhone}">
						    
						</div>
	

