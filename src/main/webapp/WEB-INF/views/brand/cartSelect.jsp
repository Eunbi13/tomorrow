<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
     <table class="grayLine "> 
			           <ul>
			           <tr> 
			           		<td class="padding"> <li> 전체상태: 
			           		
			           			    <c:if test="${cartVO.validity==2}">
		                             	결제완료 
			                         </c:if> 
			                         <c:if test="${cartVO.validity==3}">
		                             	배송준비 
			                         </c:if> 
			                         <c:if test="${cartVO.validity==4}">
		                             	배송중
			                         </c:if> 
			                         <c:if test="${cartVO.validity==5}">
		                             	배송완료 
			                         </c:if> 
			                          <c:if test="${cartVO.validity==6}">
		                             	구매확정 
			                         </c:if> 
			                         <c:if test="${cartVO.validity==7}">
		                             	리뷰작성 
			                         </c:if> 
			                         <c:if test="${cartVO.validity==8}">
		                             	환불요청 
			                         </c:if> 
			                         <c:if test="${cartVO.validity==9}">
		                             	환불진행중 
			                         </c:if> 
			                         <c:if test="${cartVO.validity==10}">
		                             	환불완료 
			                         </c:if> 
			                         <c:if test="${cartVO.validity==11}">
		                             	취소요청 
			                         </c:if> 
			                          <c:if test="${cartVO.validity==12}">
		                             	취소완료 
			                         </c:if> 
			                         <c:if test="${cartVO.validity==13}">
		                             	교환요청 
			                         </c:if> 
			                          <c:if test="${cartVO.validity==14}">
		                             	교환진행중 
			                         </c:if> 
			                          <c:if test="${cartVO.validity==15}">
		                             	교환완료 
			                         </c:if> 
								 						                        
			           		
			           		 </li> </td>
			           		<td class="padding"> <li> 주문번호/옵션번호:  ${cartVO.validity}  / ${cartVO.validity}</li>  </td>
			           </tr>
			            <tr> 
			           		<td class="padding">  <li> 주문일시: ${cartVO.ordersVO.orderDay}</li> </td>
			           		<td>
			           		 <c:if test="${cartVO.validity>7}">
                               <li>
				           		 취소/교환/반품 사유:
				           		( ${cartVO.cancel} ) ${cartVO.cancelMemo}
			           		   </li>
			           		 </c:if>
			           		
			           		
			           		</td>
			           </tr>  
			          
			           
			           </ul>
			           
			        </table>
			        
			       
			        
				       <div style="margin-bottom:0px; border: 1px solid #FFF;">
							<div style="float:left; margin: 40px 0px 40px 20px;">
						       	 <div class="modalTitle"> 주문 상품 </div>
						    </div>
					       	 <div class="detailSelect" style="float:right; margin: 45px 20px 40px 0px;">
					        		<a class="detailSelect" > </a>
					         </div>
					     </div>
					             <hr style="margin-top:75px;">
			        <table class="padding2"> 
			           <tr class="padding2-top"> 
			           		<th>상품번호</th>
			           		<th>상품이름</th>
			           		<th>주문옵션</th>
			           		<th>주문수량</th>
			           		<th>주문금액</th>
			           		<th>현재상태</th>
			           		
			           	
			           </tr>
			           <tr class="padding2-bottom"> 
			           		<td class="td-right">${cartVO.productVO.productNum}</td>
			           		<td class="td-right">${cartVO.productVO.productName}</td>
			           		<td class="td-right">${cartVO.unitName}</td>
			           		<td class="td-right">${cartVO.amount}</td>
			           		<td class="td-right">${cartVO.cartPrice}</td>
			           		<td >${cartVO.validity}</td>

			           </tr>
			           
			           
			        </table>
			        
			        
			      
			        	<div style="margin-bottom:px; border-bottom: 1px solid #FFF;">
							<div style="float:left; margin: 40px 0px 40px 20px;">
						       	   <div class="modalTitle"> 배송지 </div>
						    </div>
					       	 <div class="detailSelect" style="float:right; margin: 45px 20px 40px 0px;">
					        		<a class="detailSelect" >배송수단: 택배 </a>
					         </div>
					     </div>
					             <hr style="margin-top:75px;">
					             
			        <table class="tab-up"> 
			           <tr class="tr-bottom tr-first"> 
			           		<td class="subTitle">수령자명</td>
			           		<td class="subContent">${cartVO.ordersVO.shipName}</td>
			           </tr>
			            <tr class="tr-bottom"> 
			           		<td class="subTitle">휴대폰</td>
			           		<td class="subContent">${cartVO.ordersVO.shipPhone}</td>
			           </tr>
			           <tr class="tr-bottom"> 
			           		<td class="subTitle">배송지</td>
			           		<td class="subContent">(${cartVO.ordersVO.postcode}) ${cartVO.ordersVO.shipAddress} </td>
			           </tr>
			           <tr class="tr-bottom"> 
			           		<td class="subTitle">배송메시지</td>
			           		<td class="subContent">${cartVO.ordersVO.shippingMemo}</td>
			           </tr>
			           
			        </table>
			        
			        <c:if test="${cartVO.validity==2 || cartVO.validity==3|| cartVO.validity==4||cartVO.validity==5 || cartVO.validity==3|| cartVO.validity==4}">
			        		  <form id="updateFrm" action="./validShipUpdate" method="post">
			           <input type="hidden" name="cartNum" value="${cartVO.cartNum}">
				        <table class="orderStatus"> 
				           <tr > 
				           		<td class="padding4" style="border-right: gray 1px solid;">주문상태변경</td>
				           		 <td  class="padding4">
				           			<div class="form-check form-check-inline btn-sel">
									  <input class="form-check-input" type="radio" name="validity" id="validity3" value="3">
									  <label class="form-check-label" for="inlineRadio1">
									      배송준비(접수완료) <!-- 누르면 validity=2 에서 3으로 변함! -->
									   </label>
									</div>
									<div class="form-check form-check-inline btn-sel">
									  <input class="form-check-input" type="radio" name="validity" id="validity4" value="4">
									  <label class="form-check-label" for="inlineRadio2">
									  		 배송중(출고완료)    <!-- 누르면 택배사, 운송장번호를 입력해야하고 완료하면 validity=4 에서 4로 변함! -->
									  </label>
									</div>
									<div class="form-check form-check-inline btn-sel">
									  <input class="form-check-input" type="radio" name="validity" id="validity5" value="5">
									  <label class="form-check-label" for="inlineRadio3">
									   배송완료  <!-- 보통 배송api를 통새 주문상태가 변경, 직접 변경가능 -->
									  </label>
									</div>
									<div class="form-check form-check-inline btn-sel">
									  <input class="form-check-input" type="radio" name="validity" id="validity6" value="6">
									  <label class="form-check-label" for="inlineRadio4">
									  		 구매확정  <!-- 보통 회원이 변경, 직접 변경가능, 배송완료 후 일주일 후 자동 변경기능 만들 예정 ->정산확정금액에 포함됨 -->
									  </label>
									</div>
				           		
				           		
				           		</td>
				           </tr>
			            
			           
			        </table>
			        
			        </c:if>
			        
			        <c:if test="${cartVO.validity==11 || cartVO.validity==12}">
			        		  <form id="updateFrm" action="./validShipUpdate" method="post">
			           <input type="hidden" name="cartNum" value="${cartVO.cartNum}">
				        <table class="orderStatus"> 
				           <tr > 
				           		<td class="padding4" style="border-right: gray 1px solid;">주문상태변경</td>
				           		 <td  class="padding4">
				           			<div class="form-check form-check-inline btn-sel">
									  <input class="form-check-input" type="radio" name="validity" id="validity12" value="12">
									  <label class="form-check-label" for="inlineRadio12">
									       취소완료<!-- 누르면 validity=2 에서 3으로 변함! -->
									   </label>
									</div>
									
				           		
				           		
				           		</td>
				           </tr>
			            
			           
			          </table>
			        
			        </c:if>
			        
			        <c:if test="${cartVO.validity==13 || cartVO.validity==14|| cartVO.validity==15}">
			        		  <form id="updateFrm" action="./validShipUpdate" method="post">
			           <input type="hidden" name="cartNum" value="${cartVO.cartNum}">
				        <table class="orderStatus"> 
				           <tr > 
				           		<td class="padding4" style="border-right: gray 1px solid;">주문상태변경</td>
				           		 <td  class="padding4">
				           			<div class="form-check form-check-inline btn-sel">
									  <input class="form-check-input" type="radio" name="validity" id="validity14" value="14">
									  <label class="form-check-label" for="inlineRadio14">
									       교환진행중<!-- 누르면 validity=2 에서 3으로 변함! -->
									   </label>
									</div>
									<div class="form-check form-check-inline btn-sel">
									  <input class="form-check-input" type="radio" name="validity" id="validity15" value="15">
									  <label class="form-check-label" for="inlineRadio15">
									       교환완료<!-- 누르면 validity=2 에서 3으로 변함! -->
									   </label>
									</div>
									
				           		
				           		
				           		</td>
				           </tr>
			            
			           
			          </table>
			        
			        </c:if>
			        
			        <c:if test="${cartVO.validity==8 || cartVO.validity==9|| cartVO.validity==10}">
			        		  <form id="updateFrm" action="./validShipUpdate" method="post">
			           <input type="hidden" name="cartNum" value="${cartVO.cartNum}">
				        <table class="orderStatus"> 
				           <tr > 
				           		<td class="padding4" style="border-right: gray 1px solid;">주문상태변경</td>
				           		 <td  class="padding4">
				           			<div class="form-check form-check-inline btn-sel">
									  <input class="form-check-input" type="radio" name="validity" id="validity9" value="9">
									  <label class="form-check-label" for="inlineRadio9">
									       환불진행중<!-- 누르면 validity=2 에서 3으로 변함! -->
									   </label>
									</div>
									<div class="form-check form-check-inline btn-sel">
									  <input class="form-check-input" type="radio" name="validity" id="validity10" value="10">
									  <label class="form-check-label" for="inlineRadio10">
									       환불완료<!-- 누르면 validity=2 에서 3으로 변함! -->
									   </label>
									</div>
									
				           		
				           		
				           		</td>
				           </tr>
			            
			           
			          </table>
			        
			        </c:if>
			         
			      
			        
			        
			        <c:if test="${cartVO.carrierId eq null}">
					        <div style="margin-bottom:0px; border: 1px solid #FFF;">
									<div style="float:left; margin: 40px 0px 40px 20px;">
								       	   <div class="modalTitle"> 배송 정보 </div>
								    </div>
							       	 <div class="detailSelect" style="float:right; margin: 45px 20px 40px 0px;">
							        		<a class="detailSelect" > 실배송비는 주문자에게 노출되지 않습니다.  </a>
							         </div>
							     </div>
							             <hr style="margin-top:75px;">
					        <table class=""> 
					           <tr class="tr-bottom tr-first"> 
					           		<td class="subTitle">배송 수단</td>
					           		<td class="subContent">택배 조건부 무료(선불) </td>
					           </tr>
					            <tr class="tr-bottom"> 
					           		<td class="subTitle">배송비 결제</td>
					           		<td class="subContent">${cartVO.brandShipping}원</td>
					           </tr>
					           <tr class="tr-bottom"> 
					           		<td class="subTitle">택배사</td>
					           		<td class="subContent"> 
					           			<select name="carrierId" id="carrierId">
					           			       <option selected disabled>선택하세요</option>
					           			       <option value="kr.epost">우체국 택배</option>
						           			   <option value="kr.cjlogistics">CJ대한통운</option>
						           			   <option value="kr.cupost">CU 편의점택배</option>
						           			   <option value="kr.hanjin">한진택배</option>
						           			   <option value="kr.kdexp">경동택배</option>
						           			   <option value="kr.logen">로젠택배</option>
						           			   <option value="kr.lotte">롯데택배</option>
						           			   <option value="kr.ilyanglogis">일양로지스</option>
						           			   <option value="de.dhl">DHL</option>
						           			   <option value="us.fedex">Fedex</option>
						           			   <option value="un.upu.ems">EMS</option>
					           			</select>
					           		</td>
					           </tr>
					           <tr class="tr-bottom"> 
					           		<td class="subTitle">운송장 번호</td>
					           		<td class="subContent"> <input type="text" name="trackId" id="trackId"> </td>
					           </tr>
					            
					           
					        </table>
			        </c:if>	
			        <c:if test="${cartVO.carrierId ne null && cartVO.trackId ne null &&  cartVO.trackId ne'' &&  carrierId ne''}">
			        		<div style="margin-bottom:0px; border: 1px solid #FFF;">
							<div style="float:left; margin: 40px 0px 40px 20px;">
						       	   <div class="modalTitle"> 배송 정보 </div>
						    </div>
					       	 <div class="detailSelect" style="float:right; margin: 45px 20px 40px 0px;">
					        		<a class="detailSelect" > 실배송비는 주문자에게 노출되지 않습니다.  </a>
					         </div>
					     </div>
					             <hr style="margin-top:75px;">
			        <table class=""> 
			           <tr class="tr-bottom tr-first"> 
			           		<td class="subTitle">배송 수단</td>
			           		<td class="subContent">택배 조건부 무료(선불) </td>
			           </tr>
			            <tr class="tr-bottom"> 
			           		<td class="subTitle">배송비 결제</td>
			           		<td class="subContent">${cartVO.brandShipping}원</td>
			           </tr>
			           <tr class="tr-bottom"> 
			           		<td class="subTitle">택배사</td>
			           		<td class="subContent"> 
			           			<input readonly type="text"  value="${cartVO.carrierId}" id="trackId">
			           		</td>
			           </tr>
			           <tr class="tr-bottom"> 
			           		<td class="subTitle">운송장 번호</td>
			           		<td class="subContent"> <input readonly type="text" value="${cartVO.trackId}" id="trackId"> </td>
			           </tr>
			           
			 
			           <tr class="tr-bottom"> 
			           		<td class="subTitle">배송추적</td>
			           		<td class="subContent">	  <button  type="button" class="btn btn-orders" id="delivery" onclick="delivery_tracking('https://tracker.delivery/#/${cartVO.carrierId}/${cartVO.trackId}');"> 배송추적</button></td>
			           </tr>
			            
			           
			        </table>
			        
			        </c:if>
			                      </form>	
			    	      
			        
			        
  
<script type="text/javascript">


 //delivery_tracking pop up 띄우기

	function delivery_tracking(link01){
		
		window.open(link01,"_blank","width=500, height=740;");
	}
 </script>			        
			   
		       	   