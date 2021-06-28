<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
/* Chrome, Safari, Edge, Opera */
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

 


input:focus {
outline:none;
}


.product-bottom{
 margin-top: -15px;
 margin-bottom: -20px;
}
.d-top{
margin-top:20px;
}
.p-2{
	font-size: 16px;
}
.card{
    margin-bottom: 15px;
}
.card-header{
   background-color: white;
}
 .card-footer{
 margin-top: -30px;
 font-size: 16px;
}
.option{
   font-size: 16px;
   padding-bottom: 20px;
}
img{
	width: 64px;
	height: 64px;
}
.productName{
  
  font-weight: bold;
  font-size: 16px;
}
.shippingType{
   font-size: 12px;
    padding-bottom: 20px;
}


@media (min-width: 768px)
.production-selling-navigation {
    background-color: #fafafa;
    border-top: 1px solid #ededed;
    border-bottom: 1px solid #ededed;
}
.production-selling-navigation {
    background-color: #fff;
    z-index: 100;
    transition: top .1s;
    }
</style>

<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<div class="container-fluid rounded bg-white" id="carts">
    <div class="row d-flex justify-content-center pb-5">
        <div class="col-sm-5 col-md-6 ml-1">
        
         
         
       
     <div class="sticky-child production-selling-navigation" style="position: relative;">
	     <nav class="production-selling-navigation__content">
		     <ol class="production-selling-navigation__list">
			     <li>
			     <a class="production-selling-navigation__item production-selling-navigation__item--active" href="#production-selling-information">상품정보</a>
			     </li>
			     
			     <li>
			     <a class="production-selling-navigation__item" href="#production-selling-delivery">배송/환불</a>
			     </li>
		     </ol>
	     </nav>
     </div>
     
         
         
         
         ///
         
            <!-- d-flex -->
    
                  <div class="d-flex justify-content-between d-top">
				    <div class="p-2 ">
		                       <div class="custom-control custom-checkbox">
								  <input type="checkbox" checked class="custom-control-input" id="allCheck">
								  <label class="custom-control-label" style="font-size:18px;" for="allCheck">모두선택</label>
								</div>
				    </div>
				   
				    <div class="p-2"><button type="button" class="btn" id="selectedDelete" style="font-size:18px;">선택삭제</button></div>
				  </div>      
            
            
			   <!-- d-flex end -->
    
            
        <section class="">
        <!-- brand -->
 
        
        <c:forEach items="${brandAr}"  var="brandVO" varStatus="b">

         <div id="card${brandVO.brandNum}" class="card">
			  <div class="card-header">
				 
	                <div class="p-1" style="text-align: center; font-size:16px;"> <c:out value="${brandVO.brandName}"/> 배송</div>
			
			  </div>
			  
			  <div class="card-body">
			  	<ul class="list-unstyled">
			
			  	
			  	<c:forEach items="${productAr}" var="productVO" varStatus="p">
			  	
			  	<c:if test="${brandVO.brandNum eq productVO.brandNum}">
			  	
			     <!-- product  -->
			  	<div id="products${productVO.productNum}">
				  <li class="media mb-4" >
				    <!-- Checked checkbox -->
		            <div class="custom-control custom-checkbox productCheck${productVO.brandNum}" title="${productVO.brandNum}">
					  <input type="checkbox" checked class="custom-control-input del" name="validity1" id="check${productVO.productNum}" title="${productVO.productNum}" value="1">
					  <label class="custom-control-label" for="check${productVO.productNum}"></label>
					</div>
					<!-- Checked checkbox  end -->
				    <img src="../resources/images/glove.webp" class="mr-3" alt="...">
				    <div class="media-body">
				      <div class="mt-0 mb-1 productName">${productVO.productName}</div>
				         <div class="shippingType">무료배송 | 일반택배</div>
				    </div>
				   
					  
					  <c:forEach items="${cartAr}" var="cartVO" varStatus="i">
					  <c:if test="${productVO.productNum eq cartVO.productNum}">
					     
					       <c:forEach items="${cartVO.optionList}" var="optionList">
					   <!-- option -->
					     <li id="carts${i.index}" title="${cartVO.brandNum}">
					       <input type="hidden" class="cartNum cartNum${productVO.productNum}" id="cartNum${cartVO.cartNum}" title="${cartVO.cartNum}">
					       <input type="hidden" class="unitPrice" id="unitPrice${cartVO.cartNum}" name="unitPrice" title="${cartVO.unitPrice}" value="${cartVO.unitPrice}">
						   <input type="hidden" id="brandShipping${b.index}" class="brandShipping${b.index} brandShipping" data-cartNum="${cartVO.cartNum}" name="brandShipping" value=""/> 		     
						  
						   		     		     
						   
							  <div title="${cartVO.productNum}" style="width:100%; height:100%; padding-bottom:40px; word-break:break-all;word-wrap:break-word;" class="cartCheck${cartVO.productNum} alert alert-secondary alert-dismissible fade show" role="">
							  		<div class="option">  ${cartVO.unitName} </div>
							  		   <div style="width:70px; height:20px; font-size:12px; float: left;">
							  		     
							  		   
											
										     <!-- 상단의 select box에 수량 10개이상 선택시 나타날 인풋박스/ 숫자만 입력할수 있도록 type number 지정 -->
										     <input style="width:70px; height:20px; ime-mode:disabled;" type="number" min="1"  class="directInputBox directInputBox${productVO.productNum}" data-product-num="${productVO.productNum}" title="${cartVO.cartNum}" id="directInputBox" name="amount" value="${cartVO.amount}"/>
										</div>
										<div style="width:200px; height:23px; font-size:16px; padding-bottom:20px; font-weight: bold; float: right;">
										      
											       <input type="text" readonly="readonly" id="cartVOPrice${cartVO.cartNum}" class="cartPricePlus${productVO.productNum} cartPricePlus" title="${productVO.productNum}" name="cartPrice" value="${cartVO.cartPrice}" style=" width:180px; height:20px; background-color:transparent;border:0 solid black; text-align:right;" />
											  원
					
										</div> 
							  <button type="button" class="close delete"  title="${i.index}"  aria-label="Close">
							    <span aria-hidden="true">&times;</span>
							  </button>
							 </div>
							 
					       </li>
				       
				      <!-- option end-->
				           </c:forEach>
				      </c:if>
				      </c:forEach>
				      
				      
				      	<div class="d-flex justify-content-between product-bottom">
				    		<div class="p-2" style="font-size:14px;" >
				    			옵션변경  |  바로결제
				    		</div>
				    		
				    	   <!-- fixed shippingFee per Product -->
				    	        <input type="hidden" id="shippingFee${productVO.productNum}" class="shippingFee${b.index} "  value="${productVO.shippingFee}"/> 	     
				    		
				    	   <!-- Discount per Product -->
				    	        <input type="hidden" id="fixedPrice${productVO.productNum}" class="fixedPrice" title="${productVO.productNum}" data-discount-price="${productVO.discountPrice}" value="${productVO.productPrice}"/> 		     
						  	    <input type="hidden" class="amount${productVO.productNum}"  value=""/> 	     
				    		    <input type="hidden" id="discount${productVO.productNum}" class="discount" value=""/> 	
				    		<!-- productPrice -->
				    		<div class="p-2" style=" font-size:18px;  font-weight: bold;" title="${productVO.productNum}">
				    		    
				    				<input  readonly="readonly" value="" id="productVOPrice${productVO.productNum}" class=" productPrice${b.index}  productNum_productPrice${productVO.productNum} productPrice" title="${b.index}" style=" width:200px; height:30px; background-color:transparent;border:0 solid black; text-align:right;">원
				    			
				    		</div>
				    	</div>
				        
			             <hr>
					 </li>
					 
				 </div>
					   
				  <!-- product end -->
				  </c:if>
				  
				  </c:forEach>
				  

				 </ul>

			    
			  </div>
			  		<input type="hidden" id="brandPrice" class="brandPrice${b.index} brandPrice" value="0" title="${b.index}"> 
			  
					  <div class="card-footer text-center text-muted">
					  	<input readonly="readonly" class="shipping" id="shipping${b.index}" title="0" value="배송비 무료" style=" width:120px; height:30px; background-color:transparent;border:0 solid black; text-align:center;">
					  </div>
			  
			</div>
			
			</c:forEach>
			
	       		 <!-- brand end -->
	  
				
        </section>
          
             
        </div>
        
        <!-- 결제 창 -->
        
        
        <div class="col-sm-3 col-md-4 offset-md-1 mobile">
            <div class="py-4 d-flex justify-content-end">
              
            </div>
            <form id="orderFrm" action="../orders/insert" method="post"> 
            <div class="bg-light rounded d-flex flex-column">
                <div class="p-2 ml-3">
             
                </div>
                <div class="p-2 d-flex">
                    <div class="col-6">총 상품 금액</div>
                    <div class="ml-auto">  				    			
                    	<input readonly="readonly" id="totalPrice" class="totalPrice" style=" width:100px; height:30px; background-color:transparent;border:0 solid black; text-align:right;">원
                        <input type="hidden" readonly="readonly" name="itemsPrice" id="itemsPrice"  style=" width:100px; height:30px; background-color:transparent;border:0 solid black; text-align:right;">
                       
                    </div>
                </div>
                <div class="p-2 d-flex">
                    <div class="col-6">총 배송비</div>
                    <div class="ml-auto">
                      <input readonly="readonly" name="shippingFee" id="totalShipping" class="totalShipping" style=" width:100px; height:30px; background-color:transparent;border:0 solid black; text-align:right;">원
                    </div>
                </div>
                      <div class="p-2 d-flex">
                    <div class="col-6">총 할인금액</div>
                    <div class="ml-auto">0원</div>
                      - <input readonly="readonly" name="totalDiscount" id="totalDiscount" class="totalDiscount" style=" width:100px; height:30px; background-color:transparent;border:0 solid black; text-align:right;">원
                    
                </div>
             
                <div class="border-top px-4 mx-3"> </div>
                
             
                <div class="border-top px-4 mx-3"></div>
                
                <div class="p-2 d-flex pt-3">
                    <div class="col-6"><b>결제 금액</b></div>
                    <div class="ml-auto">
                   	 <b class="green">
                   	   <input readonly="readonly" name="payment" id="payment" class="payment" style=" width:100px; height:30px; background-color:transparent;border:0 solid black; text-align:right;">원
                   	 </b>
                    </div>
                </div>
            </div>
            </form>	
            <style>
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
            </style>
                <div> <input type="button"  value="개 상품 구매하기" id="payBtn" class="btn-default btn-block btn" > </div>
         b@rand
        </div>
        b@rand
        
        b@rand
        
        insert into cart(username, brandNum, productNum, amount, validity, cartPrice, unitPrice, unitName)
values('id4', 6, 15, 1, 0, 58000, 58000, '컬러:내추럴');

 insert into cart(username, brandNum, productNum, amount, validity, cartPrice, unitPrice, unitName)
values('id4', 6, 16, 1, 0, 18000, 18000, '컬러:실버');

 insert into cart(username, brandNum, productNum, amount, validity, cartPrice, unitPrice, unitName)
values('id4', 6, 17, 1, 0, 35000, 35000,'색상:살구/사이즈:Q');

insert into cart(username, brandNum, productNum, amount, validity, cartPrice, unitPrice, unitName)
values('id4', 6, 17, 1, 0, 25000, 25000,'색상:그레이/사이즈:SS');

 insert into cart(username, brandNum, productNum, amount, validity, cartPrice, unitPrice, unitName)
values('id4', 6, 18, 1, 0, 19900, 19900,'색상:니트브라운/사이즈:45x45');

insert into cart(username, brandNum, productNum, amount, validity, cartPrice, unitPrice, unitName)
values('id4', 6, 18, 1, 0, 10900, 10900,'색상:버터옐로우/사이즈:35x35');
        	
        	
        	
        	
   
	
<script type="text/javascript">

//상품구매하기 버튼 누를시.
$("#payBtn").click(function(){
	//각 cartVO의 validity 검사-> ajax를 이용해 DB에 업데이트 
	// Ajax 끝마치고 submit 하기
	 const validity_ar=[];
	 const un_validity_ar=[];
	$(".del").each(function(){
		if($(this).prop("checked")){
			validity_ar.push($(this).attr("title"));
		} else{
			un_validity_ar.push($(this).attr("title"));
		}
		
	});
	
	$.ajax({
		type: "post",
		url:"../cart/validityUpdate",
		traditional: true,
		data:{
			productNum:validity_ar,
			unProductNum:un_validity_ar
		},
		success:function(data){
			data = data.trim();
            if(data>0){
				
				
				let validity1 =$('input:checkbox[name=validity1]:checked').length;
				console.log(validity1);
				//선택한 상품이 0개 이상일때 order insert 폼 제출 되기!	
				if(validity1>0){
				 $("#orderFrm").submit();
				} else{
					//선택한 상품이 0개 일때 경고창띄우고 주문 입력되지 않기
					alert('선택한 상품이 없습니다.');
				}

			 }else {
				alert('주문페이지로 이동이 실패했습니다.');
			}
		}
	})
	
	 if(brandPrice>=30000){//한 브랜드에서 구매한게 3만원 이상
	    	console.log(b_index+" is over30000");
	    	$(".brandShipping"+b_index).each(function(){
	    		$(this).val(0);//cartVO is Free에 0 넣기 반복돌리자
	    	});
	    	
	    	$("#shipping"+b_index).val("배송비 무료");
	    	$("#shipping"+b_index).attr("title", 0);
	    	
	    } else{//1.한 브랜드에서 구매한게 3만원 이하 
	    	 let shipCheck=false;
	    	//2.그 브랜드의 어떤 productVO shippingFee도 0이 아님  
	    	//1+2 의 조건이면  그 중 가장 적은 shippingFee 한번만 적용
	    	$(".shippingFee"+b_index).each(function(){
	    		if($(this).val()==0){//3. 그 브랜드에서 구매한 product shippingFee 중 0이 하나라도 있음
	    			shipCheck=true;
	    		}
	    	});
	    	
	    	if(shipCheck==true){
	    		
		    	//1+3 의 조건이면 그 브랜드 안 모든  cartVO is free의 true, 브랜드 배송비 무료
				$(".brandShipping"+b_index).each(function(){
		    		$(this).val(0);//cartVO is Free에 0 넣기 반복돌리자
		    	});
				$("#shipping"+b_index).val("배송비 무료");
		    	$("#shipping"+b_index).attr("title", 0);
	    		
	    	} else{
	    		
	    		let shipFee=100000; //shipFee에 가장 작은 배송비를 넣을 것 
	    		$(".shippingFee"+b_index).each(function(){
	    			let shipFee2=$(this).val();
	    			if(shipFee2 <= shipFee){
	    				shipFee=shipFee2;
	    			}
	    		});
	    		
	    		$(".brandShipping"+b_index).each(function(){
		    		$(this).val(shipFee);//cartVO is Free에 찾은 가장 작은 배송비 넣기 반복돌리자
		    	});
	    	
	    	$("#shipping"+b_index).val("배송비"+shipFee+"원");
	    	$("#shipping"+b_index).attr("title", shipFee);
	    	}
	    	
	    }
		
	});
	
	
	
	
		
    //----------ajax DB Update   
	
    
});
//==============================첫 로딩 시 금액 세팅
let total=0; //총 상품 금액
$(".cartPricePlus").each(function(){ 
	total=total+parseInt($(this).val());//cartPrice를 반복해서 더해줌.
    
    let productNum = $(this).attr("title"); //productNum
    console.log("productNum:"+productNum);
     
    let price=0; //각 option들의 가격을 더한 product범위의 가격
	
	$(".cartPricePlus"+productNum).each(function(){
		price=price+parseInt($(this).val());//cartPrice를 반복해서 더해줌.
     });
     
	$("#productVOPrice"+productNum).val(price); // product당 가격(=option가격들의 합) 세팅
	
	console.log("price:"+price);
    
	console.log("total:"+total);
	
});
$("#totalPrice").val(total); // 총 상품 금액 입력
//무료배송여부 

$(".productPrice").each(function(){ 
	
    let b_index = $(this).attr("title"); //brand index
    console.log("b_index:"+b_index);
     
    let brandPrice=0;
	
	$(".productPrice"+b_index).each(function(){ //같은 브랜드의 모든 Product의 값들 반복해서 더해줌 
		brandPrice=brandPrice+parseInt($(this).val());
     });
     
	
	
	console.log("brandPrice:"+brandPrice);
    
    if(brandPrice>=30000){
    	console.log(b_index+" is over30000");
    	$(".freeShipping"+b_index).val(1);
    	$("#shipping"+b_index).val("배송비 무료");
    	$("#shipping"+b_index).attr("title", 0);
    } else{
    	$("#shipping"+b_index).val("배송비 3000원");
    	$("#shipping"+b_index).attr("title", 3000);
    	
    }
	
});
//총 배송비
let totalShipping=0; 
$(".shipping").each(function(){
	
	let shipping =$(this).attr("title");
	console.log("shipping:"+shipping);
	
	totalShipping= totalShipping+parseInt(shipping);	
	
});
 
console.log(totalShipping);
$("#totalShipping").val(totalShipping);// 총 배송비 입력 
//----------총 결제금액
let payment=totalShipping+total;
$("#payment").val(payment);  //총 결제금액 입력
//상품구매 버튼표기
let validity1 =$('input:checkbox[name=validity1]').length;
console.log(validity1);
$('#payBtn').val(validity1+"개 상품 구매하기");
// ----------세팅끝
//==============================checkbox 전체 와 각 체크박스누를때 변경사항
//--------1,2 전체 선택 클릭시, 각 제품체크박스에 전체선택의 체크 상태 넣기
/* $("#allCheck").click(function(){
	let check = $("#allCheck").prop("checked");
	$(".del").prop("checked", check);
	
}); */
$('#allCheck').change( function(){
    var imChecked = $(this).is(":checked");
    if(imChecked){
        $('.del').prop('checked',true);
        let validity1 =$('input:checkbox[name=validity1]:checked').length;
    	console.log("validity1:"+validity1);
    	$('#payBtn').val(validity1+"개 상품 구매하기");
    	
    } else {
        $('.del').prop('checked',false);
        let validity1 =$('input:checkbox[name=validity1]:checked').length;
    	console.log("validity1:"+validity1);
    	$('#payBtn').val(validity1+"개 상품 구매하기");
    	
    }
});
//---------3.4 각 제품체크박스 클릭시, 각 체크박스 중 하나라도 체크가 안되있으면 전체선택 체크 해제
$(".del").click(function(){
	let result =true;
	$(".del").each(function(){
		if(!$(this).prop("checked")){
			result=false;
			$(this).val("0");
		}
	});
	
	$("#allCheck").prop("checked", result);
});
//--------------------------checkbox 전체 와 각 체크박스누를때 변경사항 끝
//==============================check box(범위: product)를 건들때 마다 총 상품 금액 변경
$(".del, #allCheck").change(function(){
	let newBrandPrice =0;
    const checkedNum = [];
    $(".brandPrice").each(function(){  
    	$(this).val(0);
    	
    });
	//모든 checkbox를 검사해서 checked 된 것들만...계산해서 총 상품 가격, 총배송비, 총 결제금액 계산
	$(".del").each(function(){
		if($(this).prop('checked')==true){
			
		    console.log('체크된 상태:'+$(this).attr("title"));
		    let productNum=$(this).attr("title");
		    $(this).val("1");
	
		    checkedNum.push(productNum);
		} else{
		    console.log('체크 안 된 상태:'+$(this).attr("title"));
		    $(this).val("0");
		}
	});
	
	//상품구매 버튼표기
	let validity1 =$('input:checkbox[name=validity1]:checked').length;
	console.log("validity1:"+validity1);
	$('#payBtn').val(validity1+"개 상품 구매하기");
	console.log("checkedNum:"+checkedNum)
	
	            //체크된 productNum 을 가진 것들.
				for(let p in checkedNum){
					 
					let b_index =$("#productVOPrice"+checkedNum[p]).attr("title");
					let productPrice = $("#productVOPrice"+checkedNum[p]).val();
					
					newBrandPrice = parseInt($(".brandPrice"+b_index).val()) + parseInt(productPrice);
					
					console.log("newBrandPrice:"+newBrandPrice);
					$(".brandPrice"+b_index).val(newBrandPrice);
					
				}
	
	         //모든 brandPrice를 반복돌려서 처리
	         $(".brandPrice").each(function(){
	        	let b_index = $(this).attr("title");
	        	let brandPrice= $(".brandPrice"+b_index).val();
	        	 
	        	console.log("brandPrice:"+brandPrice);
			    
			    if(brandPrice>=30000){//product당 가격의 반복 = brand당 총 가격이 3만원넘으면
			    	console.log(b_index+" b_index is over 30000");
			    
			    	$("#shipping"+b_index).attr("title", 0);
			    } else if(brandPrice==0){ // brand당 총 가격이 0원일때
			    	console.log(b_index+" b_index is 0 zero~~~");
			    	$("#shipping"+b_index).attr("title", 0);
			    } else{  // brand당 총 가격이 3만원 미만 일때
			    
			    	console.log(b_index+" b_index is not over 30000");
			    	$("#shipping"+b_index).attr("title", 3000);
			    	 
			    }
	         });
	          
	       //총 배송비
				let totalShipping=0; 
				
				$(".shipping").each(function(){//
					
					let shipping =$(this).attr("title");
					console.log("shipping:"+shipping);
					
					totalShipping= totalShipping+parseInt(shipping);	
					
				});
				 
				console.log(totalShipping);
				
				$("#totalShipping").val(totalShipping);// 총 배송비 입력 오케비
				
				//----------총 결제금액!!
			//총 상품 가격 부터 다시.
			let totalcheckedPrice= 0;
			
			for(let c in checkedNum){
			       $(".productNum_productPrice"+checkedNum[c]).each(function(){ 
			           totalcheckedPrice=totalcheckedPrice+parseInt($(this).val());
			           console.log("checked productPrice: "+parseInt($(this).val()));
			      });
			
			}
			
			   $("#totalPrice").val(totalcheckedPrice);
				
				let payment=totalShipping+parseInt($("#totalPrice").val());
				
				$("#payment").val(payment);  //총 결제금액 입력
				
	         
			
});
				
				
				
	
	
//------------check box(범위: product)를 건들때 마다 총 상품 금액 변경   end

/* 

$("input:number").on("focus", function() {

    var x = $(this).val();



    $(this).val(x);

}).on("focusout", function() {

    var x = $(this).val();

    if(x && x.length > 0) {

        if(!$.isNumeric(x)) {

            x = x.replace(/[^0-9]/g,"");

        }



        $(this).val(x);

    }

}).on("keyup", function() {

    $(this).val($(this).val().replace(/[^0-9]/g,""));

});
 */
	
//==============================수량을 변경하면 바뀌는 금액들
let count = 0;
$(".directInputBox").on({
	focus: function(){
		count=$(this).val();
		}
	,change:function(){ 
	
		let amount = $(this).val();
			if(amount==0){
		    		
		    		alert("0보다 큰 정수를 입력해야 합니다. ")
		    		$(this).val(count);
    	    } else{
    	    	let amount = $(this).val();
    	    	let cartNum =$(this).attr("title");
                let don = $("#unitPrice"+cartNum).val(); //단가
    	    	don = amount*don;
    	
    	    	$("#cartVOPrice"+cartNum).val(don); // 변화된 option 가격 표시
    	    	
    	    	
    	    	let price=0; //각 option들의 가격을 더한 product범위의 가격
    			
    	    	let productNum = $(this).attr("data-product-num");
    			
    			$(".cartPricePlus"+productNum).each(function(){
    				price=price+parseInt($(this).val());
    				console.log("반복되는 cartPricePlus:"+price);
    		     });
    			
    			$("#productVOPrice"+productNum).val(price);
    			
    			
    			//-----총 상품 금액 변경
    			totalAgain=0;
    			
    			$(".cartPricePlus").each(function(){
    				totalAgain=totalAgain+parseInt($(this).val());
    			});
    			
    			$("#totalPrice").val(totalAgain);
    			
    			
    			
    			
    			//배송비, 총 배송비 변경
    			let newBrandPrice =0;
    		    const checkedNum = [];
    		    
    		    $(".brandPrice").each(function(){  //brand별 금액 초기
    		    	$(this).val(0);    
    		    });
    		    
    			//모든 checkbox를 검사해서 checked 된 것들만...계산해서 총 상품 가격, 총배송비, 총 결제금액 계산
    			$(".del").each(function(){
    				if($(this).prop('checked')==true){
    					
    				    console.log('체크된 상태:'+$(this).attr("title"));
    				    let productNum=$(this).attr("title");
    			
    				    checkedNum.push(productNum);

    				} else{
    				    console.log('체크 안 된 상태:'+$(this).attr("title"));

    				}
    			});
    			console.log("checkedNum:"+checkedNum)
    			
    			            //체크된 productNum 을 가진 것들.
    						for(let p in checkedNum){
    							 
    							let b_index =$("#productVOPrice"+checkedNum[p]).attr("title"); //brand index
    							let productPrice = $("#productVOPrice"+checkedNum[p]).val();

    							
    							newBrandPrice = parseInt($(".brandPrice"+b_index).val()) + parseInt(productPrice);
    							
    							console.log("newBrandPrice:"+newBrandPrice);
    							$(".brandPrice"+b_index).val(newBrandPrice);
    							
    						}
    			
    			         //모든 brandPrice를 반복돌려서 처리
    			         $(".brandPrice").each(function(){
    			        	let b_index = $(this).attr("title");
    			        	let brandPrice= $(".brandPrice"+b_index).val();
    			        	 
    			        	console.log("brandPrice:"+brandPrice);
    					    
    					    if(brandPrice>=30000){//product당 가격의 반복 = brand당 총 가격이 3만원넘으면
    					    	console.log(b_index+" b_index is over 30000");
    					    
    					    	$("#shipping"+b_index).attr("title", 0);
    					    	/////////////////////////////isFree 1 로 바꿔 넣고  ajax
    					    	
    					    } else if(brandPrice==0){ // brand당 총 가격이 0원일때
    					    	console.log(b_index+" b_index is 0 zero~~~");
    					    	$("#shipping"+b_index).attr("title", 0);
    					    } else{  // brand당 총 가격이 3만원 미만 일때
    					    	console.log(b_index+" b_index is not over 30000");
    					    	$("#shipping"+b_index).attr("title", 3000);
    					    	
    					    	/////////////////////// 이 브랜드의 어떤 productVO의 shippingFee도 0이 아니라는게 성립했을때
    	                        ////////////////////////isFree 0 로 바꿔 넣고  ajax
    					    	///////////////////////이 브랜드 안에 모든 productVO shippingFee검사 -> 0이 하나라도 있으면 isFree 1 로 바꿔 넣고  ajax

    					    }
    			         });
    			          
    			       //총 배송비
    						let totalShipping=0; 
    						
    						$(".shipping").each(function(){
    							
    							let shipping =$(this).attr("title"); //그 브랜드의 배송비: 0이나 3000
    							console.log("shipping:"+shipping);
    							
    							totalShipping= totalShipping+parseInt(shipping);	
    						});
    						 
    						console.log(totalShipping);
    						
    						$("#totalShipping").val(totalShipping);// 총 배송비 입력
    						
    						//----------총 결제금액!!
    					//총 상품 가격 부터 다시 계산
    					let totalcheckedPrice= 0;
    					
    					for(let c in checkedNum){
    					       $(".productNum_productPrice"+checkedNum[c]).each(function(){ 
    					           totalcheckedPrice=totalcheckedPrice+ parseInt($(this).val());
    					           console.log("checked productPrice: "+parseInt($(this).val()));
    					      });
    					
    					}
    					
    					   $("#totalPrice").val(totalcheckedPrice);
    						
    						let payment=totalShipping+parseInt($("#totalPrice").val());
    						
    						$("#payment").val(addCommas(payment));  //총 결제금액 입력
    						
    				//brand별 무료배송여부 표시 
    						$(".productPrice").each(function(){ 
    							
    						    
    						    let b_index = $(this).attr("title"); 
    						    console.log("b_index:"+b_index);
    						     
    						    let brandPrice=0; 
    							
    							
    							$(".productPrice"+b_index).each(function(){
    								brandPrice=brandPrice+parseInt($(this).val());
    						     });
    						     
    						
    						    if(brandPrice>=30000){
    						    	console.log(b_index+" is over30000");
    						    	$(".freeShipping"+b_index).val(1);
    						    	$("#shipping"+b_index).val("배송비 무료");
    						
    						    } else{
    						    	$("#shipping"+b_index).val("배송비 3000원");
    						    }
    							

    						});
    			
    			 //--------ajax DB Update (완성!!)
    			amount = $(this).val();
    			let cartPrice= $("#cartVOPrice"+index).val();
    			console.log("ajax 전  cartNum"+cartNum);
    			$.ajax({
    				type: "post",
    				url:"../cart/amountUpdate",
    				data:{
    					 amount:amount,
    					 cartPrice:cartPrice,
    					 cartNum:cartNum
    				   
    				},
    				success:function(data){
    					data = data.trim();
    					if(data==1){
    						alert('등록 성공');
    					}else {
    						alert('등록 실패');
    					}
    				}
    			 }) //Ajax update 끝

    	    } //if 문 끝
			
		}//change 함수 
	
	
	
	
	}); //on event
//==============================ajax Delete   (삭제후 배송료 변경하기)
//==============================check box (product) 선택삭제 
$("#carts").on("click", "#selectedDelete", function(){
	const ar = []; //빈 배열
	const brand_ar=[];
	$(".del").each(function(){
		let ch = $(this).prop("checked");
		if(ch){
			ar.push($(this).attr("title")); //productNum!
		
			brand_ar.push($(this).parent().attr("title")); //brandNum!
		}
	});
	console.log(brand_ar);
	
	
	$.ajax({
		type: "get",
		url:"../cart/productDelete",
		traditional:true, //배열전송
		data:{productNum:ar},
		success:function(data){
			alert('삭제하였습니다');
			for(var a in ar){
				$("#products"+ar[a]).remove();
				console.log(ar[a]+"가 삭제됨");
			}
			// 총 상품 가격 다시 계산
			totalAgain=0;
		
		    $(".cartPricePlus").each(function(){
			totalAgain=totalAgain+parseInt($(this).val());
		    });
		
		    $("#totalPrice").val(totalAgain);
			
		    //  같은 brand에 다른 상품이 있는지 찾아 보고 없으면 brand 카드까지 삭제
		    for(var b in brand_ar){
		    	
		    	if($(".productCheck"+brand_ar[b]).length < 1){
					$("#card"+brand_ar[b]).remove();
					console.log(brand_ar[b]+"가 삭제됨");
		    	}
		    	
		    	
			}
		    ////배송비, 총 배송비 변경
			    let newBrandPrice =0;
			    const checkedNum = [];
			    $(".brandPrice").each(function(){  
			    	$(this).val(0);
			    	
			    });
				//모든 checkbox를 검사해서 checked 된 것들만...계산해서 총 상품 가격, 총배송비, 총 결제금액 계산
				$(".del").each(function(){
					if($(this).prop('checked')==true){
						
					    console.log('체크된 상태:'+$(this).val());
					    let productNum=$(this).val();
				
					    checkedNum.push(productNum);
	
					} else{
					    console.log('체크 안 된 상태:'+$(this).val());
	
					}
				});
				console.log("checkedNum:"+checkedNum)
				
				            //체크된 productNum 을 가진 것들.
							for(let p in checkedNum){
								 
								let b_index =$("#productVOPrice"+checkedNum[p]).attr("title");
								let productPrice = $("#productVOPrice"+checkedNum[p]).val();
								
								newBrandPrice = parseInt($(".brandPrice"+b_index).val()) + parseInt(productPrice);
								
								console.log("newBrandPrice:"+newBrandPrice);
								$(".brandPrice"+b_index).val(newBrandPrice);
								
							}
				
				         //모든 brandPrice를 반복돌려서 처리
				         $(".brandPrice").each(function(){
				        	let b_index = $(this).attr("title");
				        	let brandPrice= $(".brandPrice"+b_index).val();
				        	 
				        	console.log("brandPrice:"+brandPrice);
						    
						    if(brandPrice>=30000){//product당 가격의 반복 = brand당 총 가격이 3만원넘으면
						    	console.log(b_index+" b_index is over 30000");
						    
						    	$("#shipping"+b_index).attr("title", 0);
						    } else if(brandPrice==0){ // brand당 총 가격이 0원일때
						    	console.log(b_index+" b_index is 0 zero~~~");
						    	$("#shipping"+b_index).attr("title", 0);
						    } else{  // brand당 총 가격이 3만원 미만 일때
						    
						    	console.log(b_index+" b_index is not over 30000");
						    	$("#shipping"+b_index).attr("title", 3000);
						    	 
	
						    }
				         });
				          
				       //총 배송비
							let totalShipping=0; 
							
							$(".shipping").each(function(){//
								
								let shipping =$(this).attr("title");
								console.log("shipping:"+shipping);
								
								totalShipping= totalShipping+parseInt(shipping);	
								
							});
							 
							console.log(totalShipping);
							
							$("#totalShipping").val(totalShipping);// 총 배송비 입력 오케비
							
							//----------총 결제금액!!
						//총 상품 가격 부터 다시.
						let totalcheckedPrice= 0;
						
						for(let c in checkedNum){
						       $(".productNum_productPrice"+checkedNum[c]).each(function(){ 
						           totalcheckedPrice=totalcheckedPrice+parseInt($(this).val());
						           console.log("checked productPrice: "+parseInt($(this).val()));
						      });
						
						}
						
						   $("#totalPrice").val(totalcheckedPrice);
							
							let payment=totalShipping+parseInt($("#totalPrice").val());
							
							$("#payment").val(payment);  //총 결제금액 입력
							
							
							
							
							//brand별 무료배송여부 표시 
							$(".productPrice").each(function(){ 
								
							    
							    let b_index = $(this).attr("title"); 
							    console.log("b_index:"+b_index);
							     
							    let brandPrice=0; 
								
								
								$(".productPrice"+b_index).each(function(){
									brandPrice=brandPrice+parseInt($(this).val());
							     });
							     
							
							    if(brandPrice>=30000){
							    	console.log(b_index+" is over30000");
							    	$(".freeShipping"+b_index).val(1);
							    	$("#shipping"+b_index).val("배송비 무료");
							
							    } else{
							    	$("#shipping"+b_index).val("배송비 3000원");
							
							    }
								
							});
							//상품구매 버튼표기
							
							 let validity1 =$('input:checkbox[name=validity1]:checked').length;
						    	console.log("validity1:"+validity1);
						    	$('#payBtn').val(validity1+"개 상품 구매하기");
							
							
				         
	
						
					
		   
		}
	})
});
//==============================X눌러 option 삭제  
 $(".delete").click(function () {
	 
	 let index = $(this).attr("title");
	 console.log(index+":index");
	 let cartNum= $("#cartNum"+index).attr("title"); //cartNum
	 console.log(cartNum+":cartNum");
	 let productNum=$(this).parent().attr("title")  //productNum 
	 console.log(productNum+":productNum");
	 let brandNum= $("#carts"+index).attr("title"); //brandnum
	 console.log(brandNum+":brandNum");
	 
	 
	 $.ajax({
		 type:"get",
		 url:"../cart/optionDelete",
		 data:{
			 cartNum: cartNum
		 },
		 success:function(data){
				alert('삭제하였습니다');
				$("#carts"+index).remove();
				console.log(index+"가 삭제됨");
				
				 // 총 상품 가격 다시 계산
				 totalAgain=0;
		
			    $(".cartPricePlus").each(function(){
				totalAgain=totalAgain+parseInt($(this).val());
			    });
			
			    $("#totalPrice").val(totalAgain);
				 //같은 상품안에 가지고 있는 다른 옵션이 있는지 찾아오고 없으면 상품까지 삭제
				 if($(".cartCheck"+productNum).length < 1){
					 $("#products"+productNum).remove();
					 console.log(productNum+"productNum 가 삭제됨");
				 }
				 
				 //같은 brand에 가지고 있는 다른 상품이 있는지 찾아 보고 없으면 brand 카드까지 삭제
			  
			    	
			    	if($(".productCheck"+brandNum).length < 1){
						$("#card"+brandNum).remove();
						console.log(brandNum+"brandNum가 삭제됨");
			    	}
				
			    ////배송비, 총 배송비 변경
			    	let newBrandPrice =0;
			        const checkedNum = [];
			        $(".brandPrice").each(function(){  
			        	$(this).val(0);
			        	
			        });
			    	//모든 checkbox를 검사해서 checked 된 것들만...계산해서 총 상품 가격, 총배송비, 총 결제금액 계산
			    	$(".del").each(function(){
			    		if($(this).prop('checked')==true){
			    			
			    		    console.log('체크된 상태:'+$(this).attr("title"));
			    		    let productNum=$(this).attr("title");
			    	
			    		    checkedNum.push(productNum);
			    		} else{
			    		    console.log('체크 안 된 상태:'+$(this).attr("title"));
			    		}
			    	});
			    	console.log("checkedNum:"+checkedNum)
			    	
			    	            //체크된 productNum 을 가진 것들.
			    				for(let p in checkedNum){
			    					 
			    					let b_index =$("#productVOPrice"+checkedNum[p]).attr("title");
			    					let productPrice = $("#productVOPrice"+checkedNum[p]).val();
			    					
			    					newBrandPrice = parseInt($(".brandPrice"+b_index).val()) + parseInt(productPrice);
			    					
			    					console.log("newBrandPrice:"+newBrandPrice);
			    					$(".brandPrice"+b_index).val(newBrandPrice);
			    					
			    				}
			    	
			    	         //모든 brandPrice를 반복돌려서 처리
			    	         $(".brandPrice").each(function(){
			    	        	let b_index = $(this).attr("title");
			    	        	let brandPrice= $(".brandPrice"+b_index).val();
			    	        	 
			    	        	console.log("brandPrice:"+brandPrice);
			    			    
			    			    if(brandPrice>=30000){//product당 가격의 반복 = brand당 총 가격이 3만원넘으면
			    			    	console.log(b_index+" b_index is over 30000");
			    			    
			    			    	$("#shipping"+b_index).attr("title", 0);
			    			    } else if(brandPrice==0){ // brand당 총 가격이 0원일때
			    			    	console.log(b_index+" b_index is 0 zero~~~");
			    			    	$("#shipping"+b_index).attr("title", 0);
			    			    } else{  // brand당 총 가격이 3만원 미만 일때
			    			    
			    			    	console.log(b_index+" b_index is not over 30000");
			    			    	$("#shipping"+b_index).attr("title", 3000);
			    			    	 
			    			    }
			    	         });
			    	          
			    	       //총 배송비
			    				let totalShipping=0; 
			    				
			    				$(".shipping").each(function(){//
			    					
			    					let shipping =$(this).attr("title");
			    					console.log("shipping:"+shipping);
			    					
			    					totalShipping= totalShipping+parseInt(shipping);	
			    					
			    				});
			    				 
			    				console.log(totalShipping);
			    				
			    				$("#totalShipping").val(totalShipping);// 총 배송비 입력 오케비
			    				
			    				//----------총 결제금액!!
			    			//총 상품 가격 부터 다시.
			    			let totalcheckedPrice= 0;
			    			
			    			for(let c in checkedNum){
			    			       $(".productNum_productPrice"+checkedNum[c]).each(function(){ 
			    			           totalcheckedPrice=totalcheckedPrice+parseInt($(this).val());
			    			           console.log("checked productPrice: "+parseInt($(this).val()));
			    			      });
			    			
			    			}
			    			
			    			   $("#totalPrice").val(totalcheckedPrice);
			    				
			    				let payment=totalShipping+parseInt($("#totalPrice").val());
			    				
			    				$("#payment").val(payment);  //총 결제금액 입력
			    				
			    				
			    				
			    				//brand별 무료배송여부 표시 
			    				$(".productPrice").each(function(){ 
			    					
			    				    
			    				    let b_index = $(this).attr("title"); 
			    				    console.log("b_index:"+b_index);
			    				     
			    				    let brandPrice=0; 
			    					
			    					
			    					$(".productPrice"+b_index).each(function(){
			    						brandPrice=brandPrice+parseInt($(this).val());
			    				     });
			    				     
			    				
			    				    if(brandPrice>=30000){
			    				    	console.log(b_index+" is over30000");
			    				    	$(".freeShipping"+b_index).val(1);
			    				    	$("#shipping"+b_index).val("배송비 무료");
			    				
			    				    } else{
			    				    	$("#shipping"+b_index).val("배송비 3000원");
			    				
			    				    }
			    					
			    				});
			    				
			    				//상품구매 버튼표기
								
								 let validity1 =$('input:checkbox[name=validity1]:checked').length;
							    	console.log("validity1:"+validity1);
							    	$('#payBtn').val(validity1+"개 상품 구매하기");
							    	
			    				
			    				
			    	         
				
				
				}
	 })
	
 });
 
</script>

<script type="text/javascript">
/* var list = new Array();
list.push(${cartVO.cartNum});
console.log(list); */
/* 
//직접입력 인풋박스 기존에는 숨어있다가
let amount  = $("#amountSelect").attr("title");
console.log(amount)
for (i=1; i < cnt[province].length;i++){ 
		sel.options[i] = new Option(cnt[province][i], cnt[province][i]);
		if( amount == sel.options[i].value){
		    sel.options[i].selected = true;
	
		} 
$("#amountSelect").val(amount).prop("selected", true); 
		
$("#directInputBox").hide();
 */
/* 
$(".amountSelect").change(function() {
              //직접입력을 누를 때 나타남
		if($(".amountSelect").val() == "directInput") {
			$(".directInputBox").show();
			$(".amountSelect").hide();
		}  else {
			$(".directInputBox").hide();
		}
	}) 
	
});
  
 */
 
//할인 금액 계산

 $(".fixedPrice").each(function(){//product의 정가 
 	let productNum = $(this).attr("title"); //productNum
 	let discountPrice= $(this).attr("data-discount-price");
 	let fixedPrice=  $(this).val();
 	
      console.log("productNum/discountPrice/fixedPrice:"+productNum+"/"+discountPrice+"/"+fixedPrice);
 	
 	let productAmount = 0; //같은 상품들의 수량
 	$(".directInputBox"+productNum).each(function(){
 		console.log("productNum/amount:"+productNum+"/"+$(this).val());
 		productAmount=productAmount+parseInt($(this).val());//amount를 반복해서 더해줌.
      });
 	
 	console.log("productNum/productAmount:"+productNum+"/"+productAmount);
 	
 	let discountPerProduct= (fixedPrice-discountPrice)*productAmount; //상품 당 할인액
 	
 	console.log("discountPerProduct:"+discountPerProduct);
 	
 	$("#discount"+productNum).val(discountPerProduct); //상품 할인액 입력
 	
 });

 let totalDiscount=0;// 총 할인금액 
 $(".discount").each(function(){
 	totalDiscount = totalDiscount+ parseInt($(this).val());
 });

 $("#totalDiscount").val(totalDiscount); //  총 할인금액 입력

 totalFixedPrice = total+ totalDiscount;	// total 에서 총 할인금액을  더하면  정가들의 합!

 console.log("totalFixedPrice:"+totalFixedPrice)

 $("#totalPrice").val(totalFixedPrice); // 총 상품 금액 입력



 //무료배송여부 

 $(".productPrice").each(function(){ 
 	
     let b_index = $(this).attr("title"); //brand index
      
     let brandPrice=0;
 	
 	$(".productPrice"+b_index).each(function(){ //같은 브랜드의 모든 Product의 값들 반복해서 더해줌 
 		brandPrice=brandPrice+parseInt($(this).val());
      });
      
 	console.log("brandPrice:"+brandPrice);
     
     if(brandPrice>=30000){//한 브랜드에서 구매한게 3만원 이상
     	console.log(b_index+" is over30000");
     	$(".brandShipping"+b_index).each(function(){
     		$(this).val(0);//cartVO is Free에 0 넣기 반복돌리자
     	});
     	
     	$("#shipping"+b_index).val("배송비 무료");
     	$("#shipping"+b_index).attr("title", 0);
     	
     } else{//1.한 브랜드에서 구매한게 3만원 이하 
     	 let shipCheck=false;
     	//2.그 브랜드의 어떤 productVO shippingFee도 0이 아님  
     	//1+2 의 조건이면  그 중 가장 적은 shippingFee 한번만 적용
     	$(".shippingFee"+b_index).each(function(){
     		if($(this).val()==0){//3. 그 브랜드에서 구매한 product shippingFee 중 0이 하나라도 있음
     			shipCheck=true;
     		}
     	});
     	
     	if(shipCheck==true){
     		
 	    	//1+3 의 조건이면 그 브랜드 안 모든  cartVO is free의 true, 브랜드 배송비 무료
 			$(".brandShipping"+b_index).each(function(){
 	    		$(this).val(0);//cartVO is Free에 0 넣기 반복돌리자
 	    	});
 			$("#shipping"+b_index).val("배송비 무료");
 	    	$("#shipping"+b_index).attr("title", 0);
     		
     	} else{
     		
     		let shipFee=100000; //shipFee에 가장 작은 배송비를 넣을 것 
     		$(".shippingFee"+b_index).each(function(){
     			let shipFee2=$(this).val();
     			if(shipFee2 <= shipFee){
     				shipFee=shipFee2;
     			}
     		});
     		
     		$(".brandShipping"+b_index).each(function(){
 	    		$(this).val(shipFee);//cartVO is Free에 찾은 가장 작은 배송비 넣기 반복돌리자
 	    	});
     	
     	$("#shipping"+b_index).val("배송비"+shipFee+"원");
     	$("#shipping"+b_index).attr("title", shipFee);
     	}
     	
     }
 	
 });
 //총 배송비
 let totalShipping=0; 
 $(".shipping").each(function(){
 	
 	let shipping =$(this).attr("title");
 	console.log("shipping:"+shipping);
 	totalShipping= totalShipping+parseInt(shipping);	
 });
  
 console.log(totalShipping);
 $("#totalShipping").val(totalShipping);// 총 배송비 입력 
 //----------총 결제금액
 let payment=totalShipping+total;
 $("#payment").val(payment);  //총 결제금액 입력
 //상품구매 버튼표기
 let validity1 =$('input:checkbox[name=validity1]').length;
 console.log(validity1);
 $('#payBtn').val(validity1+"개 상품 구매하기");
 // ----------세팅끝
  
  /////////////////////  real copy
  
  
    //모든 brandPrice를 반복돌려서 처리
	         $(".brandPrice").each(function(){
	        	let b_index = $(this).attr("title");
	        	let brandPrice= $(".brandPrice"+b_index).val();
	        	 
	        	console.log("brandPrice:"+brandPrice);
			    
			    /////////////
			    
			    if(brandPrice>=30000){//한 브랜드에서 구매한게 3만원 이상
			    	console.log(b_index+" is over30000");
			    	$(".brandShipping"+b_index).each(function(){
			    		$(this).val(0);//cartVO is Free에 0 넣기 반복돌리자
			    	});
			    	
			   
			    	$("#shipping"+b_index).attr("title", 0);
			    } else{//1.한 브랜드에서 구매한게 3만원 이하 
			    	 let shipCheck=false;
			    	//2.그 브랜드의 어떤 productVO shippingFee도 0이 아님  ->false유지
			    	//1+2 의 조건이면  그 중 가장 적은 shippingFee 한번만 적용
			    	
			    		
					    	$(".shippingFee"+b_index).each(function(){ //+ checked 된 애들중..
					    		 let productNum= $(this).attr("data-productNum");
					    		 for(let p in checkedNum){
					    			  if(checkedNum[p] == productNum){
					    				   console.log("checkedNum[p] == productNum입장");
					    				  if($("#shippingFee"+productNum).val()==0){//3. 그 브랜드에서 구매한 product shippingFee 중 0이 하나라도 있음
					    					  console.log("checkedNum[p] == productNum 그 이후 입장");
					    					  shipCheck=true;
								    		  }
					    			      }
					    			 
					    		      }
					    		
					    	      });
			    	
			    	
			    	if(shipCheck==true){
			    		
				    	//1+3 의 조건이면 그 브랜드 안 모든  cartVO is free의 true, 브랜드 배송비 무료
						$(".brandShipping"+b_index).each(function(){
				    		$(this).val(0);//cartVO is Free에 0 넣기 반복돌리자
				    	});
				
				    	$("#shipping"+b_index).attr("title", 0);
			    		
			    	} else{
			    		
			    		let shipFee=100000; //shipFee에 가장 작은 배송비를 넣을 것 
			    		$(".shippingFee"+b_index).each(function(){
			    			 let productNum= $(this).attr("data-productNum");
				    		 	for(let p in checkedNum){
				    			  	if(checkedNum[p] == productNum){
			    							let shipFee2=$(this).val();
			    								if(shipFee2 <= shipFee){
			    									shipFee=shipFee2;
			    									}
				    			  	}
				    		 	}
			    		});
			    		
			    		
			    		console.log("b_index/shipFee"+b_index+"/"+shipFee)
			    	
			    		$(".brandShipping"+b_index).each(function(){
				    		$(this).val(shipFee);//cartVO is Free에 찾은 가장 작은 배송비 넣기 반복돌리자
				    	});
			    	
			    	$("#shipping"+b_index).attr("title", shipFee);
			    	}
				
	               };//if end 
	         
	         });
	          
	       //총 배송비
	       
	       
	       //////////////////////
 
	       
	       //모든 brandPrice를 반복돌려서 처리
	         $(".brandPrice").each(function(){
	        	let b_index = $(this).attr("title");
	        	let brandPrice= $(".brandPrice"+b_index).val();
	        	 
	        	console.log("brandPrice:"+brandPrice);
			    
			    /////////////
			    
			    if(brandPrice>=30000){//한 브랜드에서 구매한게 3만원 이상
			    	console.log(b_index+" is over30000");
			    	$(".brandShipping"+b_index).each(function(){
			    		$(this).val(0);//cartVO is Free에 0 넣기 반복돌리자
			    	});
			    	
			   
			    	$("#shipping"+b_index).attr("title", 0);
			    } else{//1.한 브랜드에서 구매한게 3만원 이하 
			    	 let shipCheck=false;
			    	//2.그 브랜드의 어떤 productVO shippingFee도 0이 아님  ->false유지
			    	//1+2 의 조건이면  그 중 가장 적은 shippingFee 한번만 적용
			    	
			    		
					    	$(".shippingFee"+b_index).each(function(){ //+ checked 된 애들중..
					    		 let productNum= $(this).attr("data-productNum");
					    		 for(let p in checkedNum){
					    			  if(checkedNum[p] == productNum){
					    				   console.log("checkedNum[p] == productNum입장");
					    				  if($("#shippingFee"+productNum).val()==0){//3. 그 브랜드에서 구매한 product shippingFee 중 0이 하나라도 있음
					    					  console.log("checkedNum[p] == productNum 그 이후 입장");
					    					  shipCheck=true;
								    		  }
					    			      }
					    			 
					    		      }
					    		
					    	      });
			    	
			    	
			    	if(shipCheck==true){
			    		
				    	//1+3 의 조건이면 그 브랜드 안 모든  cartVO is free의 true, 브랜드 배송비 무료
						$(".brandShipping"+b_index).each(function(){
				    		$(this).val(0);//cartVO is Free에 0 넣기 반복돌리자
				    	});
				
				    	$("#shipping"+b_index).attr("title", 0);
			    		
			    	} else{
			    		
			    		let shipFee=100000; //shipFee에 가장 작은 배송비를 넣을 것 
			    		$(".shippingFee"+b_index).each(function(){
			    			 
			    							let shipFee2=$(this).val();
			    								if(shipFee2 <= shipFee){
			    									shipFee=shipFee2;
			    									}
				    			  	}
				    		 	}
			    		});
			    		
			    		
			    		console.log("b_index/shipFee"+b_index+"/"+shipFee)
			    	
			    		$(".brandShipping"+b_index).each(function(){
				    		$(this).val(shipFee);//cartVO is Free에 찾은 가장 작은 배송비 넣기 반복돌리자
				    	});
			    	
			    	$("#shipping"+b_index).attr("title", shipFee);
			    	}
				
	               };//if end 
	         
	         });
	       
	       
	       ////////////////
	      	//----------총 결제금액!!
			//총 상품 가격 부터 다시.
			let totalcheckedPrice= 0;
			
			for(let c in checkedNum){
			       $(".productNum_productPrice"+checkedNum[c]).each(function(){ 
			           totalcheckedPrice=totalcheckedPrice+parseInt($(this).val());
			           console.log("checked productPrice: "+parseInt($(this).val()));
			      });
			
			}
			//주문결제 페이지의 총 상품 금액 = 장바구니의 최종결제 금액 이기때문에 먼저 저장
			$("#itemsPrice").val(totalcheckedPrice);
			
			//할인 금액 계산
			
			$(".fixedPrice").each(function(){
				let productNum = $(this).attr("title"); //productNum
				let discountPrice= $(this).attr("data-discount-price");
				let fixedPrice=  $(this).val();
				
				let productAmount = 0; //같은 상품들의 수량
				$(".directInputBox"+productNum).each(function(){
					productAmount=productAmount+parseInt($(this).val());//amount를 반복해서 더해줌.
			     });
				
				let discountPerProduct= (fixedPrice-discountPrice)*productAmount; //상품 당 할인액
				
				$("#discount"+productNum).val(discountPerProduct); //상품 할인액 입력
				
			});
			
			let totalDiscount=0;// 총 할인금액 
			for(let c in checkedNum){
				totalDiscount = totalDiscount+ parseInt($("#discount"+checkedNum[c]).val());
			}

			$("#totalDiscount").val(totalDiscount); //  총 할인금액 입력

			totalcheckedPrice = totalcheckedPrice + totalDiscount;	// total 에서 총 할인금액을  더하면  정가들의 합!


			$("#totalPrice").val(totalcheckedPrice); // 총 상품 금액 입력

		
				let payment=totalShipping+parseInt($("#totalPrice").val());
				
				$("#payment").val(payment);  //총 결제금액 입력
		
});



-===================
	

	</div>


	<script type="text/javascript">


	$(".shipping").each(function(){
		
		let brandNum = $(this).attr("title");
		let brandShipping =$("#brandShipping"+brandNum).val();
		$("#shipping"+brandNum).text(brandShipping);
		
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

				
</script>

	<script type="text/javascript" src="/js/cartList.js" ></script>  
<c:import url="../template/footer.jsp"></c:import>
</body>




	

	
	
    
    