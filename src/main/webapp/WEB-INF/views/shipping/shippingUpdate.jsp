<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

      <form id="shipFrm1" action="../shipping/shippingInsert" method="post">
      <div class="modal-body shipInsertBody">
     	 
     	 
     	 <div class="form-group">
				<input type="hidden" id="username" name="username" value="${ordersVO.username}">
		</div>
     	 	  <div class="form-group row shipInsert">
			    <label for="shipTitle" class="col-sm-3 col-form-label">배송지명</label>
			    <div class="col-sm-9">
			      <input type="text" name="shipTitle" class="form-control" id="shipTitle" value="${shipVO.shipTitle}">
			    </div>
			  </div>
			  <div class="form-group row shipInsert">
			    <label for="shipName" class="col-sm-3 col-form-label">받는 사람</label>
			    <div class="col-sm-9">
			      <input type="text" name="shipName" class="form-control" id="shipName" value="${shipVO.shipName}">
			    </div>
			  </div>
			  <div class="form-group row shipInsert">
			    <label for="inputPassword" class="col-sm-3 col-form-label">연락처</label>
			    <div class="col-sm-9">
			      <input type="text" name="shipPhone" class="form-control" id="shipPhone" value="${shipVO.shipPhone}">
			    </div>
			  </div>
			  <div class="form-group row shipInsert">
			    <label for="inputPassword" class="col-sm-3 col-form-label"> 주소 </label>
			    <div class="col-sm-9 row">
			    
			    
                     <div class="col-sm-6">
			    	<input type="text" id="sample6_postcode" placeholder="우편번호" name="postcode" class="form-control" value="${shipVO.postcode}" style="font-size:16px; display:inline-block; margin-bottom:10px;" >
			    	  </div>
			    	  <div class="col-sm-6">
			    	  
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="form-control btn btn-outline-secondary" style="font-size:16px; display:inline-block; margin-bottom:10px;">
			            </div>
			    </div>
			    <label for="inputPassword" class="col-sm-3 col-form-label"> </label>
			    <div class="col-sm-9">
			  
					<input type="text" id="sample6_address" placeholder="주소" name="shipAddress" value="${shipVO.shipAddress}"class="form-control" style="font-size:16px; margin-bottom:10px;">
					<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="shipDetailAddress" value="${shipVO.shipDetailAddress}"class="form-control" style="font-size:16px; margin-bottom:10px;">
				
					
					<div class="form-check">
						<label class="form-check-label"> 
						<input type="checkbox" class="form-check-input" name="isDefault" id="isDefault" value="${shipVO.shipTitle}" style="margin-bottom: 100px">기본 배송지로 등록
						</label>
					</div>
					
					
			    </div>
			  </div>
            
		 
           
			
        
      </div>
      <div class="modal-footer">
                <button type="button" id="shipInsertBtn" class="btn btn-default btn-lg btn-block" style="font-size:24px;">저장</button>
        
      </div>
       </form>
      
 