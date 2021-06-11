<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html>
<html>
<head>
<!-- shipping  
<script src="./jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
shipping  -->
<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<title>Insert title here</title>
<style type="text/css">
.card-header{
padding-left: 15px;
padding-top: 7px;
padding-bottom: 7px;
border-bottom: 0px;
}

.card{
 margin-bottom:20px;
}

.list-group-item{
 border: 0px ;

 border-top: 1px solid LightGray;
 padding-bottom:20px;
}

.list-group{
weight: 100%;
}
.gray{ 
   color:gray;
   font-size: 14px;
  /*   padding-bottom: 20px; */

}

.product-img{

    width: 64px;
	height: 64px;
}

.row3{ 
/*  height:10px;
 line-height:10px; */
 
}
/* .row2{
 font-size:16px;
 line-height:1;

} */
.middle{
 /*  display: block; */
  
/*   vertical-align:  middle; */

}

.form-cus{
height: 40px;

}

.ordersSub{
  font-size:20px;
  font-weight: bold;
}
body{
   font-size:16px;
}

.ship-change{
color: #A63F82;


}
.ship-change:hover, .ship-change:focus, .ship-change:active{
color: #732944;
text-decoration: none;
}



.btn-default{
 
background-color: #A63F82;
 
color:#FFF;
 
border-color: #A63F82;
 
}
 
.btn-default:hover, .btn-default:focus, .btn-default:active, .btn-default.active, .open .dropdown-toggle.btn-default {
 
 
background-color: #732944;
 
color:#FFF;
 
border-color: #732944;
 
}
.shipInsertBody{
 height: 550px;
}

.shipInsert{
	font-size:16px;
}

.modal-scroll-panel {


    overflow-y: scroll !important;

}
.modal-content {
  height: 750px !important;
  

}
.modal{

    position: fixed;
    max-height: 850px;
	height: 850px;
}
.ship-change{
  font-size: 20px;
  text-decoration: none; 

}

table{
    margin-left:auto; 
    margin-right:auto;
    border-collapse: separate;
}

td{
    border-collapse: separate;
    border: 0.5px solid Gainsboro;
    border-radius: 5%;
    padding: 10px 10px 0px 10px;
    font-size:14px;
   
    width:85px;
    max-width: 85px;

}


.card_pay{
	 text-align: center;
}
p{
	 text-align: center;
}

.card-img-top{
    padding: -30px;
    align: center;
    width: 50px;
    height: 35px;
    object-fit: cover;
  
}
section{
	margin-top: 30px;
}
._2w0fH {
    text-align: center;
    width: 72px;
    padding: 3px 8px;
    box-sizing: border-box;
    border: 1px solid #A63F82;
    border-radius: 100px;
    font-size: 12px;
    font-weight: bold;
    line-height: 14px;
    color: #A63F82; 
    margin-left: 8px;
    user-select: none;
}

._3Bt8k ._3K8Q8 {
    padding-right: 30px;
}
._1qwAY {
    padding: 8px 15px 9px;
}

._3ASDR {
    display: inline-block;
    width: 100%;
    background-color: rgb(255, 255, 255);
    color: rgb(0, 0, 0);
    box-sizing: border-box;
    font-family: "Noto Sans KR", "Noto Sans CJK KR", "맑은 고딕", "Malgun Gothic", sans-serif;
    font-size: 15px;
    line-height: 21px;
    resize: none;
    appearance: none;
    margin: 0px;
    padding: 8px 15px 9px;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(219, 219, 219);
    border-image: initial;
    border-radius: 4px;
    transition: border-color 0.1s ease 0s, background-color 0.1s ease 0s;
}



.pay{
margin-top: 20px;
}
.green {
    color: #A63F82;
    font-weight: 680;
}

@media(max-width:567px) {
    .mobile {
        padding-top: 40px
    }
}
</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<input type="hidden" id="ordersUsername" title="${ordersVO.username}">



<!-- 배송지 리스트 Modal -->
<div id="shippingListModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
       <div class="modal-title" style="font-size:24px; width:100%; margin:0 auto; font-weight:bold;">배송지 선택</div>
        <button type="button" class="close" data-dismiss="modal">&times;</button>

      </div>
      <div class="modal-body modal-scroll-panel ">
          <div id="shippingList">
              <div id="shippingListSize" title="${fn:length(shippingAr)}">
	            <c:forEach items="${shippingAr}" var="shipping" varStatus="status">
	           
	            
	        	<!-- shipping select -->
		          <div class="card" style="width: 100%; height:200px; margin-bottom: 10px; border: 1px solid LightGray; border-radius:10px;">
					  <div class="card-body ">
				         
					  
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
								 <button type="button" class="btn shipUpdateBtn" id="shipUpdateBtn${shipping.shipNum}" title="${shipping.shipNum}" data-toggle="modal" data-target="#shippingUpdateModal" style="font-size:14px; border: 1px solid LightGray">수정</button>
							 </div>
							 <div style="width:70px; height:50px;  float: right;">
							   <button type="button" class="btn btn-default shipSelect" style="font-size:14px;" title="${shipping.shipNum}" >선택</button>
							 </div>
						  
					  </div>
				  </div>
				  	<!-- shipping select  end -->
				  	
				  	</c:forEach>
				  </div>	
		 </div>
	
      </div>
      <div class="modal-footer">
        <button type="button" id="shippingAdd" class="btn  btn-toggle btn-default btn-lg btn-block" data-toggle="modal" data-target="#shippingInsertModal" style="font-size:24px;">배송지 추가</button>

      </div>
    </div>

  </div>
</div>

<!-- 배송지 리스트 Modal 끝 -->

<!-- 배송지 수정 Modal  -->
<div id="shippingUpdateModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <div class="modal-title" id="exampleModalLongTitle" style="font-size:24px; font-weight:bold;">배송지 수정</div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div id="shippingUp">
      <form id="shipFrm2" action="../shipping/shippingUpdate" method="post">
      <div class="modal-body shipInsertBody">
     	 
     	 
     	 <div class="form-group">
				<input type="hidden" id="username" name="username" value="${ordersVO.username}">
		       <input type="hidden" id="shipNum2" name="shipNum" value="${shipVO.shipNum}">
				
		</div>
     	 	  <div class="form-group row shipInsert">
			    <label for="shipTitle" class="col-sm-3 col-form-label">배송지명</label>
			    <div class="col-sm-9">
			      <input type="text" name="shipTitle" class="form-control" id="shipTitle2" value="${shipVO.shipTitle}">
			    </div>
			  </div>
			  <div class="form-group row shipInsert">
			    <label for="shipName" class="col-sm-3 col-form-label">받는 사람</label>
			    <div class="col-sm-9">
			      <input type="text" name="shipName" class="form-control" id="shipName2" value="${shipVO.shipName}">
			    </div>
			  </div>
			  <div class="form-group row shipInsert">
			    <label for="inputPassword" class="col-sm-3 col-form-label">연락처</label>
			    <div class="col-sm-9">
			      <input type="text" name="shipPhone" class="form-control" id="shipPhone2" value="${shipVO.shipPhone}">
			    </div>
			  </div>
			  <div class="form-group row shipInsert">
			    <label for="inputPassword" class="col-sm-3 col-form-label"> 주소 </label>
			    <div class="col-sm-9 row">
			    
			    
                     <div class="col-sm-6">
			    	<input type="text" id="sample6_postcode2" placeholder="우편번호" name="postcode" class="form-control" value="${shipVO.postcode}" style="font-size:16px; display:inline-block; margin-bottom:10px;" >
			    	  </div>
			    	  <div class="col-sm-6">
			    	  
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="form-control btn btn-outline-secondary" style="font-size:16px; display:inline-block; margin-bottom:10px;">
			            </div>
			    </div>
			    <label for="inputPassword" class="col-sm-3 col-form-label"> </label>
			    <div class="col-sm-9">
			  
					<input type="text" id="sample6_address2" placeholder="주소" name="shipAddress" value="${shipVO.shipAddress}"class="form-control" style="font-size:16px; margin-bottom:10px;">
					<input type="text" id="sample6_detailAddress2" placeholder="상세주소" name="shipDetailAddress" value="${shipVO.shipDetailAddress}"class="form-control" style="font-size:16px; margin-bottom:10px;">
				
					
					<div class="form-check">
						<label class="form-check-label"> 
						<input type="checkbox" class="form-check-input" name="isDefault" id="isDefault2" value="${shipVO.isDefault}" style="margin-bottom: 100px">기본 배송지로 등록
						</label>
					</div>
					
					
			    </div>
			  </div>
            
		 
           
			
        
      </div>
      <div class="modal-footer">
                <button type="button" id="updateSave" class="btn btn-default btn-lg btn-block" style="font-size:24px;">저장</button>
        
      </div>
       </form>
       </div>
      
    </div>
  </div>
</div>




<!-- 배송지 추가 Modal  -->
<div id="shippingInsertModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <div class="modal-title" id="exampleModalLongTitle" style="font-size:24px; font-weight:bold;">배송지 추가</div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="shipFrm1" action="../shipping/shippingInsert" method="post">
      <div class="modal-body shipInsertBody">
     	 
     	 
     	 <div class="form-group">
				<input type="hidden" id="username" name="username" value="${ordersVO.username}">
		</div>
     	 	  <div class="form-group row shipInsert">
			    <label for="shipTitle" class="col-sm-3 col-form-label">배송지명</label>
			    <div class="col-sm-9">
			      <input type="text" name="shipTitle" class="form-control" id="shipTitle" >
			    </div>
			  </div>
			  <div class="form-group row shipInsert">
			    <label for="shipName" class="col-sm-3 col-form-label">받는 사람</label>
			    <div class="col-sm-9">
			      <input type="text" name="shipName" class="form-control" id="shipName">
			    </div>
			  </div>
			  <div class="form-group row shipInsert">
			    <label for="inputPassword" class="col-sm-3 col-form-label">연락처</label>
			    <div class="col-sm-9">
			      <input type="text" name="shipPhone" class="form-control" id="shipPhone">
			    </div>
			  </div>
			  <div class="form-group row shipInsert">
			    <label for="inputPassword" class="col-sm-3 col-form-label"> 주소 </label>
			    <div class="col-sm-9 row">
			    
			    
                      <div class="col-sm-6">
			    	<input type="text" id="sample6_postcode" placeholder="우편번호" name="postcode" class="form-control" style="font-size:16px; display:inline-block; margin-bottom:10px;" >
			    	  </div>
			    	  <div class="col-sm-6">
			    	  
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="form-control btn btn-outline-secondary" style="font-size:16px; display:inline-block; margin-bottom:10px;">
			            </div>
			    </div>
			    <label for="inputPassword" class="col-sm-3 col-form-label"> </label>
			    <div class="col-sm-9">
			  
					<input type="text" id="sample6_address" placeholder="주소" name="shipAddress" class="form-control" style="font-size:16px; margin-bottom:10px;">
					<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="shipDetailAddress" class="form-control" style="font-size:16px; margin-bottom:10px;">
				
					
					<div class="form-check">
						<label class="form-check-label"> 
						<input type="checkbox" class="form-check-input" name="isDefault" id="isDefault"  style="margin-bottom: 100px">기본 배송지로 등록
						</label>
					</div>
					
					
			    </div>
			  </div>
            
		 
           
			
        
      </div>
      <div class="modal-footer">
                <button type="button" id="shipInsertBtn" class="btn btn-default btn-lg btn-block" style="font-size:24px;">저장</button>
        
      </div>
       </form>
      
    </div>
  </div>
</div>
<!-- 배송지 추가 Modal 끝 -->



<div class="container-fluid rounded bg-white">
    <div class="row d-flex justify-content-center pb-5">
        <div class="col-sm-5 col-md-6 ml-1">
            <div class="py-4 d-flex flex-row">
                <span class="fa fa-check-square-o"></span><b style="font-size:24px; font-weight: bolder;">주문/결제</b>  
            </div>
            
        <section class="_3oseG">
           <div class="d-flex">
                <div class="ordersSub">배송지</div>
                
         
               <c:if test="${!empty shippingAr}">
                
                <div class="ml-auto "><!-- Button trigger modal -->
				
				<!-- 배송지 리스트 button -->
                <a class="ship-change" data-toggle="modal" data-target="#shippingListModal">변경</a>
				</div>
                  <!-- Button trigger modal --> 
                </c:if>
                  
            </div>
            <hr>
            
	            <div class="d-flex pt-1">
	            <div class="bbqwt">
					<div class="checkout-container ">
		<!-- 가지고 있는 배송지가 없는 경우 입력창을 띄우고, 결제하기를 누를 때 ajax 를 이용해서 저장된다 -->
		<c:if test="${empty shippingAr}">
		       <form id="frm" action="./shippingInsert" method="post">
			      <div class="modal-body shipInsertBody">
			     	 
			     	 
			     	 <div class="form-group">
							<input type="hidden" id="username" name="username" value="id1">
					</div>
			     	 	  <div class="form-group row shipInsert">
						    <label for="shipTitle" class="col-sm-3 col-form-label">배송지명</label>
						    <div class="col-sm-9">
						      <input type="text" name="shipTitle" class="form-control" id="shipTitle" >
						    </div>
						  </div>
						  <div class="form-group row shipInsert">
						    <label for="shipName" class="col-sm-3 col-form-label">받는 사람</label>
						    <div class="col-sm-9">
						      <input type="text" name="shipName" class="form-control" id="shipName">
						    </div>
						  </div>
						  <div class="form-group row shipInsert">
						    <label for="inputPassword" class="col-sm-3 col-form-label">연락처</label>
						    <div class="col-sm-9">
						      <input type="text" name="shipPhone" class="form-control" id="shipPhone">
						    </div>
						  </div>
						  <div class="form-group row shipInsert">
						    <label for="inputPassword" class="col-sm-3 col-form-label"> 주소 </label>
						    <div class="col-sm-9 row">
						    
						    
			                      <div class="col-sm-6">
						    	<input type="text" id="sample7_postcode" placeholder="우편번호" name="shipAddress" class="sample6_postcode form-control" style="font-size:16px; display:inline-block; margin-bottom:10px;" >
						    	  </div>
						    	  <div class="col-sm-6">
						    	  
								<input type="button" onclick="sample7_execDaumPostcode()" value="우편번호 찾기" name="shipAddress" class="form-control btn btn-outline-secondary" style="font-size:16px; display:inline-block; margin-bottom:10px;">
						            </div>
						    </div>
						    <label for="inputPassword" class="col-sm-3 col-form-label"> </label>
						    <div class="col-sm-9">
						  
								<input type="text" id="sample7_address" placeholder="주소" name="shipAddress" class="sample6_address form-control" style="font-size:16px; margin-bottom:10px;">
								<input type="text" id="sample7_detailAddress" placeholder="상세주소" name="shipAddress" class="sample6_detailAddress form-control" style="font-size:16px; margin-bottom:10px;">
							
								
								<div class="form-check">
									<label class="form-check-label"> 
									<input type="checkbox" class="form-check-input" name="isDefault" value="1" style="margin-bottom: 100px">기본 배송지로 등록
									</label>
								</div>
								
								
						    </div>
						  </div>
			            
					 
			           
						
			        
			      </div>
			      
			       </form>
		</c:if>	
		<c:if test="${!empty shippingAr}">
		
				<div id="shippingSel">
								<div class="_2s2Nq">
								  <input type="hidden" id="shipNum" value="${shippingVO.shipNum}">
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
							<div id="shipNameNPhone" class="" style="font-size:15px; color:gray; padding-bottom:15px;">${shippingVO.shipName}  ${shippingVO.shipPhone}</div>
						</div>
				</div>		
		</c:if>	
	 
		
				
				<div class="css-nj6fnr-DeliveryRequestInput e84q8kd0">
					<div class="_3Bt8k">
						<select id="shippingMemo" class="_3ASDR _1qwAY _3K8Q8 shippingMemo">
							<option value="0">배송시 요청사항을 선택해주세요</option>
							<option value="1">부재시 문앞에 놓아주세요</option>
							<option value="2">배송전에 미리 연락주세요</option>
							<option value="3">부재시 경비실에 맡겨 주세요</option>
							<option value="4">부재시 전화주시거나 문자 남겨 주세요</option>
							<option value="5">직접입력</option>
						</select>
				  	<textarea style="overflow: hidden; overflow-wrap: break-word; width: 100%;  height: 56px; font-size:16px;" placeholder=" 배송 요청사항을 입력해주세요" maxlength="50" row="1" class="directInputBox"  id="directInputBox" name="shippingMemo"></textarea>
				  
				</div>
				</div>
				</div>
				</div>
				</div>
				
				
			</section>
				
				
            <section>
            <div class="d-flex">
                <div class="ordersSub">주문자</div>
                
            </div>
            <hr>
            
		  <form class="form" action="/action_page.php">
		      <div class="form-group row">
		    
			    <label class="control-label col-sm-2 middle" for="name">이름</label>
			    
			    <div class="col-sm-8">
			      <input type="text" class="form-control form-cus" id="name" name="name">
			    </div>
			  </div>
			  <div class="form-group row">
			  
			    <label class="control-label col-sm-2 middle" for="email">이메일</label>
			
			    <div class="col-sm-8">
			      <input type="email" class="form-control form-cus" id="email" name="email">
			    </div>
			  </div>
			  <div class="form-group row">
		       
			    <label class="control-label col-sm-2 middle" for="phone">휴대전화</label>
			  
			    <div class="col-sm-8">
			      <input type="text" class="form-control form-cus" id="phone" name="phone">
			    </div>
			  </div>
			  
			  <!-- 혹시 인증번호 발송 기능 사용하면 넣
			   <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			      <button type="submit" class="btn btn-default">Submit</button>
			    </div>
			  </div> -->
			</form>
			
			
			
            
            
            
            </section>
            
            
            
            
             <section>
             <div class="d-flex">
                <div class="ordersSub">주문상품</div>
             
            </div>
            <hr>
            <c:forEach items="${brandAr}" var="brandVO">
	            <div class="card">
				  <div class="card-header">
				  <div class="d-flex">
	                <div class="p-1" style=" font-weight:600;">${brandVO.brandName}</div>
				  <div class="ml-auto p-1"> 무료배송 </div>
				 
				  </div>
				  </div>
				          <ul class="list-group list-group-flush">
						 
						  
						  	  <c:forEach items="${productAr}" var="productVO" varStatus="p">
			  	                 <c:if test="${brandVO.brandNum eq productVO.brandNum}">  
			  	                     <c:forEach items="${cartAr}" var="cartVO" varStatus="i">
					                   <c:if test="${productVO.productNum eq cartVO.productNum}"> 
					                       <c:forEach items="${cartVO.optionList}" var="optionList">
								               <div id="products${productVO.productNum}">
													  <li class="list-group-item">
													    <div class="media">
													      <img src="../resources/images/glove.webp" class="mr-3 product-img" alt="...">
													      <div class="media-body">
													          <div class="mt-0 mb-0 productName">${productVO.productName}</div>
													           <div class="gray"> ${optionList.optionName}</div>
													           <div style="float:left; font-size:14px; font-weight:bold;"> ${cartVO.cartPrice}원 &nbsp; </div> <div class="gray" style="float:left;">| &nbsp; ${cartVO.amount}개</div>
													      </div>
													     </div>
														</li>
														 
													 </div>
														   
													  <!-- product end -->
											
								          </c:forEach>
							            </c:if>
							          </c:forEach>
							        </c:if>
			             	    </c:forEach>
							    
							 </ul>
						    
					
				      
				  
				  
				  
				</div>
			</c:forEach>
            
            
            </section>
            
            
            
            
            <section>
             <div class="d-flex">
                <div class="ordersSub">결제수단</div>
            </div>
            
            <hr>
       
          <div class="">
            <table>
			       <td>
				    
				       <p><img class="card-img-top" src="/images/oPic/img_card.png" alt="Card image cap"></p>
				       <p>카드</p>
			       </td> 
		
			       <td>
			        <p> <img class="card-img-top" src="/images/oPic/img_kakaopay.webp" alt="Card image cap"></p>
			        <p>카카오페이</p>
			      </td>
			      
			       <td>
			        <p> <img class="card-img-top" src="/images/oPic/img_naver.webp" alt="Card image cap"></p>
			        <p>네이버페이</p>
			      </td>
			       <td>
			        <p> <img class="card-img-top" src="/images/oPic/img_chai.webp" alt="Card image cap"></p>
			        <p>차이</p>
			      </td>
			       <td>
			        <p> <img class="card-img-top" src="/images/oPic/img_payco.webp" alt="Card image cap"></p>
			        <p>페이코</p>
			      </td>
			       <td>
			        <p> <img class="card-img-top" src="/images/oPic/img_toss.webp" alt="Card image cap"></p>
			        <p>토스</p>
			      </td>
	        </table>
	       </div>
	       
				
            </section>
          
             <!--부트스트랩  -->
            <!-- <div class="pt-2">
                <div class="d-flex">
                    <div>
                        <p><b>Patient Balance.</b><span class="green">$13.24</span></p>
                    </div>
                    <div class="ml-auto p-2">
                        <p class="text-primary"><i class="fa fa-plus-circle text-primary"></i>Add payment card</p>
                    </div>
                </div>
                <p> This is an estimate for the portion of your order (not covered by insurance) due today . once insurance finalizes their review refunds and/or balances will reconcile automatically. </p>
                <form class="pb-3">
                    <div class="d-flex flex-row align-content-center">
                        <div class="pt-2 pr-2"><input type="radio" name="radio1" id="r1" checked></div>
                        <div class="rounded border d-flex w-100 px-2">
                            <div class="pt-2">
                                <p><i class="fa fa-cc-visa text-primary pr-2"></i>Visa Debit Card</p>
                            </div>
                            <div class="ml-auto pt-2">************3456</div>
                        </div>
                    </div>
                </form>
                <form class="pb-3">
                    <div class="d-flex flex-row w-100">
                        <div class="pt-2 pr-2"><input type="radio" name="radio2" id="r2"></div>
                        <div class="rounded d-flex w-100 px-2">
                            <div class="pt-2">
                                <p><i class="fa fa-cc-mastercard pr-2"></i>Mastercard Office</p>
                            </div>
                            <div class="ml-auto pt-2">************1038</div>
                        </div>
                    </div>
                </form>
            </div> -->
        </div>
        
        
        <div class="col-sm-3 col-md-4 offset-md-1 mobile">
            <div class="py-4 d-flex justify-content-end">
              
            </div>
           
            <div class="bg-light rounded d-flex flex-column">
                <div class="p-2 ml-3">
                    <h6>결제금액</h6>
                </div>
                <div class="p-2 d-flex">
                    <div class="col-8">총 상품 금액</div>
                    <div class="ml-auto">${ordersVO.itemsPrice}원</div>
                </div>
                <div class="p-2 d-flex">
                    <div class="col-8">배송비</div>
                    <div class="ml-auto">${ordersVO.shippingFee}원</div>
                </div>
             
                <div class="border-top px-4 mx-3"> </div>
                
             
                <div class="border-top px-4 mx-3"></div>
                
                <div class="p-2 d-flex pt-3">
                    <div class="col-8"><b>최종 결제 금액</b></div>
                    <input type="hidden" id="orderNum" value="${ordersVO.orderNum}">
                    <div class="ml-auto" id="payment" title="${ordersVO.payment}"><b class="green"> ${ordersVO.payment}원</b></div>
                </div>
            </div>
            
            
                <div>    <input type="button" onclick="iamport()" value="${ordersVO.payment}원 결제하기" class="btn btn-default btn-block pay"> </div>
       
        </div>
    </div>
</div>
<c:import url="../template/footer.jsp"></c:import>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/js/shippingInsert.js"></script> 

<script type="text/javascript">


// shippingMemo : 직접입력 인풋박스 기존에는 숨어있다가

		
$("#directInputBox").hide();


$("#shippingMemo").change(function() {
              //직접입력을 선텍하면 나타남
		if($("#shippingMemo").val() == "5") {
			$("#directInputBox").show();
			
		}  else {
			$("#directInputBox").hide();
		}
});
 
 

/* $(function(){
	//shipping select는 이벤트락 없더라도 뿌려야한다. 
	getList(1)
	
	// shipping select를 가져오는 함수선언 - 호출을 해야 실행
    function getList(page){
		//기본페이지 처리
		if(!page) page =1;
		//데이터 수집
		let pageInfo = {};
		pageInfo.page = page;
		pageInfo.no = $("#no").text();
		//ajax 객체 호출 처리 -get 방식으로 처리할거라면  body에 안들어가고 url에 포함이..
		
	}
	
}) */
//shipping Update get!
$(document).on('click',".shipUpdateBtn", function(){

	console.log(" 수정 클릭");

	let shipNum = $(this).attr("title");
	console.log(shipNum);

		$.get("../shipping/shippingUpdate?shipNum="+shipNum, function(data){
			console.log(data)
			//받아온 정보를 shippingUp div 안에 넣기
			$("#shippingUp").html(data);
			// 수정 모달창 열기
			$("#shippingUpdateModal").modal();
			
		});

});
   
   
// shipping update post!
   $(document).on('click','#updateSave', function(){

   	let shipTitle= $("#shipTitle2").val();
   	let shipName= $("#shipName2").val();
   	let shipPhone= $("#shipPhone2").val();
   	let shipAddress= $("#sample6_address2").val();
   	let shipDetailAddress= $("#sample6_detailAddress2").val();
   	let postcode= $("#sample6_postcode2").val();
   	
   	let username= $("#ordersUsername").attr("title");
   	let shipNum =$("#shipNum2").val();

   	//checkbox 체크여부 받아오기
   	let isDefault= $("#isDefault2").prop("checked");
      console.log(isDefault);
      console.log("username:"+username);
    //isDefault true를 체크했다면, 다른 shipping의 Defalut를 false로 업데이트 해줘야함
	   if(isDefault){
			console.log("isDefault 수정 시도");
			   
			   $.ajax({
			      	type: "post",
			      	url: "../shipping/shippingDefaultUpdate",
			      	data:{
			    
			           username:username
			      	},
			      	success:function(data){
			   			console.log("디폴트 수정 시도!!");
			   			data= $.trim(data);
			   			console.log(data);
			   			
			   			if(data=='1'){
			   			    console.log("디폴트 수정 성공했습니다.");
							   }
			           	}
			    })
		   }
      
      $.ajax({
      	type: "post",
      	url: "../shipping/shippingUpdate",
      	data:{
      	   shipNum: shipNum,
      	   shipTitle: shipTitle,
           shipName: shipName,
           shipPhone: shipPhone, 
           shipAddress: shipAddress,
           shipDetailAddress:shipDetailAddress,
           postcode: postcode,
           isDefault: isDefault,
           username:username
      	},
      	success:function(data){
      		
   			console.log("수정시도!!");
   			data= $.trim(data);
   			console.log(data);
   			
   			if(data=='1'){
   			    console.log("배송지 수정 성공했습니다.");
   			    //update 성공후 update창 갱신 
   			    $("#shipTitle2").val('');
   				$("#shipName2").val('');
   				$("#shipPhone2").val('');
   				$("#sample6_address2").val('');
   				$("#sample6_detailAddress2").val('');
   			
   				$("#sample6_postcode2").val('');
   				$("#isDefault2").val('');
   				
   				// shipping list 갱신하기 
   			    username= $("#ordersUsername").attr("title");
   			     
   				 $.get("../shipping/shippingList?username="+username,function(data){
   						console.log(data)
   						$("#shippingList").empty();
   						$("#shippingList").html(data.trim());
   					
   					});
   				 
   				 $("#shippingUpdateModal").modal("hide"); //shipping Insert 모달 닫기 
   				
   				
   				
   				/* if(isDefault){
   					//default를 선택하면 다른 shippingVO의 default를 다 false로 만들어줘야한다
   					//ajax update 만들어서 넣어주시기
   					//ajax list만들어서 넣어주기
   				} */
   			}else{
   				alert("수정 실패했습니다.");
   			}
      		
         	}
         
       })
       
       

   	
     });
   	
   	
  


//shipping Delete!
$(document).on('click',".shipDelBtn", function(){

	console.log("삭제 클릭");

	let shipNum = $(this).attr("title");
	console.log(shipNum);
	let result =confirm("삭제하시겠습니까?");
	if(result){
		console.log("삭제 통과")
		$.get("../shipping/shippingDelete?shipNum="+shipNum, function(data){
			
			alert("배송지를 삭제하였습니다.");
			//getList
			let username= $("#ordersUsername").attr("title");
			console.log("username:"+ username);
			 $.get("../shipping/shippingList?username="+username,function(data){
					console.log(data)
					$("#shippingList").empty();
					$("#shippingList").html(data.trim());
				
				});
		   
			
		});
		
		

	}
	
	
});


//이미 배송지수가 5개라면 '배송지 5개 초과로 입력할 수 없습니다.'경고창띄우기
$("#shippingAdd").click(function(){
	
	let shippingLength=$("#shippingListSize").attr("title");
	if(shippingLength>4){
		alert("배송지는 5개까지 입력할 수 있습니다."
				+"다른 배송지를 입력하시려면 배송지 리스트안의 배송지를 삭제하시고 진행해주세요.")
		//배송지가 5개 이상일때 shipping insert창의 연결을 끊는다
		$(this).attr("data-target"," ");
			  
	
	} else{
		$(this).attr("data-target","#shippingInsertModal");
	}
	
});

// shipping Insert!
$(document).on('click',"#shipInsertBtn", function(){

	let shipTitle= $("#shipTitle").val();
	let shipName= $("#shipName").val();
	let shipPhone= $("#shipPhone").val();
	let shipAddress= $("#sample6_address").val();
	let shipDetailAddress= $("#sample6_detailAddress").val();
	let postcode= $("#sample6_postcode").val();
	
	let username= $("#ordersUsername").attr("title");

	//checkbox 체크여부 받아오기
	let isDefault= $("#isDefault").prop("checked");
     console.log(isDefault);
     console.log("username:"+username);
   //isDefault true를 체크했다면, 다른 shipping의 Defalut를 false로 업데이트 해줘야함
	   if(isDefault){
			console.log("isDefault 수정 시도");
			   
			   $.ajax({
			      	type: "post",
			      	url: "../shipping/shippingDefaultUpdate",
			      	data:{
			    
			           username:username
			      	},
			      	success:function(data){
			   			console.log("디폴트 수정 시도!!");
			   			data= $.trim(data);
			   			console.log(data);
			   			
			   			if(data=='1'){
			   			    console.log("디폴트 수정 성공했습니다.");
							   }
			           	}
			    })
		   }
		
   
   
   $.ajax({
   	type: "post",
   	url: "../shipping/shippingInsert",
   	data:{
   		shipTitle: shipTitle,
        shipName: shipName,
        shipPhone: shipPhone, 
        shipAddress: shipAddress,
        shipDetailAddress:shipDetailAddress,
        postcode: postcode,
        isDefault: isDefault,
        username:username
   	},
   	success:function(data){
   		
			console.log("시도!!");
			
			console.log("새로운isDefault!!"+isDefault);
			data= $.trim(data);
			console.log(data);
			
			if(data=='1'){
				console.log("배송지 입력 성공했습니다.");
				
				
				// shipping insert창 갱신
			    $("#shipTitle").val('');
				$("#shipName").val('');
				$("#shipPhone").val('');
				$("#sample6_address").val('');
				$("#sample6_detailAddress").val('');
			
				$("#sample6_postcode").val('');
				$("#isDefault").prop("checked", false);
					   
					      	
									
				// shipping list 갱신하기 
			    username= $("#ordersUsername").attr("title");
			     
				 $.get("../shipping/shippingList?username="+username,function(data){
						console.log(data)
						$("#shippingList").empty();
						$("#shippingList").html(data.trim());
					
					});
				 
				 $("#shippingInsertModal").modal("hide"); //shipping Insert 모달 닫기 
				
				
				
				/* if(isDefault){
					//default를 선택하면 다른 shippingVO의 default를 다 false로 만들어줘야한다
					//ajax update 만들어서 넣어주시기
					//ajax list만들어서 넣어주기
				} */
			}else{
				alert("등록 실패했습니다.");
			}
   		
      	}
   	
      
    })
    
    
     
    
    
    
    

	
  });
	
	
	


 
//shipping List

function getList(){
	let username= $("#ordersUsername").attr("title");
	
	 $.get("../shipping/shippingList?username="+username,function(data){
			console.log(data)
			$("#shippingList").empty();
			$("#shippingList").html(data.trim());
		
		});
	
	
	}
 

	
//shipping list에서 선택 버튼 누를시, 주문페이지에 나타는 배송지 정보가 변한다. 	
$(document).on('click', '.shipSelect', function(){
	let shipNum =$(this).attr("title");
	
    console.log(shipNum);
    
    
    
    $.get("../shipping/shippingSelect?shipNum="+shipNum,function(data){
		console.log(data)
		$("#shippingSel").empty();
		$("#shippingSel").html(data.trim());
		$('#shippingListModal').modal("hide"); //모달 닫기 
	});
    
});
	
	 //--------shippingSelect
function getSelect(){
    $.get("../shipping/shippingSelect?shipNum="+shipNum,function(data){
		console.log(data)
		$("#shippingSel").empty();
		$("#shippingSel").html(data.trim());
		
	});
 }

	
//shipping 삭제


	
	


</script>


<script type="text/javascript">

let payment = $("#payment").attr("title");
let email= $("#email").val();
let name=$("#name").val();
let phone=$("#phone").val();

let address=$("#shipAddress").html();
console.log(address);
let postcode=$("#shipPostcode").val();


function iamport(){
	//가맹점 식별코드
	IMP.init('imp63068221');
	IMP.request_pay({
	    pg : 'html5_inicis',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '내일의집', //결제창에서 보여질 이름
	    amount : 100, //실제 결제되는 가격
	    buyer_email : email,
	    buyer_name : name,
	    buyer_tel : phone,
	    buyer_addr : '서울 강남구 도곡동',
	    buyer_postcode : '12345'
	}, function(rsp) {
		console.log(rsp);
	    if ( rsp.success ) {
	    	var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        //결제 완료!
	        //이제 결제한 cartVO에  orderNum을 넣고  validity를 '결제완료'를 뜻하는 '2' 로 바꾼다. 성공!!!
	         //--------ajax DB Update 
					let orderNum = $("#orderNum").val();
					console.log("orderNum:"+orderNum);
					$.ajax({
						type: "post",
						url:"../cart/orderUpdate",
						data:{
							orderNum:orderNum
						},
						success:function(data){
							
							data = data.trim();
							console.log("../cart/orderUpdate 후 data"+data);
							if(data>0){
								alert('주문 성공');
								//orderVO update: shipNum, paymentType, shippingMemo,name,email, phone /  삭제예정: cartNum,status
						        //넘어온 cartVO의 orderNum에도 이 order넘버를 넣어준다!
						        
							                orderNum = $("#orderNum").val();
										    email= $("#email").val();
											name=$("#name").val();
										    phone=$("#phone").val();
											let paymentType = rsp.card_name;
											let shipNum=$("#shipNum").val();
											//shippingMemo는 선택된 selected된 값을 가져오고 그것이 5일 경우에는, 또 따로 받아온다.
											
											let shippingMemo=$("#shippingMemo option:selected").val();
											if(shippingMemo=5){
												shippingMemo= $("#directInputBox").val();
											}else{
												shippingMemo = $("#shippingMemo option:selected").text();
											}
											console.log("shippingMemo:"+shippingMemo);
											console.log("paymentType:"+paymentType);
											console.log("shipNum:"+shipNum);
											
											$.ajax({
												type: "post",
												url:"../orders/update",
												data:{
													 shipNum:shipNum, 
													 paymentType:paymentType, 
													 shippingMemo:shippingMemo,
													 name:name,
													 email:email, 
													 phone:phone,
													 orderNum: orderNum
												},
												success:function(data){
													console.log("data:"+data);
													data= $.trim(data);
													console.log("trim 이후 data"+data);
													
													if(data>0){
														alert('업데이트 성공');
														window.location.href = "./update";

														
													}else {
														alert('업데이트 실패');
													}
												}
											})
											
										
							}else {
								alert('주문 실패');
							}
						}
					})
	
	     
	        //그 이후로는 판매자가 validity를 바꿀수있다.배송완료, 취소등 상태에 따라  validity를 바꿔줘야한다.
	        //validity가 '2'로 바꾸는 순간, cartVO의 brandNum 대로,브랜드의 관리페이지에서 결제가 들어온 것을 확인가능하다.
	  
	        
	    } else {
	    	 var msg = '결제에 실패하였습니다.';
	         msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
}



</script>


</body>
</html>