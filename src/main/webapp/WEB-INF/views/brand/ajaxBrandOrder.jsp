<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>


<div class="filter-table">
		 			   <div class="title2">
		 			    주문접수내역(주문관리 + 결제내역, 배송관리, 구매확정)
		 			    </div>
		 				<table class="tab">
		 					<tr>
		 						<th>주문상태</th>
		 						<th>주문번호/옵션번호</th>
		 						<th>주문자명</th>
		 						<th>상품이미지</th> 
		 						<th>주문상품</th>
		 					    <th>주문수량</th>
		 					    <th>결제수단</th>
		 					    <th>결제금액</th>
		 					    
		 					    
		 					</tr>
		 			   		  <c:forEach items="${ar}" var="cartVO">
		 					<tr>
		 						<td>${cartVO.validity}</td>
		 						<td>
		 						  <!-- Button trigger modal -->
										<button type="button" class="btn-orderDetail orderDetail" title="${cartVO.cartNum}" data-toggle="modal" data-target="#orderDetail">
										  ${cartVO.ordersVO.orderNum} / ${cartVO.cartNum}
										</button>
		 						</td>
		 						<td>${cartVO.ordersVO.name}</td>
		 						<td> <img class="productPic" alt="" src="/upload/productImages/${cartVO.productVO.productPic}">
		 						</td> 
		 						<td>${cartVO.productVO.productName}</td>
		 					    <td>${cartVO.amount}</td>
		 					    <td>${cartVO.ordersVO.paymentType}</td>
		 					    <td>${cartVO.cartPrice}</td>
		 		
		 					    
		 					</tr>
		 			        </c:forEach>
		 				
		 				</table>
		 				
		 				<div class="title2">
		 			    		취소내역
		 			    </div>
		 		
		 		        
		 		
		 				<table class="tab">
		 					<tr>
		 						<th>취소상태</th>
		 						<th>주문번호/옵션번호</th>
		 						<th>취소날짜</th> 
		 						<th>취소금액</th>
		 					    <th>취소상품</th>
		 					    <th>취소수량</th>
		 					    <th>취소요청자</th>
		 					    <th>취소사유</th>
		 					    <th>결제수단</th>
		 					</tr>
		 				 <c:forEach items="${ar}" var="cartVO">
			 					<c:if test="${cartVO.validity==11 || cartVO.validity==12}">
									 						                  
				 					<tr>
				 						<td>${cartVO.validity}</td>
				 					    <td>
				 					    	  <!-- Button trigger modal -->
										<button type="button" class="btn-orderDetail orderDetail" title="${cartVO.cartNum}" data-toggle="modal" data-target="#orderDetail">
										  ${cartVO.ordersVO.orderNum} / ${cartVO.cartNum}
										</button>
				 					    </td>
				 						<td>${cartVO.updateDay}</td> 
				 						<td>${cartVO.cartPrice}</td>
				 					    <td>${cartVO.productVO.productName}</td>
				 					    <td>${cartVO.amount}</td>
				 					    <td>${cartVO.ordersVO.name}</td>
				 					    <td>${cartVO.cancel}</td>
				 					    <td>${cartVO.ordersVO.paymentType}</td>
				 					</tr>
			 				
			 				     </c:if> 
		 				    </c:forEach>
		 				</table>
		 				
		 				<div class="title2">
		 			      교환관리
		 			    </div>
		 			  
		 				<table class="tab">
		 					<tr>
		 						<th>교환상태</th>
		 						<th>주문번호/옵션번호</th>
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
		 					<c:forEach items="${ar}" var="cartVO">
			 					<c:if test="${cartVO.validity==13 || cartVO.validity==14|| cartVO.validity==15}">			                  
				 					<tr>
				 						<td>${cartVO.validity}</td>
				 						<td>
				 					    	  <!-- Button trigger modal -->
										<button type="button" class="btn-orderDetail orderDetail" title="${cartVO.cartNum}" data-toggle="modal" data-target="#orderDetail">
										  ${cartVO.ordersVO.orderNum} / ${cartVO.cartNum}
										</button>
				 					    </td>
				 						<td>${cartVO.ordersVO.name}</td>
				 						<td>교환시점</td> 
				 						<td>교환비용</td>
				 					    <td>${cartVO.cancel}</td>
				 					    <td>회수수단</td>
				 					    <td>재배송 수단</td>
				 					    <td>운송장(재배송)</td>
				 					    <td>${cartVO.ordersVO.name}</td>
				 					    <td>${cartVO.updateDate}</td>
				 					</tr>
		 					   </c:if>
		 					</c:forEach>
		 					
		 				
		 				
		 				</table>

                       <div class="title2">
		 			       반품관리
		 			    </div>
		 				<table class="tab">
		 					<tr>
		 						<th>반품상태</th>
		 						<th>주문번호/옵션번호</th>
		 						<th>주문자명</th>
		 					    <th>환불예정액</th>
		 					    <th>반품사유</th>
		 					    <th>잔여상품</th>
		 					    <th>회수 수단</th>
		 					    <th>반품요청자</th>
		 					    <th>반품 접수일</th>
		 					</tr>
		 					
		 					<c:forEach items="${ar}" var="cartVO">
			 					<c:if test="${cartVO.validity==8 || cartVO.validity==9|| cartVO.validity==10}">			                  
				 					<tr>
				 						<td>${cartVO.validity}</td>
				 						<td>
				 					    	  <!-- Button trigger modal -->
										<button type="button" class="btn-orderDetail orderDetail" title="${cartVO.cartNum}" data-toggle="modal" data-target="#orderDetail">
										  ${cartVO.ordersVO.orderNum} / ${cartVO.cartNum}
										</button>
				 					    </td>
				 						<td>${cartVO.ordersVO.name}</td>
				 						<td>${cartVO.cartPrice}</td>
				 					    <td>${cartVO.cancel}</td>
				 					    <td>잔여상품</td>
				 					    <td>회수 수단</td>
				 					    <td>${cartVO.ordersVO.name}</td>
				 					    <td>${cartVO.updateDate}</td>
				 					</tr>
		 					   </c:if>
		 					</c:forEach>
		 				
		 				
		 				</table>
 			
 			
 			
 				</div> <!-- filter-table end -->