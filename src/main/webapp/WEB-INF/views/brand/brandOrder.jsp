<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/bootStrap.jsp"></c:import>
<title>내일부터 하는 인테리어, 내일의 집</title>
<style>

.btn-close{
    background-image: url(/images/oPic/icons-close.png); /* 16px x 16px */
    background-color: transparent; /* make the button transparent */
    background-repeat: no-repeat;  /* make the background image appear only once */
    background-position: 99%;  /* equivalent to 'top left' */
    border: none;           /* assuming we don't want any borders */
    cursor: pointer;        /* make the cursor like hovering over an <a> element */
    height: 16px;           /* make this the size of your image */
    padding-left: 16px;     /* make text start to the right of the image */
    vertical-align: middle; /* align the text vertically centered */

}

.sm-btn{

    text-align:left;
    width: 100px;
    height: 30px;
    
	background-color: #A63F82;
	color:#FFF;
	border-color: #A63F82;
	border-radius:50px;
	font-size: 15px;
	padding:1px 0px 1px 13px;
	
}

.sm-btn:hover, .sm-btnt:focus, .sm-btn:active, .sm-btn.active, .open .dropdown-toggle.sm-btn {
 
	background-color: #732944;
	color:#FFF;
	border-color: #732944;
}

.title2{
	clear:both;
	 font-size: 20px;
	 font-weight: bold;
	 padding:10px;
	 margin: 40px 0px 10px 0px;
	 
	
}

.tr-first{
 border-top: black 2px solid;
}
.tab-up{
 margin-top:-50px;
}
.tr-bottom{
 font-size: 14px;
  border-bottom: lightgray 1px solid;
}
.subContent{
 padding:10px;
}
.subTitle{
 width:25%;
 padding:10px;
 background-color:#F5F5F5;
}

.btn-sel{
	background-color: #e5b8d7;
	color:#A63F82;
	border-color: #e5b8d7;
	padding:8px 10px 6px 10px;
	border-radius: 5px;
	border: 0;
	outlin:0;
	margin:0px 15px 0px 0px;

}

ul {
  list-style: none; /* Remove default bullets */
}



th{

padding:10px;

}

.padding{
padding:10px;

}

.padding2{
padding:10px;
 text-align:center;
}
.padding2-top{
  font-size: 14px;
  background-color:#F5F5F5;
  border-top: black 2px solid;
  border-bottom: lightgray 2px solid;
}
.padding2-bottom{
  font-size: 14px;

  border-bottom: lightgray 2px solid;
}
.td-right{
  font-size: 14px;
  padding:10px;
  border-right:lightgray 1px solid;
}

.padding4{

padding:20px;
font-weight: bold;
font-size: 16px;

}
table{
  width:100%;
}
.modal-title{
 font-size: 24px;
 color: #FFF;
}
.modal-header{
  background-color: #A63F82;
   
}

.modal-footer{
  background-color:  #F5F5F5;
  
}
.detailSelect{
  font-size: 14px;
}

.modalTitle{
  font-size: 20px;
  font-weight: bold;
}
.grayLine{
border: lightgray 3px solid;
font-size: 14px;
padding-left:10px;

}
.orderStatus{

border: black 3px solid;
font-size: 14px;
padding:80px;
margin-top:30px;

}
.orderModal{
   width:1000px;
   height:800px;
   
}
.btn-orderDetail{

}

.productPic{
width:54px;
}
.tab{
border: gray 1px solid;
}




.tab th{
  font-size: 13px;
  background-color:#F5F5F5;
  border-top: black 2px solid;
  border-bottom: lightgray 2px solid;
  border: lightgray 1px solid;
  text-align: center;
}
.tab td{
text-align: center;
border: lightgray 1px solid;
padding: 3px 0px;
}

a{
   text-decoration:none !important
}
.order_list_menu_list_title{
    font-size: 20px;
    margin-bottom: 15px;

}

.order_list_menu_list:not(:last-of-type):after {
    position: absolute;
    display: block;
    content: "";
    width: 12px;
    height: 12px;
    transform: rotate(
    45deg
    );
    border: solid #bdbdbd;
    border-width: 2px 2px 0 0;
    right: 0;
}

.order_list_menu_list{
webkit-box-flex: 1; */
    /* -webkit-flex: 1 0 0px; */
    -moz-box-flex: 1;
    -moz-flex: 1 0 0px;
    -ms-flex: 1 0 0px;
    flex: 1 0 0px;
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    -webkit-justify-content: center;
    -moz-justify-content: center;
    justify-content: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    -webkit-align-items: center;
    -moz-align-items: center;
    align-items: center;
    position: relative;
    cursor: pointer;
    }

.order_list_menu_list_wrap {
    color:#A63F82;
    text-align: center;
}
.order_list_menu{
    box-shadow: 0 1px 3px 0 #dbdbdb;
    margin-top: 20px;
    display: flex;
    width: 100%;
    height: 150px;
}

.order_list_content{
    font-size: 16px;
    box-shadow: 0 1px 3px 0 #dbdbdb;
    margin-top: 50px;
    width: 100%;
    /* height: 150px;  */
    margin-bottom: 30px;
    padding: 30px;
    padding-bottom:60px;
}
.bigTitle{
    margin:50px 0px 30px 0px; 
 	font-weight: bold;
 	font-size: 24px;
}
.middelTi{
    margin-top:20px; 
 	font-weight: 400;
 	font-size: 20px;
 	color:gray;
}

.bold{
 font-weight: bold;
}

</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<main>

<!-- 주문서 orderDetail Modal -->
<div class="modal fade orderModal" id="orderDetail" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">[주문서 관리]</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		      <div id="cartSel">
			       
			       ...
		       </div>
	 </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-default" id="statusUpdate">확인</button>
      </div>
    </div>
  </div>
</div>
<!-- 주문서 orderDetail Modal end -->



<div class="container-fluid">
<div class="bigTitle">
판매진행현황/주문관리  <font style="font-size:18px; color: #e5b8d7;">(최근 한달 기준)</font>


 </div>
 
  	   <div class="middelTi"><li>발송전</li></div> 
 	<div class="order_list_menu rounded">

 		<a class="order_list_menu_list" href="/order/list?before=24&status=0">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">
	 				<div>주문관리</div>
	 				<div class="bold">신규주문</div>
 				</div>
 				
 				
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/order/list?before=24&status=1">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">
 					<div>발송관리</div>
	 				<div class="bold">발송대상</div>
 				</div>
 				
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/order/list?before=24&status=2">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">
 					<div>취소관리</div>
	 				<div class="bold">취소요청</div>
 				</div>
 				
 			</div>
 		</a>

 	</div> <div class="middelTi"><li>발송후</li></div> 
 	<div class="order_list_menu rounded">

 		<a class="order_list_menu_list" href="/order/list?before=24&status=0">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">
	 				<div>배송관리</div>
	 				<div class="bold">배송중</div>
 				</div>
 				
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/order/list?before=24&status=1">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">
 					<div>클레임관리</div>
	 				<div class="bold">반품접수</div>
 				</div>
 				
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/order/list?before=24&status=2">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">
 					<div>클레임관리</div>
	 				<div class="bold">교환접수</div>
 				</div>
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/order/list?before=24&status=2">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">
 					<div>정산관리</div>
	 				<div class="bold">정산확정금액</div>
 				</div>
 			</div>
 		</a>

 	</div>
 	
 	
 	
 	
 	
 	<div class="order_list_content rounded">
 		<div class="filter">
 		
 			<div class="filter-bar">
 				<div class="filter-bar_control-list">
 					<ul class="filter-bar_control-list_left">
 					
 					  
							  
 						<li class="filter-bar_control-list_item filter-bar_control-list_item-icon">
 						   <div class="dropBtn" style="float:left; margin: 0px 10px 15px 0px;  ">
 			                <button type="button" class="btn-sel dropdown-toggle" data-toggle="dropdown" style="font-size:16px;">
							    기간
							  </button>
							  <div class="dropdown-menu"  style="font-size:16px;">
							    <div class="dropdown-item before" title="1">1개월 전</div>
							    <div class="dropdown-item before" title="3">3개월 전</div>
							    <div class="dropdown-item before" title="6">6개월 전</div>
							    <div class="dropdown-item before" title="12">1년 전</div>
							    <div class="dropdown-item before" title="24">2년 전</div>
							    <div class="dropdown-item before" title="36">3년 전</div>
							  </div>
							 </div>
							  
							 <div class="dropBtn" style="float:left; font-size:16px; ">
							   <button type="button" class="btn-sel dropdown-toggle" data-toggle="dropdown" style="font-size:16px;">
							    주문상태 
							  </button>
							  <div class="dropdown-menu" style="font-size:16px;"> 
							    <div class="dropdown-item status" title="list">입금대기</div>
							    <div class="dropdown-item status" title="2">결제완료</div>
							    <div class="dropdown-item status" title="3">배송준비</div>
							    <div class="dropdown-item status" title="4">배송중</div>
							    <div class="dropdown-item status" title="5">배송완료</div>
							    <div class="dropdown-item status" title="6">구매확정</div>
							    <div class="dropdown-item status" title="7">리뷰작성</div>
							    <div class="dropdown-item status" title="8">취소</div>
							    <div class="dropdown-item status" title="9">교환</div>
							    <div class="dropdown-item status" title="10">환불</div>
							  </div>
							 </div>
						  </li>
						  <li class="filter-bar_tag-list_item filter-bar_control-list_item-icon" style="margin: 0px 10px 30px 0px; clear:both; ">
						     <form id="listFrm" action="../orders/list" method="get">
							    <div id="before_search" class="search" style="float:left; margin-right:10px;">
								  
								    
							
								  
								 </div>
								  <div id="status_search"  class="search" style="float:left;">
								  
								    
							
								  
								 </div>
							</form>
						  </li>
						  
				     </ul>
 			   	</div>
 			</div>
 		
 	
 	  <div id="AjaxList">
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
 			</div>  <!-- ajaxList  -->
 		</div> <!-- filer end -->
 	
 	</div>
 	

 </div>
 
 </main>
 <c:import url="../template/footer.jsp"></c:import>
 
 <script type="text/javascript">
 
	// before 기간 선택해서 검색
	let before_num=0;
	$(".before").click(function(){

		 let previous=  before_num;
			console.log("previous:"+previous);
		    
			let content =$(this).text();
			console.log($(this).attr("title"));
			 before_num =$(this).attr("title");
			console.log("status_num:"+ before_num);
			
			console.log('attr.name:'+$(".sm-btn").attr("name"));
			
			
			if($(".sm-btn").attr("title")=="before"){
				console.log("   before가 이ㅁ 존재 ");
				console.log($(this).val());
				$("#beforeBtn").each(function(){
					if($(this).val()==previous){
						console.log("삭제될 것의 밸류는?"+$(this).val());
						$(this).remove();
						$("#before").remove();
					}
					
				});
			
				let text='<button type="button" id="beforeBtn" class="btn sm-btn btn-close" value="'+before_num +'" title="before" > '+content+'</button>   '
				text +=  '<input type="hidden" id="before" name="before" value="'+ before_num +'">';
				console.log(content);
				$("#before_search").append(function(n){
				      return text;
				    });
			} else{
				

				let text='<button type="button" id="beforeBtn" class="btn sm-btn btn-close" value="'+before_num +'" title="before" > '+content+'</button>   '
				text +=  '<input type="hidden" id="before" name="before" value="'+ before_num +'">';
				console.log(content);
				$("#before_search").append(function(n){
				      return text;
				 });
			}
			
			
			let be =before_num;
			 let st =$("#status").val();
		
			$.ajax({
				type: "get", 
				url: "../brand/ajaxBrandOrder", 
			
				data:{
				   before:be,
				   status:st
					
				}, 
				success:function(data){
					console.log(data);
					$("#AjaxList").empty();
					
					$("#AjaxList").html(data);
				}
				
			});


			
	});



	// status  주문상태 선택해서 검색
	let status_num=0;

	$(".status").click(function(){
	    let previous= status_num;
		console.log("previous:"+previous);
	    
		let content =$(this).text();
		console.log($(this).attr("title"));
		status_num =$(this).attr("title");
		console.log("status_num:"+status_num);
		
		console.log('attr.name:'+$(".sm-btn").attr("name"));
		
			$(".sm-btn").each(function(){
				if($(this).attr("title")=="status"){
					console.log("  status가 이ㅁ 존재 ");
					console.log($(this).val());
					$("#statusBtn").each(function(){
						if($(this).val()==previous){
							console.log("삭제될 것의 타이는?"+$(this).val());
							$(this).remove();
							$("#status").remove();
							
						}
						
					});
					
				}
				
			});
				
		       
		
				let text='<button type="button" id="statusBtn" class="btn sm-btn btn-close" value="'+status_num +'" title="status" > '+content+'</button>   '
				text +=  '<input type="hidden" id="status" name="status" value="'+status_num +'">';
				console.log(content);
				$("#status_search").append(function(n){
					
					
					return text;
				 });
			
			
				 let be =$("#before").val();
			     let st =status_num;
				
				
				 
				$.ajax({
					type: "get", 
					url: "../brand/ajaxBrandOrder", 
				
					data:{
					   before:be,
					   status:st
						
					}, 
					success:function(data){
						console.log(data);
						$("#AjaxList").empty();
						
						$("#AjaxList").html(data);
					}
					
				});
			
		
			
	});

	
	//선택된 주문상태 클릭시, 사라지면서 리스트 갱신. 
	$("#status_search").click(function(){
		$(this).empty();
		
		 
		 let be =$("#before").val();
		 let st =$("#status").val();
		
		 
		$.ajax({
			type: "get", 
			url: "../brand/ajaxBrandOrder", 
		
			data:{
			   before:be,
			   status:st
				
			}, 
			success:function(data){
				console.log(data);
				$("#AjaxList").empty();
				
				$("#AjaxList").html(data);
			}
			
		});

	});
	
	//선택된 기간 클릭시, 사라지면서 리스트 갱신. 
	$("#before_search").click(function(){
		$(this).empty();
		
		let be =$("#before").val();
		 let st =$("#status").val();
		
		$.ajax({
			type: "get", 
			url:"../brand/ajaxBrandOrder", 
		
			data:{
			   before:be,
			   status:st
				
			}, 
			success:function(data){
				console.log(data);
				$("#AjaxList").empty();
				
				$("#AjaxList").html(data);
			}
			
		});
	});

 

	
 
 //------------------ 주문상태 변경 
 $("#statusUpdate").click(function(){
	 let radioVal = $('input[name="validity"]:checked').val();
	 alert("radioVal:"+radioVal);
	 
	 if(radioVal=='4'){ // 배송중(출고완료)  선택시

		 let trackId= $("#trackId").val();
		 alert("trackId:"+trackId);
		 let carrierId= $("#carrierId").val();
		 alert("carrierId:"+carrierId);
		 if(trackId != null && trackId !="" && carrierId != null && carrierId !="" ){
			 alert("4입장");
			 $("#updateFrm").submit();
		 }else{
			 alert("택배사와 운송장 번호를 입력하셔야 상태를 바꿀 수 있습니다. ");
			 
		 }
	 }
	 
	 //배송회사 와 운송장이 없을 시 배송완료, 구매확정 선택불가
	 
	 if(radioVal=='5'||radioVal=='6'){  /// 배송완료/ 구매확정 선택
		 
		 let trackId= $("#trackId").val();
		 alert("trackId:"+trackId);
		 let carrierId= $("#carrierId").val();
		 alert("carrierId:"+carrierId);
		 if(trackId != null && trackId !="" && carrierId != null && carrierId !="" ){
			 alert("4입장");
			 $("#updateFrm").submit();
		 }else{
			 alert("택배사와 운송장 번호를 입력하셔야 상태를 바꿀 수 있습니다. ");
			 
		 }

	 }
	 
	 if(radioVal=='3'||radioVal=='9'||radioVal=='10'||radioVal=='12'||radioVal=='14'||radioVal=='15'){ //  배송준비(접수완료)/환불진행중/환불완료/취소완료 /교환진행중/교환완료 선택시
         alert("3910121415입장");
		 
		 $("#updateFrm").submit();
	 
	 }
	 
 })
 
//------------modal창 띄우기-주문접수내역에서 주문번호/옵션번호 누를시, 그 옵션번호의 주문서가 뜬다.
 $(document).on('click', '.orderDetail', function(){
 	let cartNum =$(this).attr("title");
 	
     console.log(cartNum);
     
     $.get("./cartSelect?cartNum="+cartNum,function(data){
 		console.log(data)
 		data= $.trim(data);
 		$("#cartSel").empty();
 		$("#cartSel").html(data);
 	});
     
 });
 
 
 
 </script>
						  



</body>
</html>