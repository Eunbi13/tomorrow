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
.title2{
	clear:both;
	 font-size: 20px;
	 padding:10px;
	
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
	padding:2px 10px 4px 10px;
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
  font-size: 14px;
  background-color:#F5F5F5;
  border-top: black 2px solid;
  border-bottom: lightgray 2px solid;
  border: lightgray 1px solid;
  text-align: center;
}
.tab td{
text-align: center;
border: lightgray 1px solid;
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
    margin-top:40px; 
 	font-weight: bold;
 	font-size: 24px;
}
.middelTi{
    margin-top:20px; 
 	font-weight: 400;
 	font-size: 20px;
 	color:#cccccc;
}

</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>



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
	 				<div>신규주문</div>
 				</div>
 				<div class="order_list_menu_list_value"> 0 </div>
 				
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/order/list?before=24&status=1">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">
 					<div>발송관리</div>
	 				<div>발송대상</div>
 				</div>
 				<div class="order_list_menu_list_value"> 0 </div>
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/order/list?before=24&status=2">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">
 					<div>취소관리</div>
	 				<div>취소요청</div>
 				</div>
 				<div class="order_list_menu_list_value"> 0 </div>
 			</div>
 		</a>

 	</div> <div class="middelTi"><li>발송후</li></div> 
 	<div class="order_list_menu rounded">

 		<a class="order_list_menu_list" href="/order/list?before=24&status=0">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">
	 				<div>배송관리</div>
	 				<div>배송중</div>
 				</div>
 				<div class="order_list_menu_list_value"> 0 </div>
 				
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/order/list?before=24&status=1">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">
 					<div>클레임관리</div>
	 				<div>반품접수</div>
 				</div>
 				<div class="order_list_menu_list_value"> 0 </div>
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/order/list?before=24&status=2">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">
 					<div>클레임관리</div>
	 				<div>교환접수</div>
 				</div>
 				<div class="order_list_menu_list_value"> 0 </div>
 			</div>
 		</a>
 		<a class="order_list_menu_list" href="/order/list?before=24&status=2">
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">
 					<div>정산관리</div>
	 				<div>정산확정금액</div>
 				</div>
 				<div class="order_list_menu_list_value"> 0 </div>
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
						  
				     </ul>
 			   	</div>
 			</div>
 	
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
 			
 			
 			
 			</div>
 		</div> <!-- filer end -->
 	
 	</div>
 	

 </div>
 
 
 <c:import url="../template/footer.jsp"></c:import>
 
 <script type="text/javascript">
 

	
 
 // 주문상태 변경 
 $("#statusUpdate").click(function(){
	 let radioVal = $('input[name="validity"]:checked').val();
	 alert("radioVal:"+radioVal);
	 
	 if(radioVal=='4'){

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
	 
	 if(radioVal=='3'||radioVal=='5'||radioVal=='6'){
		 
		 alert("356입장");
		 
		 $("#updateFrm").submit();
	 }
	 
 })
 
//주문접수내역에서 주문번호/옵션번호 누를시, 그 옵션번호의 주문서가 뜬다.
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