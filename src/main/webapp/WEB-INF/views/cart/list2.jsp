<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>

<script type="text/javascript">

//3자리 단위마다 콤마 생성

function addCommas(x) {

    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");

}

 

//모든 콤마 제거

function removeCommas(x) {

    if(!x || x.length == 0) return "";

    else return x.split(",").join("");
}

// 상품구매하기 버튼 누를시.

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
			console.log("data:"+data);
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
	total=total+parseInt($(this).val());

    
    let productNum = $(this).attr("title"); //productNum
    console.log("productNum:"+productNum);
     
    let price=0; //각 option들의 가격을 더한 product범위의 가격
	
	
	$(".cartPricePlus"+productNum).each(function(){
		price=price+parseInt($(this).val());
		
		
		
     });
     
	let c_price =addCommas(price);
	$("#productVOPrice"+productNum).val(c_price); // product당 가격(=option가격들의 합) 세팅
	
	console.log("price:"+price);
    
	console.log("total:"+total);
	

});

let c_total=addCommas(total);
$("#totalPrice").val(c_total); // 총 상품 금액 입력






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

let c_totalShipping=addCommas(totalShipping);
$("#totalShipping").val(c_totalShipping);// 총 배송비 입력 

//----------총 결제금액

let payment=totalShipping+total;

let c_payment= addCommas(payment);
$("#payment").val(c_payment);  //총 결제금액 입력

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
				
				
				$("#totalShipping").val(addCommas(totalShipping));// 총 배송비 입력 

			
				
				
				//----------총 결제금액!!
			//총 상품 가격 부터 다시.
			let totalcheckedPrice= 0;
			
			for(let c in checkedNum){
			       $(".productNum_productPrice"+checkedNum[c]).each(function(){ 
			           totalcheckedPrice=totalcheckedPrice+parseInt($(this).val());
			           console.log("checked productPrice: "+parseInt($(this).val()));
			      });
			
			}
			  
			   $("#totalPrice").val(addCommas(totalcheckedPrice));
				
				let payment=totalShipping+parseInt($("#totalPrice").val());
				
				
				$("#payment").val(addCommas(payment));  //총 결제금액 입력
				
	         

			
});
				
				
				

	
	


//------------check box(범위: product)를 건들때 마다 총 상품 금액 변경   end




$("input:text[numberOnly]").on("focus", function() {

    var x = $(this).val();

    x = removeCommas(x);

    $(this).val(x);

}).on("focusout", function() {

    var x = $(this).val();

    if(x && x.length > 0) {

        if(!$.isNumeric(x)) {

            x = x.replace(/[^0-9]/g,"");

        }

        x = addCommas(x);

        $(this).val(x);

    }

}).on("keyup", function() {

    $(this).val($(this).val().replace(/[^0-9]/g,""));

});

	
//==============================수량을 변경하면 바뀌는 금액들
let previous=0;

$(".directInputBox").on({focus: function(){
	
	previous = $(this).val();
	
   
    	
    }, change:function(){ 
    	
     console.log($(this).val());
    	
    	if($(this).val()==0){
    		
    		alert("0보다 큰 정수를 입력해야 합니다. ")
    		$(this).val(previous);
    	} else{
	
	let index = $(this).attr("title"); // cartVO의 index숫자
	let don = $("#optionPrice"+index).val(); //단가
	
	let p= $(this).val()*don; // 변화된 option 가격
	
	$("#cartVOPrice"+index).val(addCommas(p)); // 변화된 option 가격 표시
	
	//----------------option 가격이 변하면 실행되는 함수
	$("#cartVOPrice"+index).on('input', function() {
	    
	    let productNum = $(this).attr("title"); 
	   
	    let price=0; //각 option들의 가격을 더한 product범위의 가격
		
		
		$(".cartPricePlus"+productNum).each(function(){
			price=price+parseInt(removeCommas($(this).val()));
	     });
	     
	    
	    let Cprice= addCommas(price);
		$("#productVOPrice"+productNum).val(Cprice);
		
		//-----총 상품 금액 변경
		totalAgain=0;
		
		$(".cartPricePlus").each(function(){
			totalAgain=totalAgain+parseInt(removeCommas($(this).val()));
		});
		
		$("#totalPrice").val(addCommas(totalAgain));
		
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
					 productPrice  = removeCommas(productPrice);
					
					newBrandPrice = parseInt($(".brandPrice"+b_index).val()) + parseInt(productPrice);
					
					console.log("newBrandPrice:"+newBrandPrice);
					$(".brandPrice"+b_index).val(addCommas(newBrandPrice));
					
				}
	
	         //모든 brandPrice를 반복돌려서 처리
	         $(".brandPrice").each(function(){
	        	let b_index = $(this).attr("title");
	        	let brandPrice= $(".brandPrice"+b_index).val();
	        	 brandPrice  = removeCommas(brandPrice);
	        	 
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
				
				$("#totalShipping").val(addCommas(totalShipping));// 총 배송비 입력 오케비
				
				//----------총 결제금액!!
			//총 상품 가격 부터 다시 계산
			let totalcheckedPrice= 0;
			
			for(let c in checkedNum){
			       $(".productNum_productPrice"+checkedNum[c]).each(function(){ 
			           totalcheckedPrice=totalcheckedPrice+ parseInt(removeCommas($(this).val()));
			           console.log("checked productPrice: "+parseInt(removeCommas($(this).val())));
			      });
			
			}
			
			   $("#totalPrice").val(addCommas(totalcheckedPrice));
				
				let payment=totalShipping+parseInt(removeCommas($("#totalPrice").val()));
				
				$("#payment").val(addCommas(payment));  //총 결제금액 입력
				
		//brand별 무료배송여부 표시 
				$(".productPrice").each(function(){ 
					
				    
				    let b_index = $(this).attr("title"); 
				    console.log("b_index:"+b_index);
				     
				    let brandPrice=0; 
					
					
					$(".productPrice"+b_index).each(function(){
						brandPrice=brandPrice+parseInt(removeCommas($(this).val()));
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
	let amount = removeCommas($(this).val());
	let cartPrice= removeCommas($("#cartVOPrice"+index).val());
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
    }
	
	
});





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
		
		    $("#totalPrice").val(addCommas(totalAgain));
			
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
								$(".brandPrice"+b_index).val(addCommas(newBrandPrice));
								
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
							
							$("#totalShipping").val(addCommas(totalShipping));// 총 배송비 입력 
							
							//----------총 결제금액!!
						//총 상품 가격 부터 다시.
						let totalcheckedPrice= 0;
						
						for(let c in checkedNum){
						       $(".productNum_productPrice"+checkedNum[c]).each(function(){ 
						           totalcheckedPrice=totalcheckedPrice+parseInt($(this).val());
						           console.log("checked productPrice: "+parseInt($(this).val()));
						      });
						
						}
						
						   $("#totalPrice").val(addCommas(totalcheckedPrice));
							
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
			    					$(".brandPrice"+b_index).val(addCommas(newBrandPrice));
			    					
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
			    				
			    				$("#totalShipping").val(addCommas(totalShipping));  // 총 배송비 입력 오케비
			    				
			    				//----------총 결제금액!!
			    			//총 상품 가격 부터 다시.
			    			let totalcheckedPrice= 0;
			    			
			    			for(let c in checkedNum){
			    			       $(".productNum_productPrice"+checkedNum[c]).each(function(){ 
			    			           totalcheckedPrice=totalcheckedPrice+parseInt($(this).val());
			    			           console.log("checked productPrice: "+parseInt($(this).val()));
			    			      });
			    			
			    			}
			    			
			    			   $("#totalPrice").val(addCommas(totalcheckedPrice));
			    				
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
  
    
 
</script