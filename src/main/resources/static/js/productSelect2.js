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

function percent(){
	const val = document.getElementById('price-percent');
	const percent = Math.floor(val);
	val.innerText = percent;
}



//select box 선택시 실행
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
	
	   // 바로결제 버튼 클릭시, 아무 옵션도 선택 안했다면 경고창! 유효성검사
	  let source=$("#opPrint").html().trim();
	  if(source==null || source==""){
		  
		  alert("옵션 선택 후에 버튼을 클릭해 주세요.");
	  }else{
		
		
					 alert("directPay!");
			   //바로결제를 누를 때는 validity 20 넣기
			
				$(".valid").each(function(){
					$(this).val(20);
					
				});
			  //DB에 있는 validity가 20(바로결제 상태)인 cartVO를 싹 지워준다.
			   $.ajax({
				type:"get",
				url:"../cart/directPayDelete",
				data:{},
				success:function(data){
					alert(data+'의 정보를 삭제하였습니다');
					 $("#frm").submit();
				}
			});
   
		
		
	}
	  
  
}


 // 장바구니버튼 클시 이벤트 

  $("#cartInsertBtn").click(function(){
	
			
	   // 장바구니 버튼 클릭시, 아무 옵션도 선택 안했다면 경고창! 유효성검사
	  let source=$("#opPrint").html().trim();
	  if(source==null || source==""){
		  
		  alert("옵션 선택 후에 버튼을 클릭해 주세요.");
	  }else{
		//옵션이 있다면 바로 submit!
		 $("#frm").submit();
	   
	 }
	  
	
  });

	
	
	  











