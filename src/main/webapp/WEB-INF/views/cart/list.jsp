<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

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
</style>

<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<form name="calFrm" action="./update" method="post"> 
<div class="container-fluid rounded bg-white" id="carts">
    <div class="row d-flex justify-content-center pb-5">
        <div class="col-sm-5 col-md-6 ml-1">
        
         
         
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
					  <input type="checkbox" checked class="custom-control-input del" id="Check${p.index}" title="${p.index}" value="${productVO.productNum}">
					  <label class="custom-control-label" for="Check${p.index}"></label>
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
					       <input type="hidden" class="cartNum " id="cartNum${i.index}" title="${cartVO.cartNum}">
					       <input type="hidden" class="optionPrice" id="optionPrice${i.index}" name="optionPrice" title="${cartVO.optionPrice}" value="${cartVO.optionPrice}">
						   <input type="hidden" class="freeShipping${b.index}" name="isFree" value=""/> 		     
						   
							  <div title="${cartVO.productNum}" style="width:100%; height:100%; padding-bottom:40px; word-break:break-all;word-wrap:break-word;" class="cartCheck${cartVO.productNum} alert alert-secondary alert-dismissible fade show" role="">
							  		<div class="option">  <c:out value="${optionList.optionKinds}"/>: ${optionList.optionName} </div>
							  		   <div style="width:70px; height:20px; font-size:12px; float: left;">
							  		     
							  		   
											<%-- <select style="width:70px; height:20px;" class="form-control amountSelect" id="amountSelect${cartVO.cartNum}" title="${cartVO.amount}" name="amount" value="${cartVO.amount}">
										      <option value="1">1</option>
										      <option value="2">2</option>
										      <option value="3">3</option>
										      <option value="4">4</option>
										      <option value="5">5</option>
										      <option value="6">6</option>
										      <option value="7">7</option>
										      <option value="8">8</option>
										      <option value="9">9</option>
										      <option value="directInput">10+</option>
										    </select> --%>
										     <!-- 상단의 select box에 수량 10개이상 선택시 나타날 인풋박스 -->
										     <input style="width:70px; height:20px;" type="text" class="directInputBox"  title="${i.index}" id="directInputBox" name="amount" value="${cartVO.amount}"/>
										</div>
										<div style="width:200px; height:23px; font-size:16px;  font-weight: bold; float: right;">
										      
											       <input readonly="readonly" id="cartVOPrice${i.index}" class="cartPricePlus${p.index} cartPricePlus" title="${p.index}" name="cartPrice" value="${cartVO.cartPrice}" style=" width:180px; height:20px; background-color:transparent;border:0 solid black; text-align:right;" />
											  원
					
										</div> 
							  <button type="button" class="close delete"  title="${i.index}" data-dismiss="" aria-label="Close">
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
				    		
				    		<!-- productPrice -->
				    		<div class="p-2" style=" font-size:18px;  font-weight: bold;">
				    				<input  readonly="readonly" id="productVOPrice${p.index}" class="productPrice${b.index}  productPrice" title="${b.index}" style=" width:200px; height:30px; background-color:transparent;border:0 solid black; text-align:right;">원
				    			
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
            <div class="bg-light rounded d-flex flex-column">
                <div class="p-2 ml-3">
             
                </div>
                <div class="p-2 d-flex">
                    <div class="col-6">총 상품 금액</div>
                    <div class="ml-auto">  				    			
                    	<input readonly="readonly" id="totalPrice" class="totalPrice" style=" width:100px; height:30px; background-color:transparent;border:0 solid black; text-align:right;">원
                    </div>
                </div>
                <div class="p-2 d-flex">
                    <div class="col-6">총 배송비</div>
                    <div class="ml-auto">
                      <input readonly="readonly" id="totalShipping" class="totalShipping" style=" width:100px; height:30px; background-color:transparent;border:0 solid black; text-align:right;">원
                    </div>
                </div>
                      <div class="p-2 d-flex">
                    <div class="col-6">총 할인금액</div>
                    <div class="ml-auto">0원</div>
                </div>
             
                <div class="border-top px-4 mx-3"> </div>
                
             
                <div class="border-top px-4 mx-3"></div>
                
                <div class="p-2 d-flex pt-3">
                    <div class="col-6"><b>결제 금액</b></div>
                    <div class="ml-auto">
                   	 <b class="green">
                   	   <input readonly="readonly" id="payment" class="payment" style=" width:100px; height:30px; background-color:transparent;border:0 solid black; text-align:right;">원
                   	 </b>
                    </div>
                </div>
            </div>
            
                <div> <a href="../order/insert"><input type="button"  value="개 상품 구매하기" class="btn btn-info btn-block pay"></a> </div>
       
        </div>
        
    </div>
</div>
	</form>		
<script type="text/javascript">
//--------첫 로딩 시 금액 세팅

let total=0; //총 상품 금액

$(".cartPricePlus").each(function(){ 
	total=total+parseInt($(this).val());

    
    let p_index = $(this).attr("title"); //productAr의 index
    console.log("p_index:"+p_index);
     
    let price=0; //각 option들의 가격을 더한 product범위의 가격
	
	
	$(".cartPricePlus"+p_index).each(function(){
		price=price+parseInt($(this).val());
     });
     
	$("#productVOPrice"+p_index).val(price); // product당 가격(=option가격들의 합) 세팅
	
	console.log("price:"+price);
    
	console.log("total:"+total);
	

});

$("#totalPrice").val(total); // 총 상품 금액 입력

//------------check box를 건들때 마다 총 상품 금액 변경



//무료배송여부 
$(".productPrice").each(function(){ 
	
    
    let b_index = $(this).attr("title"); 
    console.log("b_index:"+b_index);
     
    let brandPrice=0; 
	
	
	$(".productPrice"+b_index).each(function(){
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


// ------세팅끝



	
//--------------------수량을 변경하면 바뀌는 금액들

$(".directInputBox").keyup(function(){ 
	
	let index = $(this).attr("title"); // cartVO의 index숫자
	let don = $("#optionPrice"+index).val(); //단가
	
	let p= $(this).val()*don; // 변화된 option 가격
	$("#cartVOPrice"+index).val(p); // 변화된 option 가격 표시
	
	//----------------option 가격이 변하면 실행되는 함수
	$("#cartVOPrice"+index).on('input', function() {
	    
	    let p_index = $(this).attr("title"); 
	   
	    let price=0; //각 option들의 가격을 더한 product범위의 가격
		
		
		$(".cartPricePlus"+p_index).each(function(){
			price=price+parseInt($(this).val());
	     });
	     
		$("#productVOPrice"+p_index).val(price);
		
		//-----총 상품 금액 변경
		totalAgain=0;
		
		$(".cartPricePlus").each(function(){
			totalAgain=totalAgain+parseInt($(this).val());
		});
		
		$("#totalPrice").val(totalAgain);
		
	});
	
	//----------readonly input의 value가 변한 걸 감지하기 위한 함수 
	let $input = $("#cartVOPrice"+index);


	(function ($) {
	    var originalVal = $.fn.val;
	    $.fn.val = function (value) {
	        var res = originalVal.apply(this, arguments);
	 
	        if (this.is('input:text') && arguments.length >= 1) {
	            // this is input type=text setter
	            this.trigger("input");
	        }
	 
	        return res;
	    };
	})(jQuery);
	//---------------------
	
	//배송비, 총 배송비 변경
		//무료배송여부 
			$(".productPrice").each(function(){ 
				
			    
			    let b_index = $(this).attr("title"); 
			    console.log("b_index:"+b_index);
			     
			    let brandPrice=0; 
				
				
				$(".productPrice"+b_index).each(function(){
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
			
			let payment=totalShipping+parseInt($("#totalPrice").val());
			
			$("#payment").val(payment);  //총 결제금액 입력
			
				

	
	 //--------ajax DB Update (완성!!)
	let amount = $(this).val();
	let cartPrice=$("#cartVOPrice"+index).val();
	let cartNum=$("#cartNum"+index).attr("title");
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
	})
	
	
		
    //----------ajax DB Update   

	
	
});


//--------------------------------ajax Delete   (삭제후 배송료 변경하기)

//--------check box (product) 선택삭제  ( 완성!!)

$("#carts").on("click", "#selectedDelete", function(){
	const ar = []; //빈 배열
	const index_ar =[];
	const brand_ar=[];
	$(".del").each(function(){
		let ch = $(this).prop("checked");
		if(ch){
			ar.push($(this).val()); //productNum!
			index_ar.push($(this).attr("title"));
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
				//무료배송여부 
					$(".productPrice").each(function(){ 
						
					    
					    let b_index = $(this).attr("title"); 
					    console.log("b_index:"+b_index);
					     
					    let brandPrice=0; 
						
						
						$(".productPrice"+b_index).each(function(){
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
					
					let payment=totalShipping+parseInt($("#totalPrice").val());
					
					$("#payment").val(payment);  //총 결제금액 입력
					
				
		   
		}
	})

});

//--------- X눌러 option 삭제  

 $(".delete").click(function () {
	 
	 alert("hi");
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
				 if($(".cartCheck"+ productNum).length < 1){
					 $("#products"+productNum).remove();
					 console.log(productNum+"productNum 가 삭제됨");
				 }
				 
				 //같은 brand에 가지고 있는 다른 상품이 있는지 찾아 보고 없으면 brand 카드까지 삭제
			  
			    	
			    	if($(".productCheck"+brandNum).length < 1){
						$("#card"+brandNum).remove();
						console.log(brandNum+"brandNum가 삭제됨");
			    	}
				
			    ////배송비, 총 배송비 변경
					//무료배송여부 
						$(".productPrice").each(function(){ 
							
						    
						    let b_index = $(this).attr("title"); 
						    console.log("b_index:"+b_index);
						     
						    let brandPrice=0; 
							
							
							$(".productPrice"+b_index).each(function(){
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
						
						let payment=totalShipping+parseInt($("#totalPrice").val());
						
						$("#payment").val(payment);  //총 결제금액 입력
						
				
				
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
  
    
 
</script>



<c:import url="../template/footer.jsp"></c:import>
</body>
</html>