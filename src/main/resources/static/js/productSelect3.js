/**
 * 
 */

//==============================수량을 변경하면 바뀌는 금액들
let count = 0;

function amountSave(){
	
		count=$(this).val();
		console.log("focus in"+ count);
	
}

function go(){

let amount = $(this).val();
	if(amount==0){
    		
    		alert("0보다 큰 정수를 입력해야 합니다. ")
    		$(this).val(count);
    } else{
    	let amount = $(this).val();
    	let optionNum =$(this).attr("title");
        let don = $("#unitPrice"+optionNum).val(); //단가 
    	newdon = amount*don;
 
         
        // 변화된 option 가격 표시
       $("#cartPrice"+optionNum).val(newdon); 
    	
        //각 option들의 가격을 더한 product범위의 가격
       let price=0; 
		
       let productNum= $("#productNum").val();

		$(".cartPricePlus"+productNum).each(function(){
			price=price+parseInt($(this).val());
	     });

		//product범위의 가격 입력
		$("#productVOPrice").val(price);
		


    } //if 문 끝

}




function opClose(){
	
	let optionNum = $(this).attr("title");
	$("#carts"+optionNum).remove();
	
	//product 범위의 금액 다시 계산!
			let price=0; //각 option들의 가격을 더한 product범위의 가격
    			
               let productNum= $("#productNum").val();
	               console.log("productNum:"+productNum);
              
    			
    			$(".cartPricePlus"+productNum).each(function(){
    				price=price+parseInt($(this).val());
    			     console.log("반복되는 cartPricePlus:"+price);
    		     });
    			
    			$("#productVOPrice").val(price);//product범위의 가격 입력

	
}




