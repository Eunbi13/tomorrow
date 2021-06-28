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
.brandN{
 font-weight:700;
 font-size: 16px;
}
.shipN{
 font-size: 16px;
}
.productN{
 font-size: 16px;
 color: black;
}

.productPic{
	width: 64px;
	height: 64px;
	margin-right:15px;
}
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

.grayN{
   color:gray;
   font-size: 14px;
}

.gray{ 
   color:gray;
   font-size: 14px;
   margin: 10px 0px;
  /*   padding-bottom: 20px; */

}

.grayMobile{

position:sticky;

}

.product-img{

    width: 64px;
	height: 64px;
}

.row3{ 
/*  height:10px;
 line-height:10px; */
 
}

.middle{
 font-size: 16px;
}

.form-cus{
height: 40px;

}

.ordersSub{
  font-size:20px;
  font-weight: bold;
  margin-top:40px;
}

.ordersSub2{
  font-size:20px;
  font-weight: bold;
}

.ordersSub3{
font-size:20px;
  font-weight: bold;
 margin-top:25px;
}

.ordersSub4{
font-size:18px;
 font-weight: bold;
margin-bottom:25px;
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
    margin-bottom:10px;
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

.shipNP{
float:left;
font-size:15px; 
color:gray; 
padding-bottom:15px;

margin-top:5px;
padding-top:5px;



height:25px; 
background-color:transparent;
border:0 solid black; 



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

#shipTitle{
margin-bottom:10px;
}
#shipAddress{
margin-bottom:6px;
}

.agree{
 background-color: 	hsl(0, 0%, 93%);
 border-bottom-left-radius: 5px;
border-bottom-right-radius: 5px;
}
.agree1{
  font-size: 16px;
  padding:2px 5px;
  width:100%;
}
.agree2{
font-size: 14px;
color:#999999;
 padding:0px 5px 5px 5px;
}

.agree4{
font-weight:lighter;
font-size: 14px;
color:#999999;

}
.agree5{
font-size: 12px;
font-weight:bold;
color:#999999;
padding-right:10px;

}

.agreeBtn{

border:0;
ouling:0;

}
.flex-column{
border: #d9d9d9 1px solid;

 background-color: 	hsl(0, 0%, 97%);


}

ul{
font-size:10px;
color:#999999;
padding-left:20px;
}

.agree-header{
 text-align:center;
 font-size:16px;
}
.agree-footer{
 text-align:center;
}

.agree-modal-dialog{
  width: 600px;
  height: 500px;
}


.agree-add{
font-size:14px;
margin-top:20px;
}

.modal-dialog.modal-fullsize {
  width: 600px;
  height: 500px;
  margin: 0;
  padding: 0;
}
.modal-content.modal-fullsize {
  height: auto;
  min-height: 100%;
  border-radius: 0; 
}
.agreeT{
width:600px;
height: 300px;
 }
 
 .agreeT th{
 text-align: center;
 background-color: #d9d9d9;
 font-size: 16px;
 border: 1px gray solid;
 height: 40px;
 }
 
 .agreeT td{
 
 font-size: 16px;
 border: 1px gray solid;
 border-radius: 0px;

 }
 
 .money{
  font-weight:800;
 }
 
 .card-body{
 
 padding-bottom:0px;
  }
  
 .shipBtn{
 margin-bottom:0px;
 }
.cardShip{
  padding-bottom:0px;
  width: 100%; 
  height:180px; 
   padding-bottom: -10px; 
   margin-bottom: 10px; 
   border: 1px solid LightGray; 
   border-radius:10px;
}
</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<main>

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
		 </div>
	
      </div>
      <div class="modal-footer">
        <button type="button" id="shippingAdd" class="btn  btn-toggle btn-default btn-lg btn-block" data-toggle="modal" data-target="#shippingInsertModal" style="font-size:24px;">배송지 추가</button>

      </div>
    </div>

  </div>
</div>

<!-- 배송지 리스트 Modal 끝 -->

<!-- 배송지 수정 Modal  6 2 -->
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
		       <input type="hidden" id="shipNum8" name="shipNum" value="${shipVO.shipNum}">
				
		</div>
     	 	  <div class="form-group row shipInsert">
			    <label for="shipTitle" class="col-sm-3 col-form-label">배송지명</label>
			    <div class="col-sm-9">
			      <input type="text" name="shipTitle" class="form-control" id="shipTitle8" value="${shipVO.shipTitle}">
			    </div>
			  </div>
			  <div class="form-group row shipInsert">
			    <label for="shipName" class="col-sm-3 col-form-label">받는 사람</label>
			    <div class="col-sm-9">
			      <input type="text" name="shipName" class="form-control" id="shipName8" value="${shipVO.shipName}">
			    </div>
			  </div>
			  <div class="form-group row shipInsert">
			    <label for="inputPassword" class="col-sm-3 col-form-label">연락처</label>
			    <div class="col-sm-9">
			      <input type="text" name="shipPhone" class="form-control" id="shipPhone8" value="${shipVO.shipPhone}">
			    </div>
			  </div>
			  <div class="form-group row shipInsert">
			    <label for="inputPassword" class="col-sm-3 col-form-label"> 주소 </label>
			    <div class="col-sm-9 row">
			    
			    
                     <div class="col-sm-6">
			    	<input type="text" readonly id="sample8_postcode" placeholder="우편번호" name="postcode" class="form-control" value="${shipVO.postcode}" style="font-size:16px; display:inline-block; margin-bottom:10px;" >
			    	  </div>
			    	  <div class="col-sm-6">
			    	  
					<input type="button" onclick="sample8_execDaumPostcode()" value="우편번호 찾기" class="form-control btn btn-outline-secondary" style="font-size:16px; display:inline-block; margin-bottom:10px;">
			            </div>
			    </div>
			    <label for="inputPassword" class="col-sm-3 col-form-label"> </label>
			    <div class="col-sm-9">
			  
					<input type="text" readonly id="sample8_address" placeholder="주소" name="shipAddress" value="${shipVO.shipAddress}"class="form-control" style="font-size:16px; margin-bottom:10px;">
					<input type="text" id="sample8_detailAddress" placeholder="상세주소" name="shipDetailAddress" value="${shipVO.shipDetailAddress}"class="form-control" style="font-size:16px; margin-bottom:10px;">
				
					
					<div class="form-check">
						<label class="form-check-label"> 
						<input type="checkbox" class="form-check-input" name="isDefault" id="isDefault8" value="${shipVO.isDefault}" style="margin-bottom: 100px">기본 배송지로 등록
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
			    	<input type="text" readonly id="sample6_postcode" placeholder="우편번호" name="postcode" class="form-control" style="font-size:16px; display:inline-block; margin-bottom:10px;" >
			    	  </div>
			    	  <div class="col-sm-6">
			    	  
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="form-control btn btn-outline-secondary" style="font-size:16px; display:inline-block; margin-bottom:10px;">
			            </div>
			    </div>
			    <label for="inputPassword" class="col-sm-3 col-form-label"> </label>
			    <div class="col-sm-9">
			  
					<input type="text" readonly id="sample6_address" placeholder="주소" name="shipAddress" class="form-control" style="font-size:16px; margin-bottom:10px;">
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
                <div class="ordersSub2">배송지</div>
                
         
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
		       <form id="shipFrm3" action="./shippingInsert" method="post">
			      <div class="modal-body shipInsertBody">
			         
			     	 
			     	 <div class="form-group">
					</div>
			     	 	  <div class="form-group row shipInsert">
						    <label for="shipTitle7" class="col-sm-3 col-form-label">배송지명</label>
						    <div class="col-sm-9">
						      <input type="text" name="shipTitle" class="form-control" id="shipTitle7" >
						    </div>
						  </div>
						  <div class="form-group row shipInsert">
						    <label for="shipName7" class="col-sm-3 col-form-label">받는 사람</label>
						    <div class="col-sm-9">
						      <input type="text" name="shipName" class="form-control" id="shipName7">
						    </div>
						  </div>
						  <div class="form-group row shipInsert">
						    <label for="shipPhone7" class="col-sm-3 col-form-label">연락처</label>
						    <div class="col-sm-9">
						      <input type="text" name="shipPhone" class="form-control" id="shipPhone7">
						    </div>
						  </div>
						  <div class="form-group row shipInsert">
						    <label for="inputPassword" class="col-sm-3 col-form-label"> 주소 </label>
						    <div class="col-sm-9 row">
						    
						    
			                      <div class="col-sm-6">
						    	<input type="text" readonly id="sample7_postcode" placeholder="우편번호" name="postcode" class="sample6_postcode form-control" style="font-size:16px; display:inline-block; margin-bottom:10px;" >
						    	  </div>
						    	  <div class="col-sm-6">
						    	  
								<input type="button" onclick="sample7_execDaumPostcode()" value="우편번호 찾기" class="form-control btn btn-outline-secondary" style="font-size:16px; display:inline-block; margin-bottom:10px;">
						            </div>
						    </div>
						    <label for="inputPassword" class="col-sm-3 col-form-label"> </label>
						    <div class="col-sm-9">
						  
								<input type="text" readonly id="sample7_address" placeholder="주소" name="shipAddress" class="sample6_address form-control" style="font-size:16px; margin-bottom:10px;">
								<input type="text" id="sample7_detailAddress" placeholder="상세주소" name="shipDetailAddress" class="sample6_detailAddress form-control" style="font-size:16px; margin-bottom:10px;">
							
								
								<div class="form-check">
									<label class="form-check-label"> 
									<input type="checkbox" class="form-check-input" name="isDefault" id="isDefault7" value="1" style="margin-bottom: 100px">기본 배송지로 등록
									</label>
								</div>
								
								
						    </div>
						  </div>
			            
					 <div id="shippingList2">
					 
					 </div>
			           
						
			        
			      </div>
			      
			       </form>
		</c:if>	
		<c:if test="${!empty shippingAr}">
		
				<div id="shippingSel">
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
							<input readonly="readonly" id="shipName5" class="shipNP" value="${shippingVO.shipName}" style="width:50px; max-width:70px; " > 
						    <input readonly="readonly" id="shipPhone5" class="shipNP" value="${shippingVO.shipPhone}" > 
						    
						</div>
				</div>		
		</c:if>	
	 
		
			
				<div class="css-nj6fnr-DeliveryRequestInput e84q8kd0">
					<div class="_3Bt8k">
						<select id="shippingMemo" class="_3ASDR _1qwAY _3K8Q8 shippingMemo" name="shippingMemo">
							<option value="0">배송시 요청사항을 선택해주세요</option>
							<option value="1">부재시 문앞에 놓아주세요</option>
							<option value="2">배송전에 미리 연락주세요</option>
							<option value="3">부재시 경비실에 맡겨 주세요</option>
							<option value="4">부재시 전화주시거나 문자 남겨 주세요</option>
							<option value="5">직접입력</option>
						</select>
				  	<textarea style="overflow: hidden; overflow-wrap: break-word; width: 100%;  height: 56px; font-size:16px;" placeholder=" 배송 요청사항을 입력해주세요" maxlength="50" row="1" class="directInputBox"  id="directInputBox" ></textarea>
				  
				</div>
				</div>
				</div>
				</div>
				</div>
				
				
			</section>
				
			 <form id="updateFrm" action="/orders/update" method="post">		
            <section>
            <div class="d-flex">
                <div class="ordersSub">주문자</div>
                
            </div>
            <hr>
            
		
		       <input type="hidden" name="orderNum" value="${ordersVO.orderNum}">
		                                          
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
		
			
            
            </section>
            	</form>
            
            
            
             <section>
             <div class="d-flex">
                <div class="ordersSub">주문상품</div>
             
            </div>
            <hr>
            <c:forEach items="${brandAr}" var="brandVO">
       
	            <div class="card">
				  <div class="card-header">
				  <div class="d-flex">
	                <div class="p-1 brandN">${brandVO.brandName}</div>
				  <div class="ml-auto p-1 shipN" id="brandShipping${brandVO.brandNum}"> 무료배송 </div>
				 
				  </div>
				  </div>
				          <ul class="list-group list-group-flush">
						 
						  
						  	  <c:forEach items="${productAr}" var="productVO" varStatus="p">
			  	                 <c:if test="${brandVO.brandNum eq productVO.brandNum}"> 
			  	                     
			  	                     <c:forEach items="${cartAr}" var="cartVO" varStatus="i">
					                   <c:if test="${productVO.productNum eq cartVO.productNum}"> 
					                        <input type="hidden" class="cartVOShipping" data-brandNum="${cartVO.brandNum}" value="${cartVO.brandShipping}">
					                        <input type="hidden" id="validity" class="validity" value="${cartVO.validity}">
								               <div id="products${productVO.productNum}">
													  <li class="list-group-item">
													    <div class="media">
													      <img class="productPic" alt="" src="/upload/productImages/${productVO.productPic}">
													      <div class="media-body">
													          <div class="mt-0 mb-0 productN">${productVO.productName}</div>
													           <div class="gray"> ${cartVO.unitName}</div>
													           <div style="float:left; font-size:14px; font-weight:bold; color: black;'"> ${cartVO.cartPrice}원 &nbsp; </div> <div class="grayN" style="float:left;">| &nbsp; ${cartVO.amount}개</div>
													      </div>
													     </div>
														</li>
														 
													 </div>
														   
													  <!-- product end -->
											
								       
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
            
       <!--  약관동의 The Modal -->
  <div class="modal fade" id="agreeModal">
    <div class="modal-dialog  "  style="max-width: 100%; width: auto; max-height: 100%; height: auto; display: table;">
      <div class="modal-content ">
      
        <!-- Modal Header -->
        <div class="modal-header agree-header" style="text-align:center;">
          <h4 class="agree-modal-title" style="text-align:center; font-size:20px;">개인정보 제 3자 제공</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body " >
          	<div style="text-align:center; vertical-align: center; padding-top:100px;">
	          	<table class="agreeT">
	          	 	<tr>
	          	 		<th class="agreeTd">제공 받는자</th>
	          	 		<th class="agreeTd">제공목적</th>
	          	 		<th class="agreeTd">항목</th>
	          	 		<th class="agreeTd">보유 및 이용기간</th>
	          	 	</tr>
	          	 	<tr>
	          	 		<td>주식회사 홈니즈</td>
	          	 		<td>상품 및 경품(서비스) 배송(전송), 제품 설치, 반품, 환불, 고객상담 등 정보통신서비스제공계약 및 전자상거래(통신판매)계약의 이행을 위해 필요한 업무의 처리</td>
	          	 		<td>1) 구매자정보(닉네임, 이름, 휴대폰번호, 이메일주소)
							2) 수령인정보(이름, 휴대폰번호, 주소)
							3) 상품 구매, 취소, 반품, 교환정보
							4) 송장정보
							5) 개인통관고유부호 (해외배송상품 구매시)
						</td>
	          	 		<td>서비스 제공 목적 달성시 까지
	
						단, 관계 법령이 정한 시점까지 보존
						</td>
	          	 	</tr>
	          	</table>
          	<div class="agree-add">개인정보 제공에 동의하지 않으실 수 있으며, 동의하지 않으실 경우 서비스 이용이 제한될 수 있습니다.</div>
          </div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer agree-footer" style="text-align:center;">
          <button type="button" class="btn agree-btn btn-secondary" data-dismiss="modal" style="text-align:center; font-size:18px;">확인</button>
        </div>
        
      </div>
    </div>
  </div>
  
          
             
           
        </div>
          
          <div class="col-sm-3 col-md-4 offset-md-1 mobile grayMobile">
            <div class="py-4 d-flex justify-content-end">
              
            </div>
           
            <div class="bg-light rounded d-flex flex-column">
                <div class="p-2 ml-2 mb-2">
                    <div class="ordersSub3">결제금액</div>
                </div>
                <div class="p-2 d-flex">
                    <div class="col-8 middle">총 상품 금액</div>
                    <div class="ml-auto money mr-2">${ordersVO.itemsPrice}원</div>
                </div>
                <div class="p-2 d-flex">
                    <div class="col-8 middle">배송비</div>
                    <div class="ml-auto money mr-2">${ordersVO.shippingFee}원</div>
                </div>
             
                <div class="border-top px-4 mx-3"> </div>
                
             
               
                
                <div class="p-2 d-flex pt-3">
                    <div class="col-8 ordersSub4"><b>최종 결제 금액</b></div>
                     <input type="hidden" id="orderNum"  value="${ordersVO.orderNum}">
                    
                    <div class="ml-auto mr-2" id="payment" title="${ordersVO.payment}"><b class="green money"> ${ordersVO.payment}원</b></div>
                </div>
                <div class="p-2 d-flex pt-3 agree">
                   <div class="agree1">  <input type="checkbox">&nbsp;&nbsp; 아래 내용에 모두 동의합니다. (필수)
                       <hr style="border: solid 1px #d9d9d9;">
                    <div class="agree3"> 
                      <ul>
	                       <li>
		                        <div class="agree4" style="float:left;"> 개인정보 제 3자 제공 </div>
		                       <div class="agree5" style="float:right;"> 
		                         <!-- Button to Open the Modal -->
								  <button type="button" class="agreeBtn" data-toggle="modal" data-target="#agreeModal">
								    약관보기 >
								  </button>
		                       
		                       </div> 
	                       </li>
                       </ul>
                    </div>
                   <div class="agree2"> 본인은 만 14세 이상이고, 위 내용을 확인하였습니다. </div>
                   
                    </div>

                   
                    
                   
                </div>
                
            </div>
            
            
                <div>    <input type="button" id="finalBtn"  value="${ordersVO.payment}원 결제하기" class="btn btn-default btn-block pay"> </div>
       
        </div>
        
        
    </div> <!--  -->
    
    
</div>

</main>
<c:import url="../template/footer.jsp"></c:import>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/js/shippingInsert.js"></script> 

<script type="text/javascript" src="/js/ordersPage.js" ></script>  
<script type="text/javascript" src="/js/ordersPageShip.js" ></script>  



</body>
</html>