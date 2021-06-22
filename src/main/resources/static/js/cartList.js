// 장바구니에서 바로결제 버튼 누를시 

// ->선택 product범위의 cartVO들을 validity=1로 그 외 것들을 다 validity=0으로 업뎃해준다.
	$(".directPay").click(function(){
		
	   alert("hi!");


		// <!-- ////각 cartVO의 validity 검사-> ajax를 이용해 DB에 업데이트 
		// Ajax 끝마치고 submit 하기 -->
		
		 let checkedCartNum;
	     let checkedProductNum =$(this).attr("title");; //바로 결제 선택한 productNum
		
     let productNum= $(this).attr("title");
	 const validity_ar=[];
	 const un_validity_ar=[];

	$(".directPay").each(function(){
		if( productNum == $(this).attr("title")){
			
			checkedProductNum =$(this).attr("title");
			alert("checked productNum!"+$(this).attr('title'));
			
			// 그 상품의 옵션범위의 cartVO.cartNum을 찾아 배열에 넣어준다
			$(".cartNum"+productNum).each(function(){
				
				// 배송료는 한 브랜드에서만 결제되는 것이기 때문에..선택된 옵션의 배송료만 계산한다. 
				
			   alert("checked cartNum!"+$(this).attr('title'));
               checkedCartNum =$(this).attr('title');
				validity_ar.push(checkedCartNum);
			});
			
			
		} else{
			let productNum=$(this).attr("title");
			alert("XXXXchecked productNum!"+$(this).attr('title'));
			
			// 그 외 상품들의 옵션범위의 모든 cartVO.cartNum을 찾아 배열에 넣어준다
			$(".cartNum"+productNum).each(function(){
				
				alert("XXXXchecked cartNum!"+$(this).attr('title'));
				 un_validity_ar.push($(this).attr("title"));
			});
			
		}
		
	});
	
	// 배송료는 한 브랜드에서만 결제되는 것이기 때문에..선택된 옵션의 배송료만 계산한다. 
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
	//==============================check box(범위: product)를 건들때 마다 총 상품 금액 변경

/////초기화 하기
	
	let newBrandPrice;
    $(".brandPrice").each(function(){  
    	$(this).val(0);
    });

	//모든 checkbox를 검사해서 checked 된 것들만...계산해서 총 상품 가격, 총배송비, 총 결제금액 계산
	
	
	
					 //선택된 상품 만을 가지고 brand범위의 가격구하기
					let b_index =$("#productVOPrice"+checkedProductNum).attr("title");
					let productPrice = $("#productVOPrice"+checkedProductNum).val();
					
					newBrandPrice = parseInt($(".brandPrice"+b_index).val()) + parseInt(productPrice);
					
					console.log("newBrandPrice:"+newBrandPrice);
					$(".brandPrice"+b_index).val(newBrandPrice);
					
				
	
	         //모든 brandPrice를 반복돌려서 처리
	    
	        	let brandPrice= $(".brandPrice"+b_index).val();
	        	 
	        	console.log("brandPrice:"+newBrandPrice);
			    
			    /////////////
			    
			    if(newBrandPrice>=30000){//한 브랜드에서 구매한게 3만원 이상
			    	console.log(b_index+" is over30000");
			    	$(".brandShipping"+b_index).each(function(){
			    		$(this).val(0);//cartVO.brandShipping에 0 넣기 반복돌리자
			    	});
			    	
			   
			    	$("#shipping"+b_index).attr("title", 0);
			    } else{//1.한 브랜드에서 구매한게 3만원 이하 
			    	 let shipCheck=false;
			    	//2.그 브랜드의 어떤 productVO shippingFee도 0이 아님  ->false유지
			    	//1+2 의 조건이면  그 중 가장 적은 shippingFee 한번만 적용
			    	
			    		
					    	$(".shippingFee"+b_index).each(function(){ // Product 범위의 배송비
					    		 let productNum= $(this).attr("data-productNum");
					    	
					    			  if(checkedProductNum == productNum){
					    				   console.log("checkedProductNum == productNum입장");
					    				  if($("#shippingFee"+productNum).val()==0){
						                       //3. 그 브랜드에서 구매한 product fixed shippingFee 중 0이 하나라도 있음 ->true로 변경
					    					  console.log("checkedProductNum == productNum 그 이후 입장");
					    					  shipCheck=true;
								    		  }
					    			      }
					    			 
					    		      
					    		
					    	      });
			    	
			    	
				    	if(shipCheck==true){
				    		
					    	//1+3 의 조건이면 그 브랜드 안 모든  cartVO.brandShipping에 0 넣기, 브랜드 배송비 무료
							$(".brandShipping"+b_index).each(function(){
					    		$(this).val(0);//cartVO.brandShipping에 0 넣기 반복돌리자
					    	});
					
					    	$("#shipping"+b_index).attr("title", 0);
				    		
				    	} else{
				    		
				    		let shipFee=100000; //shipFee에 가장 작은 배송비를 넣을 것 
					    		$(".shippingFee"+b_index).each(function(){ //Product 범위의 배송비
					    			 let productNum= $(this).attr("data-productNum");
						    		 	
						    			  	if(checkedProductNum == productNum){
					    							let shipFee2=$(this).val();
					    								if(shipFee2 <= shipFee){
					    									shipFee=shipFee2;
					    									}
						    			  	}
						    		 	
					    		});
				    		
				    		
				    		console.log("b_index/shipFee"+b_index+"/"+shipFee)
				    	
				    		$(".brandShipping"+b_index).each(function(){
					    		$(this).val(shipFee);//cartVO.brandShipping에 찾은 가장 작은 배송비 넣기 반복돌리자
					    	});
				    	
				    	$("#shipping"+b_index).attr("title", shipFee);
				    	} // shipCheck if end
					
	               };//if end 
	         
	  
	          
	       //총 배송비
				let totalShipping=$(".brandShipping"+b_index).val(); 
				
				console.log(totalShipping);
				
				$("#totalShipping").val(totalShipping);// 총 배송비 입력
				
				//----------총 결제금액!!
			//총 상품 가격 부터 다시.
			let totalcheckedPrice= $(".productNum_productPrice"+checkedProductNum).val(); // 선택한 상품 범위의 가격
			         
			          
			//주문결제 페이지의 총 상품 금액 = 장바구니의 최종결제 금액 이기때문에 먼저 저장
			$("#itemsPrice").val(totalcheckedPrice);
			
			

			$("#totalPrice").val(totalPrice); // 총 상품 금액 입력

		
				let payment=parseInt(totalShipping)+parseInt(totalcheckedPrice);
				
				$("#payment").val(payment);  //총 결제금액 입력
		

			
	
	
 //------------check box(범위: product)를 건들때 마다 총 상품 금액 변경   end
	
	
	
	
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
				
				 $("#orderFrm").submit();
				

			 }else {
				alert('주문페이지로 이동이 실패했습니다.');
			}
		}
	})


	
});
