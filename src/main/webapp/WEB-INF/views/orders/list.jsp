<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='https://css.gg/close-o.css' rel='stylesheet'>
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
.detailSelect{
 color:gray; 

}
.btn-sel{
	background-color: #e5b8d7;
	color:#A63F82;
	border-color: #e5b8d7;
	padding:2px 5px 2px 10px;
	border-radius: 5px;
	border: 0;
	outlin:0;

}
.filter-bar_tag-list_item{
clear:both;
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

.two-btn{
  
    width:125px;
    max-width:100%;
	padding:11px 22px;
	font-weight: bold;
	font-size: 18px;
	border-radius:0;
	background-color: #A63F82;
	color: #FFF;
	border-color: #A63F82;
	border:1px solid;
	border-radius:6px;
 margin-bottom:10px;
}

.two-btn:hover, .two-btn:focus, .two-btn:active, .two-btn.active, .open .dropdown-toggle.two-btn {
 
	background-color: #e5b8d7;
	color:#A63F82;
	border-color: #A63F82;;
}

.btn-default{
    
    width:125px;
    max-width:100%;
	padding:11px 22px;
	font-weight: bold;
	font-size: 18px;
	border-radius:0;
	background-color: #FFF;
	color:#A63F82;
	border-color: #A63F82;
	border:1px solid;
	border-radius:6px;

}
.btn-default:hover, .btn-default:focus, .btn-default:active, .btn-default.active, .open .dropdown-toggle.btn-default {
 
	background-color: #e5b8d7;
	color:#A63F82;
	border-color: #A63F82;;
}

img{
width:74px;
max-width: 100px;
border-radius: 10px;
}
table {
font-size:18px;
width:100%;
margin: 25px 0px;
}
table tr td{
/* border: blue 1px solid; */
}
.cart-in{
 display: inline-block;
 margin-top: 10px;
/*  width: 120px;
 height: 30px; */
 
}

.card1{
 width:100%;
  margin: 0 auto;
 text-align: center;

 padding: 15px;
 background-color: #F5F5F5;
 border-color: #F5F5F5;
 border-radius: 5px;

}

.filter-bar_control-list_item-icon{
margin:0px;
}

.filter-bar_control-list_left{
list-style-type: none;
  margin: 0;
  padding: 0;

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

</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<div class="container">
 <div style="font-size:24px; font-weight:bold; margin-top:40px;"> 주문배송내역 조회</div> 

 	<div class="order_list_menu rounded">
 		<a class="order_list_menu_list" href="/orders/list">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">입금대기</div>
 				</div>
 		</a>
 		<a class="order_list_menu_list" href="/orders/list?status=2">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">결제완료</div>
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/orders/list?status=3">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">배송준비</div>
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/orders/list?status=4">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">배송중</div>
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/orders/list?status=5">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">배송완료</div>
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/orders/list?status=6">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">구매확정</div>
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
						  <li class="filter-bar_tag-list_item filter-bar_control-list_item-icon" style="margin: 0px 10px 30px 0px; ">
						     <form id="listFrm" action="../orders/list" method="get">
							    <div id="before_search" class="search" style="float:left; margin-right:10px;">
								  
								    
							
								  
								 </div>
								  <div id="status_search"  class="search" style="float:left;">
								  
								    
							
								  
								 </div>
							</form>
						  </li>
						
					   <div id="AjaxList">
					   
					       <!-- order -->
 						   <c:forEach items="${orderAr}" var="ordersVO">
	 						   <li style="clear:both;">
		 							<div style="float:left; margin: 40px 0px 0px 20px; font-weight: bold; font-size:18px;">
		 						       	 ${ordersVO.orderNum} | ${ordersVO.orderDay}
		 						    </div>
	 						       	    <div class="detailSelect" style="float:right; margin: 45px 20px 0px 0px;">
	 						        		<a class="detailSelect" href="select?orderNum=${ordersVO.orderNum}" >상세보기 ></a>
	 						        	</div>
	 					       </li>  
	 					       
	 					   <hr style="margin-top:80px;">
	 					         <!-- brand -->
	 						     <c:forEach items="${brandAr}" var="brandVO">
	 						    	 <c:if test="${brandVO.orderNum eq ordersVO.orderNum}">
	 						    	    <!-- order -- cart, product, shipping -->
	 						    		 <c:forEach items="${ar}" var="VO">
	 						            	 <c:if test="${ordersVO.orderNum eq VO.orderNum}">
	 						            		 <c:forEach items="${VO.cartList}" var="cartVO">
	 						            			 <c:if test="${brandVO.brandNum eq cartVO.brandNum}">
	 						                        	 <li>
	 						                        	 <table>
														    <tr>
															    <td style="width: 10%; max-width:100px;">
															    <img src="../resources/images/glove.webp" class="mr-3" alt="...">
															  </td>
															    <td style="width: 38%; font-size: 16px;">
															      ${brandVO.brandName}
															      <div style="font-weight: bold; margin-top:10px;"> ${cartVO.productVO.productName} </div>
															     </td>
															     
															    <td style="width: 37%; font-size:18px;">
																    ${cartVO.unitName}
																    <div> ${cartVO.cartPrice}원 | ${cartVO.amount}개</div>
							 						                         <div style="color:#A63F82;"> 
								 						                         <c:if test="${cartVO.validity==2}">
								 					                             	결제완료 | 일반택배배송
								 						                         </c:if> 
								 						                         <c:if test="${cartVO.validity==3}">
								 					                             	배송준비 | 일반택배배송
								 						                         </c:if> 
								 						                         <c:if test="${cartVO.validity==4}">
								 					                             	배송중 | 일반택배배송
								 						                         </c:if> 
								 						                         <c:if test="${cartVO.validity==5}">
								 					                             	배송완료 | 일반택배배송
								 						                         </c:if> 
								 						                          <c:if test="${cartVO.validity==6}">
								 					                             	구매확정 | 일반택배배송
								 						                         </c:if> 
								 						                         <c:if test="${cartVO.validity==7}">
								 					                             	리뷰작성 | 일반택배배송
								 						                         </c:if> 
								 						                         <c:if test="${cartVO.validity==8}">
								 					                             	취소 | 일반택배배송
								 						                         </c:if> 
								 						                         <c:if test="${cartVO.validity==9}">
								 					                             	교환 | 일반택배배송
								 						                         </c:if> 
								 						                         <c:if test="${cartVO.validity==10}">
								 					                             	환불 | 일반택배배송
								 						                         </c:if> 
							 						                         </div>
															    </td>
															    
															     <td style="width: 15%">
															     
															     <input type="hidden" id="brandShipping${cartVO.brandNum}" value="${cartVO.brandShipping}">
															   
															     <!-- 결제완료 단계에선 취소요청시, 바로 취소가능 -->
															     <c:if test="${cartVO.validity==2}">
								 					               <button class="btn btn-default" onclick="location.href='./cancel?cartNum=${cartVO.cartNum}&kind=1'"> 주문취소 </button>       
								 						         </c:if> 
								 						          <!-- 배송준비 단계에서 부턴 취소,환불,교환은 상세페이지에서만 확인 가능 -->
								 						          <c:if test="${cartVO.validity==3}">
								 					                
								 					               <button class="btn btn-default" onclick="location.href='./confirm?cartNum=${cartVO.cartNum}'"> 구매확정 </button>   
								 						         </c:if> 
								 						          <c:if test="${cartVO.validity==4}">
								 					             
								 					               <button class="btn  two-btn" onclick="location.href='./confirm?cartNum=${cartVO.cartNum}'"> 구매확정 </button>  
								 					               <button class="btn btn-default" onclick="delivery_tracking('https://tracker.delivery/#/${cartVO.carrierId}/${cartVO.trackId}');"> 배송추적  </button>
     
								 						         </c:if> 
								 						          <c:if test="${cartVO.validity==5}">
								 					                 
								 					                 <button class="btn  two-btn" onclick="location.href='./confirm?cartNum=${cartVO.cartNum}'"> 구매확정 </button>  
								 					                 <button class="btn btn-default" onclick="delivery_tracking('https://tracker.delivery/#/${cartVO.carrierId}/${cartVO.trackId}');"> 배송추적 </button>
          
								 						         </c:if> 
								 						          <c:if test="${cartVO.validity==6}">
								 					               <button class="btn two-btn"> 리뷰작성 </button>   
								 					       		   <button class="btn btn-default" onclick="delivery_tracking('https://tracker.delivery/#/${cartVO.carrierId}/${cartVO.trackId}');"> 배송추적  </button>
								 						         </c:if> 						     
															     </td>
														   </tr>
												   	     </table>
		 						        
		 						                         </li>
		 						                  	</c:if>
		 						                 </c:forEach>
		 						              </c:if>
		 						          </c:forEach>
	 				                         		<div class="card1">
	 				                         		        <div id="shipping${brandVO.brandNum}" class="shipping" title="${brandVO.brandNum}"> 선배송비 3000원 </div>
				 						                   <div class="cart-in" style="font-weight:600;" >${brandVO.companyName}</div> 
				 						                   <div class="cart-in" style="color:#A63F82; font-weight:600;">${brandVO.managerPhone} </div>
				 						            </div>  
	 				                 </c:if>  
 				                 </c:forEach>      
		 						      <!-- brand end -->       
	 				        </c:forEach>
	 				        <!-- order end -->
	  
	 				        
	 				   </div>
	 			
 				   
 						
 					 </ul>
 			   	</div>
 			</div>
 		</div>
 	</div>
 </div>


<script type="text/javascript">

  //브랜드별 배송비 표
	$(".shipping").each(function(){
		
		let brandNum = $(this).attr("title");
		let brandShipping =$("#brandShipping"+brandNum).val();
		brandShipping = parseInt(brandShipping);
		let brandShippingShow= "선배송비"+brandShipping+"원";
		$("#shipping"+brandNum).text(brandShippingShow);
		
	});

	//delivery_tracking pop up 띄우기

	function delivery_tracking(link01){
		
		window.open(link01,"_blank","width=500, height=740;");
	}

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
			 alert("be:"+be+"/st:"+st); 
			 
			$.ajax({
				type: "get", 
				url: "../orders/ajaxList", 
			
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
				 alert("be:"+be+"/st:"+st); 
				
				 
				$.ajax({
					type: "get", 
					url: "../orders/ajaxList", 
				
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

	$("#status_search").click(function(){
		$(this).empty();
		
		 
		 let be =$("#before").val();
		 let st =$("#status").val();
		 alert("be:"+be+"/st:"+st); 

		
		 
		$.ajax({
			type: "get", 
			url: "../orders/ajaxList", 
		
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

	$("#before_search").click(function(){
		$(this).empty();
		
		let be =$("#before").val();
		 let st =$("#status").val();
		 alert("be:"+be+"/st:"+st); 

		
		 
		$.ajax({
			type: "get", 
			url: "../orders/ajaxList", 
		
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




	</script>

	<c:import url="../template/footer.jsp"></c:import>


	</body>
 </html>
				 				
