/*// 장바구니에서 바로결제 버튼 누를시 
// ->선택 product범위의 cartVO들을 validity=1로 그 외 것들을 다 validity=0으로 업뎃해준다.
	$("#payBtn").click(function(){
		// <!-- ////각 cartVO의 validity 검사-> ajax를 이용해 DB에 업데이트 
		// Ajax 끝마치고 submit 하기 -->
	 const validity_ar=[];
	 const un_validity_ar=[];
	$(".del").each(function(){
		if($(this).prop("checked")){
			
			let productNum=$(this).attr("title");
			alert("checked productNum!"+$(this).attr('title'));
			
			
			$(".cartNum"+productNum).each(function(){
				
			   alert("checked cartNum!"+$(this).attr('title'));
				validity_ar.push($(this).attr("title"));
			});
			
			
		} else{
			let productNum=$(this).attr("title");
			alert("XXXXchecked productNum!"+$(this).attr('title'));
			$(".cartNum"+productNum).each(function(){
				
				alert("XXXXchecked cartNum!"+$(this).attr('title'));
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
	
	});
	*/