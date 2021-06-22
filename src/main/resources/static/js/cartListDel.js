/**
 * 
 */

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
			 // 삭제 성공 후, 총 상품 가격 다시 계산
				 totalAgain=0;
		
			    $(".cartPricePlus").each(function(){  //각 옵션범위 가격을 다 더한다.
				totalAgain=totalAgain+parseInt($(this).val());
			    });
			
			   //주문결제 페이지의 총 상품 금액 = 장바구니의 최종결제 금액 이기때문에 먼저 저장
					$("#itemsPrice").val(totalAgain);
				
					 //같은 상품안에 가지고 있는 다른 옵션이 있는지 찾아오고 없으면 상품까지 삭제
					 if($(".cartCheck"+productNum).length < 1){
						 $("#products"+productNum).remove();
						 console.log(productNum+"productNum 가 삭제됨");
					
					           //같은 brand에 가지고 있는 다른 상품이 있는지 찾아 보고 없으면 brand 카드까지 삭제
						  
						    	if($(".productCheck"+brandNum).length < 1){
									$("#card"+brandNum).remove();
									console.log(brandNum+"brandNum가 삭제됨");
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
			    			
			    		    console.log('체크된 상태:'+$(this).attr("title"));
			    		    let productNum=$(this).attr("title");
			    	
			    		    checkedNum.push(productNum);    //체크된 productNum를 모은 배열을 만든다
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
											                     //3. 그 브랜드에서 구매한 product shippingFee 중 0이 하나라도 있음 ->true
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
			    				
			    				
			    				//brand별 무료배송여부 표시 
	    						$(".productPrice").each(function(){ 
	    							
	    						    
	    						    let b_index = $(this).attr("title"); 
	    						    console.log("b_index:"+b_index);
	    						     
	    						    let brandPrice=0; 
	    							
	    							
	    							$(".productPrice"+b_index).each(function(){
	    								brandPrice=brandPrice+parseInt($(this).val());
	    						     });
	    						     
	    						
	    							 ///
								    if(brandPrice>=30000){//한 브랜드에서 구매한게 3만원 이상
								    	console.log(b_index+" is over30000");
								    	$("#shipping"+b_index).val("배송비 무료");
								    } else{//1.한 브랜드에서 구매한게 3만원 이하 
								    	 let shipCheck=false;
								    	//2.그 브랜드의 어떤 productVO shippingFee도 0이 아님  
								    	//1+2 의 조건이면  그 중 가장 적은 shippingFee 한번만 적용
								    	$(".shippingFee"+b_index).each(function(){ //+ checked 된 애들중..
								    		
								    				  if($("#shippingFee"+productNum).val()==0){//3. 그 브랜드에서 구매한 product shippingFee 중 0이 하나라도 있음
								    					 
								    					  shipCheck=true;
											    		  }
								    			   });
								    			 
								         
								    		
								    	
								    	if(shipCheck==true){
									    	//1+3 의 조건이면 그 브랜드 안 모든  cartVO is free의 true, 브랜드 배송비 무료
										
											$("#shipping"+b_index).val("배송비 무료");
								    		
								    	} else{
								    		let shipFee=100000; //shipFee에 가장 작은 배송비를 넣을 것 
								    		$(".shippingFee"+b_index).each(function(){
								    							let shipFee2=$(this).val();
								    								if(shipFee2 <= shipFee){
								    									shipFee=shipFee2;
								    									}
								    		});
									  
								    	
								    	$("#shipping"+b_index).val("배송비"+shipFee+"원");
							
								    	}
								    	
								    } //if end
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
	 
	 let cartNum = $(this).attr("title");    //cartNum
	 console.log(cartNum+":cartNum");
	 let productNum=$(this).attr("data-productNum")  //productNum 
	 console.log(productNum+":productNum");
	 let brandNum= $(this).attr("data-brandNum"); //brandnum
	 console.log(brandNum+":brandNum");
	 
	 
	 $.ajax({
		 type:"get",
		 url:"../cart/optionDelete",
		 data:{
			 cartNum: cartNum
		 },
		 success:function(data){
				alert('삭제하였습니다');
				$("#carts"+cartNum).remove();
				console.log(cartNum+"가 삭제됨");
				
				 // 삭제 성공 후, 총 상품 가격 다시 계산
				 totalAgain=0;
		
			    $(".cartPricePlus").each(function(){  //각 옵션범위 가격을 다 더한다.
				totalAgain=totalAgain+parseInt($(this).val());
			    });
			
			   //주문결제 페이지의 총 상품 금액 = 장바구니의 최종결제 금액 이기때문에 먼저 저장
					$("#itemsPrice").val(totalAgain);
				
					 //같은 상품안에 가지고 있는 다른 옵션이 있는지 찾아오고 없으면 상품까지 삭제
					 if($(".cartCheck"+productNum).length < 1){
						 $("#products"+productNum).remove();
						 console.log(productNum+"productNum 가 삭제됨");
					
					           //같은 brand에 가지고 있는 다른 상품이 있는지 찾아 보고 없으면 brand 카드까지 삭제
						  
						    	if($(".productCheck"+brandNum).length < 1){
									$("#card"+brandNum).remove();
									console.log(brandNum+"brandNum가 삭제됨");
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
			    			
			    		    console.log('체크된 상태:'+$(this).attr("title"));
			    		    let productNum=$(this).attr("title");
			    	
			    		    checkedNum.push(productNum);    //체크된 productNum를 모은 배열을 만든다
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
											                     //3. 그 브랜드에서 구매한 product shippingFee 중 0이 하나라도 있음 ->true
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
			    				
			    				
			    				//brand별 무료배송여부 표시 
	    						$(".productPrice").each(function(){ 
	    							
	    						    
	    						    let b_index = $(this).attr("title"); 
	    						    console.log("b_index:"+b_index);
	    						     
	    						    let brandPrice=0; 
	    							
	    							
	    							$(".productPrice"+b_index).each(function(){
	    								brandPrice=brandPrice+parseInt($(this).val());
	    						     });
	    						     
	    						
	    							 ///
								    if(brandPrice>=30000){//한 브랜드에서 구매한게 3만원 이상
								    	console.log(b_index+" is over30000");
								    	$("#shipping"+b_index).val("배송비 무료");
								    } else{//1.한 브랜드에서 구매한게 3만원 이하 
								    	 let shipCheck=false;
								    	//2.그 브랜드의 어떤 productVO shippingFee도 0이 아님  
								    	//1+2 의 조건이면  그 중 가장 적은 shippingFee 한번만 적용
								    	$(".shippingFee"+b_index).each(function(){ //+ checked 된 애들중..
								    		
								    				  if($("#shippingFee"+productNum).val()==0){//3. 그 브랜드에서 구매한 product shippingFee 중 0이 하나라도 있음
								    					 
								    					  shipCheck=true;
											    		  }
								    			   });
								    			 
								         
								    		
								    	
								    	if(shipCheck==true){
									    	//1+3 의 조건이면 그 브랜드 안 모든  cartVO is free의 true, 브랜드 배송비 무료
										
											$("#shipping"+b_index).val("배송비 무료");
								    		
								    	} else{
								    		let shipFee=100000; //shipFee에 가장 작은 배송비를 넣을 것 
								    		$(".shippingFee"+b_index).each(function(){
								    							let shipFee2=$(this).val();
								    								if(shipFee2 <= shipFee){
								    									shipFee=shipFee2;
								    									}
								    		});
									  
								    	
								    	$("#shipping"+b_index).val("배송비"+shipFee+"원");
							
								    	}
								    	
								    } //if end
									
								});
								
			    				//상품구매 버튼표기
								
								 let validity1 =$('input:checkbox[name=validity1]:checked').length;
							    	console.log("validity1:"+validity1);
							    	$('#payBtn').val(validity1+"개 상품 구매하기");
			
				
				}
	 })
	
 });
 