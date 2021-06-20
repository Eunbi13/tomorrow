<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div id="shippingSel">
						<div class="_2s2Nq">
						   <div id="shipTitle" class="shippingTitle${shippingVO.shipNum}" style="float:left; font-size:20px; font-weight: bold;"> ${shippingVO.shipTitle} </div>
							
							<c:if test="${shippingVO.isDefault == true}">
							<div>
								<div class="_2w0fH" style="float:left;">기본배송지</div>
							</div>
							</c:if>
					   </div>
					
					<div id="shipAddress" class="shippingAddress${shippingVO.shipNum}" style="clear:both; font-size:18px;">${shippingVO.shipAddress}</div>
				<div class="">
					<div id="shipNameNPhone" class="" style="font-size:15px; color:gray; padding-bottom:15px;">${shippingVO.shipName}  ${shippingVO.shipPhone}</div>
				</div>
		</div>		

