<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">


.opdi{


    width: 90px;
    height: 30px;
	background-color: #FFF;
	color:#black;
	border: #FFF solid 3px;
	font-size: 13px;
	

}

.opdi:hover, opdi:focus, .opdi:active, .opdi.active, .open .dropdown-toggle.opdi {
 
	background-color: #FFF;
	color:#cccccc;
	border: #FFF solid 3px;
	
}
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
.productImg{
	width: 64px;
	height: 64px;
	margin-right:15px;
}
.productName{
  
  font-weight: bold;
  font-size: 16px;
}
.shippingType{
   font-size: 12px;
    padding-bottom: 20px;
}

.num{
 font-weight: bold;
}
</style>

<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<main>

<div class="container-fluid rounded bg-white" id="carts">
    <div class="row d-flex justify-content-center pb-5">
        <div class="col-sm-5 col-md-6 ml-1">
        
         
         
            <!-- d-flex -->
    
                  <div class="d-flex justify-content-between d-top">
				    <div class="p-2 ">
				               <div class="custom-control custom-checkbox mb-0">
							      <input type="checkbox" checked class="custom-control-input" id="allCheck" name="example1">
							      <label class="custom-control-label" for="allCheck" style="padding-top:10px; font-size:18px;">모두선택</label>
							    </div>
		                       
				    </div>
				   
				    <div class="p-2"><button type="button" class="btn opdi" id="selectedDelete" style="font-size:16px; width: 100px; ">선택삭제</button></div>
				  </div>      
            
            
			   <!-- d-flex end -->
    
            
        <section class="">
        <!-- brand -->
        <c:forEach items="${brandAr}"  var="brandVO" varStatus="b">

         <div id="card${brandVO.brandNum}" class="card">
			  <div class="card-header">
	                <div class="p-1" style="text-align: center; font-size:16px;"> <c:out value="${brandVO.companyName}"/> 배송</div>
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
					<img class="productImg" alt="" src="/upload/productImages/${productVO.productPic}">
				    <div class="media-body">
				      <div class="mt-0 mb-1 productName">[${brandVO.brandName}] ${productVO.productName}</div>
				         <div class="shippingType">일반택배</div>
				    </div>
					  <c:forEach items="${cartAr}" var="cartVO" varStatus="i">
					  <c:if test="${productVO.productNum eq cartVO.productNum}">
					     
					   <!-- option -->
					     <li id="carts${cartVO.cartNum}" title="${cartVO.brandNum}">
					       <input type="hidden" class="cartNum cartNum${productVO.productNum}" id="cartNum${cartVO.cartNum}" title="${cartVO.cartNum}">
					       <input type="hidden" class="unitPrice" id="unitPrice${cartVO.cartNum}" name="unitPrice" title="${cartVO.unitPrice}" value="${cartVO.unitPrice}">
						   <input type="hidden" id="brandShipping${b.index}" class="brandShipping${b.index} brandShipping" data-cartNum="${cartVO.cartNum}" name="brandShipping" value=""/> 		     
							  <div title="${cartVO.productNum}" style="width:100%; height:100%; padding-bottom:40px; word-break:break-all;word-wrap:break-word;" class="cartCheck${cartVO.productNum} alert alert-secondary alert-dismissible fade show" role="">
						  		<div class="option">   ${cartVO.unitName}  </div>
						  		   <div style="width:70px; height:20px; font-size:12px; float: left;">
						  		     
									     <!--  숫자만 입력할수 있도록 type number 지정 -->
									     <input style="width:70px; height:20px; ime-mode:disabled;" type="number" min="1"  class="directInputBox directInputBox${productVO.productNum}" data-product-num="${productVO.productNum}" title="${cartVO.cartNum}" id="directInputBox" name="amount" value="${cartVO.amount}"/>
									</div>
									<div class="num" style=" height:23px; font-size:16px; padding-bottom:20px; font-weight: bold; float: right;">
										       <input type="text" readonly="readonly" id="cartVOPrice${cartVO.cartNum}" class="cartPricePlus${productVO.productNum} cartPricePlus num" title="${productVO.productNum}" name="cartPrice" value="${cartVO.cartPrice}" style=" width:180px; height:20px; background-color:transparent;border:0 solid black; text-align:right;" />
										  원 
									</div> 
							  <button type="button" class="close delete"  title="${cartVO.cartNum}" data-productNum="${cartVO.productNum}"  data-brandNum="${cartVO.brandNum}" aria-label="Close">
							    <span aria-hidden="true">&times;</span>
							  </button>
							 </div>
					     </li>
				      <!-- option end-->
				      
				      </c:if>
				      </c:forEach>
				      	<div class="d-flex justify-content-between product-bottom">
				    		<div class="p-2" style="font-size:14px;" >
				    			<button class="opdi"> 옵션변경 </button> | <button id="directPay${productVO.productNum}" class="opdi directPay" title="${productVO.productNum}"> 바로결제</button>
				    		</div>
				    		<!-- fixed shippingFee per Product -->
				    	        <input type="hidden" id="shippingFee${productVO.productNum}" class="shippingFee${b.index}" data-productNum="${productVO.productNum}"  value="${productVO.shippingFee}"/> 	     
				    	    <!-- Discount per Product -->
				    	        <input type="hidden" id="fixedPrice${productVO.productNum}" class="fixedPrice" title="${productVO.productNum}" data-discount-price="${productVO.discountPrice}" value="${productVO.productPrice}"/> 		     
						  	    <input type="hidden" class="amount${productVO.productNum}"  value=""/> 	     
				    		    <input type="hidden" id="discount${productVO.productNum}" class="discount" value=""/> 	
				    	   	<!-- productPrice -->
				    		<div class="p-2 num" style="font-size:18px;  font-weight: bold;" title="${productVO.productNum}">
				    				<input  readonly="readonly" value="" id="productVOPrice${productVO.productNum}" class="productPrice${b.index}  productNum_productPrice${productVO.productNum} productPrice num" title="${b.index}" style=" height:30px; background-color:transparent;border:0 solid black; text-align:right;">원
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
                    <div class="ml-auto num">  		
                         <!-- 정가의 합  -->		    			
						<input readonly="readonly" id="totalPrice" class="totalPrice num" style=" width:100px; height:30px; background-color:transparent;border:0 solid black; text-align:right;">원
                         <!-- 할인된 가격의 합  -->	
                        <input type="hidden" readonly="readonly" name="itemsPrice" id="itemsPrice"  style=" width:100px; height:30px; background-color:transparent;border:0 solid black; text-align:right;">
                     </div>
                </div>
                <div class="p-2 d-flex">
                    <div class="col-6">총 배송비</div>
                    <div class="ml-auto num">
                      <input readonly="readonly" name="shippingFee" id="totalShipping" class="totalShipping num" style=" width:100px; height:30px; background-color:transparent;border:0 solid black; text-align:right;">원
                    </div>
                </div>
                      <div class="p-2 d-flex">
                    <div class="col-6">총 할인금액</div>
                    <div class="ml-auto num">
                       - <input readonly="readonly" name="totalDiscount" id="totalDiscount" class="totalDiscount num" style=" width:70px; height:30px; background-color:transparent;border:0 solid black; text-align:right;">원
                    </div>
                </div>
             
                <div class="border-top px-4 mx-3"> </div>
                
             
                <div class="border-top px-4 mx-3"></div>
                
                <div class="p-2 d-flex pt-3">
                    <div class="col-6"><b>결제 금액</b></div>
                    <div class="ml-auto num">
                   	 <b class="green">
                   	   <input readonly="readonly" name="payment" id="payment" class="payment num" style=" width:100px; height:30px; background-color:transparent;border:0 solid black; text-align:right;">원
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
         
        </div>
        
        	
    </div>
</div>
     
     
     
     
     
     
 <script type="text/javascript" src="/js/cartList.js" ></script>  
  <script type="text/javascript" src="/js/cartListDel.js" ></script>  
     
 
<script type="text/javascript">

	//<!-- 상품구매하기 버튼 누를시 -->
	$("#payBtn").click(function(){
		// <!-- ////각 cartVO의 validity 검사-> ajax를 이용해 DB에 업데이트 
		// Ajax 끝마치고 submit 하기 -->
	 const validity_ar=[];
	 const un_validity_ar=[];
	$(".del").each(function(){
		if($(this).prop("checked")){
			
			let productNum=$(this).attr("title");
			
			$(".cartNum"+productNum).each(function(){
				
				validity_ar.push($(this).attr("title"));
			});
			
		} else{
			let productNum=$(this).attr("title");
	
			$(".cartNum"+productNum).each(function(){
				
				 un_validity_ar.push($(this).attr("title"));
			});
			
		}
		
	});
	
	
	$(".brandShipping").each(function(){ //최종 결정된 브랜드별 배송료를 각 cartVO brandShipping에 입력해준다. 
	    let brandShipping= $(this).val(); // 배송료
	    let cartNum =$(this).attr("data-cartNum"); //cartNum
	    
	    console.log("brandshipping update cartnum:"+ cartNum);
	    
	    $.ajax({
			type: "post",
			url:"../cart/brandShipUpdate",
			async:false,
			data:{
				brandShipping:brandShipping,
				cartNum:cartNum
			},
			success:function(data){
				data = data.trim();
	            if(data>0){
					console.log('브랜드별 배송료 업로드 성공');

				 }else {
				
				}
			}
		})
		
	    
		
	});
	
	
	
	
	$.ajax({
		type: "post",
		url:"../cart/validityUpdate",
		traditional: true,
		async:false,
		data:{
			cartNum:validity_ar,
			unCartNum:un_validity_ar
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
	

	// total에서 총 할인금액을 빼면 총 상품금액이 된다. 
	
	console.log("price:"+price);
    
	console.log("total:"+total);
	
});

//주문결제 페이지의 총 상품 금액 = 장바구니의 최종결제 금액 이기때문에 먼저 저장
$("#itemsPrice").val(total);

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
    			console.log("shippingFee 중 0이 하나라도 있음"+b_index);
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
					    				  if($("#shippingFee"+productNum).val()==0){
					    					  
					    					  //3. 그 브랜드에서 구매한 product shippingFee 중 0이 하나라도 있음->true
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
			    		$(".shippingFee"+b_index).each(function(){ //fixed shippingFee per Product 
			    			 let productNum= $(this).attr("data-productNum"); // 그 브랜드안의 상품 넘버 반복
				    		 	for(let p in checkedNum){
				    		 		   console.log("checkedNum[p]:"+checkedNum[p]+"productNum:"+productNum);
					    			  	if(checkedNum[p] == productNum){ // checked productNum과 이 넘버가 같으면  //근데 하나도 같은 넘버가 없다면??
				    							let shipFee2=$(this).val(); //fixed shippingFee per Product  
				    							
				    								if(shipFee2 <= shipFee){
				    									shipFee=shipFee2;
				    									}
				    			  	}
				    		 	}
			    			 
			    		});
			    		
			    	   if(shipFee==100000){//근데 하나도 같은 넘버가 없어서 if안에 한번도 못들어 갔으면 0 을 넣어줘
			    		   
			    		   shipFee=0;
			    	   }
			    		
			    		
			    		console.log("b_index/shipFee"+b_index+"/"+shipFee)
			    	
			    		$(".brandShipping"+b_index).each(function(){
				    		$(this).val(shipFee);//cartVO is Free에 찾은 가장 작은 배송비 넣기 반복돌리자
				    	});
			    	
			    	$("#shipping"+b_index).attr("title", shipFee);
			    	}
				
	               };//if end 
	         
	         });
	          
	       //총 배송비
				let totalShipping=0; 
				
				$(".shipping").each(function(){//
					
					let shipping =$(this).attr("title");
					console.log("shipping:"+shipping);
					
					totalShipping= totalShipping+parseInt(shipping);	
					
				});
				 
				console.log(totalShipping);
				
				$("#totalShipping").val(totalShipping);// 총 배송비 입력 
				
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

			totalPrice = totalcheckedPrice + totalDiscount;	// total 에서 총 할인금액을  더하면  정가들의 합!


			$("#totalPrice").val(totalPrice); // 총 상품 금액 입력

		
				let payment=totalShipping+parseInt(totalcheckedPrice);
				
				$("#payment").val(payment);  //총 결제금액 입력
		
});
				
				
				
	
	
//------------check box(범위: product)를 건들때 마다 총 상품 금액 변경   end


	

</script>


</main>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>