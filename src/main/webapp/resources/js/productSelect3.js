/**
 * 
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
    	    	let optionNum =$(this).attr("title");
                let don = $("#unitPrice"+optionNum).val(); //단가 
    	    	don = amount*don;

                 
    	
    	    	$("#cartPrice"+optionNum).val(don); // 변화된 option 가격 표시
    	    	
    	    	
    	    	let price=0; //각 option들의 가격을 더한 product범위의 가격
    			
               let productNum= $("#productNum").val();
	               console.log("productNum:"+productNum);
              

                   
    	    
    			
    			$(".cartPricePlus"+productNum).each(function(){
    				price=price+parseInt($(this).val());
    			     console.log("반복되는 cartPricePlus:"+price);
    		     });
    			
    			$("#productVOPrice").val(price);//product범위의 가격 입력
    			


    	    } //if 문 끝
			
		}//change 함수 
	
	
	
	
	}); //on event

