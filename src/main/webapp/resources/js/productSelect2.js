/*
	// 선택된 옵션 값 가져오기
	const text = e.options[e.selectedIndex].text;
	console.log(e.options);
  
 	 // 가져온 옵션 값 div id result에 출력
 	 document.getElementById('result').innerText
   	 = text;
	
	function optionprint(e) {
	
	const text = $("#selectop option:selected").text();
	
	document.getElementById('result').innerText
   	 = text;

}

function priceResult(){
	const amount = 
	document.getElementById('directInputBox').value;
	const priceR =
	document.getElementById('priceR').value;
	const resultP = amout;
  	document.getElementById("priceresult").innerText = amount;}	
*/




function addList(){
	
	

 
  // 1. 추가할 값을 option 창에서 읽어온다 (옵션명, 가격)
  const addValue 
    = $("#selectop option:selected").text();
 const optionNum
    = $("#selectop option:selected").val();
  const optionName 
    = $("#selectop option:selected").attr("data-OPname");
  const unitPriceNumber
    = $("#selectop option:selected").attr("data-OPprice");


/// 같은 옵션 선택할 경우 '이미 선택한 옵션입니다.'띄우기  
if($("#carts"+optionNum).length != 0){
	
	alert("이미 선택한 옵션입니다.");
	
} else{


  
  
//바뀌면 optionAdd 안의 html를 따와서  opPrint에 넣는다.
  

 let source=$("#optionAdd").html();
$("#opPrint").append(source);


  
  // 2. 추가할 element 생성
  // 2-1. 추가할 element 생성

   //productNum 구분을 위해 넣기
      let productNum =document.getElementById("productNum");
           productNum =productNum.getAttribute("value");
	      console.log("productNum:"+productNum);

    

  
   //unitName 넣기
	let unitName=document.getElementById("unitName");
	 unitName.setAttribute('id',"unitName"+optionNum);
     unitName.setAttribute('value', optionName);
	
   //unitPrice 넣기
   let unitPrice= document.getElementById("unitPrice");
      unitPrice.setAttribute('id',"unitPrice"+optionNum);
	  unitPrice.setAttribute('value', unitPriceNumber);
   //cartPrice 넣기
	let cartPrice=document.getElementById("cartPrice");
	 cartPrice.setAttribute('id',"cartPrice"+optionNum);
    
     cartPrice.setAttribute('value', unitPriceNumber);
     cartPrice.setAttribute('class', "cartPricePlus"+productNum);


   

   // 수량 인풋 박스의 구분을 위해 optionNum 넣기 / 아이디 바꾸기 
        let directInputBox= document.getElementById("directInputBox");
      directInputBox.setAttribute('id',"directInputBox"+optionNum);
      directInputBox.setAttribute('title',optionNum);
   // x 표시 구분을 위해 optionNum 넣기 / 아이디 바꾸기 
       let opDelete = document.getElementById("opDelete");
      opDelete.setAttribute('id',"opDelete"+optionNum);
      opDelete.setAttribute('title',optionNum);
   // 회색박스 전체에도 구분을 위해 optionNum 넣기 / 아이디 바꾸기 
  let carts = document.getElementById("carts");
      carts.setAttribute('id',"carts"+optionNum);
      carts.setAttribute('title',optionNum);


//// 총 product별 가격 변경 하기
           let price=0; //각 option들의 가격을 더한 product범위의 가격

           $(".cartPricePlus"+productNum).each(function(){
    				price=price+parseInt($(this).val());
    			     console.log("반복되는 cartPricePlus:"+price);
    	    });
			
			$("#productVOPrice").val(price);//product범위의 가격 입력
			



///장바구니에 이미 같은 옵션이 있는 경우, cartVO의 amount만 업력 시키기
 
}  // if end

};  // select change 될때 함수 끝 


// 바로결제 버튼 누를시 
//cart insert 먼저 해주기
// ->선택 product범위의 cartVO들을 validity=1로 그 외 것들을 다 validity=0으로 업뎃해준다.

function directPay(){
	 alert("directPay!");
   $("#frm").submit();
  //cartInsert를  ajax로 먼저 하고 바로 다시 결제페이지로 넘기기.

  // <!-- ////각 cartVO의 validity 검사-> ajax를 이용해 DB에 업데이트 
		// Ajax 끝마치고 submit 하기 -->
		 alert("과연.. !");
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
	           alert("통과")
				
				 $("#orderFrm").submit();
				

			 }else {
				alert('주문페이지로 이동이 실패했습니다.');
			}
		}
	})
		


}
	
	
	
	  











