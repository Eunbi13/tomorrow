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


  
  
//바뀌면 optionAdd 안의 html를 따와서  opPrint에 넣는다.
  
  let optionAdd=document.getElementById('optionAdd');
  let optionAddHtml=optionAdd.innerHTML
  let opPrint=document.getElementById('opPrint');
   opPrint.innerHTML+=optionAddHtml;


  
  // 2. 추가할 element 생성
  // 2-1. 추가할 element 생성

  
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
}



//수량 * 옵션가격 //수정중
function printAmount(){
	
	const amount = document.getElementById('amount').value;
	console.log(amount);
	
	const orP = document.getElementsByName('price').value;
	console.log(orP);
	var opTotal = amount * orP;
	document.getElementByName('price').innerText = opTotal;
	
}

//장바구니 버튼 누를 때

	

function goCart() {
      
	//배열만들어서 Ajax로 insert
	//만들어진 회색 박스의 갯수 =	i 
	
	let carts = document.getElementsByClassName("carts");
     alert(carts.length-1)
	for(i=0; i < carts.length-1 ;i++){
	    alert(carts[i].title);	
          carts[i] 
	}



	
	const element = doucument.getElementById('option');
	const option = element.innerText;
	const input = document.createElement("input");
  input.setAttribute('name','totlaOp');
  input.setAttribute('type','hidden');	
	document 
		.getElementById('optionResult')
		.appendChild(input)
		;
}


//위에서부터 차례로 삭제
function removeItem()  {
  
  // 1. <ul> element 선택
  const ul = document
    .getElementById('opPrint');
  
  // 2. <li> 목록 선택
  const items = ul.getElementsByTagName('li');
  
  // 3. <li> 목록 중 첫번째 op 삭제
  if(items.length > 0)  {
    items[0].remove();
  }
  
}


/*
$(document).ready(function() {
	var i=1; // 변수설정은 함수의 바깥에 설정!
    $("selectop").onchange(function() {
       $("#opWrap").append("<p class='original'>옵션"+i+"</p>");
      i++; // 함수 내 하단에 증가문 설정
     });
}); */