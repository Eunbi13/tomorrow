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
  
  
  
  // 2. 추가할 element 생성
  // 2-1. 추가할 element 생성
  const li = document.createElement("li");
  const div = document.createElement("div");
  const priceDiv = document.createElement("div");
  const inputA = document.createElement("input"); //=amount
  const p = document.createElement("p"); //<p> price
  const inputP = document.createElement("input");

  // 2-2. 속성 추가
  div.setAttribute('value',addValue);
  div.setAttribute('id','option');
  priceDiv.setAttribute('id', 'priceDiv');
  inputA.setAttribute('id', 'amount');
  inputA.setAttribute('name', 'amount');
  inputA.setAttribute('value','1');	
  inputA.setAttribute('onkeyup','printAmount()');
  p.setAttribute('name','price');
  inputP.setAttribute('name','price');
  inputP.setAttribute('type','hidden');


  // 2-3. li, div에 text node 추가 
  const textNode = document.createTextNode(addValue);
  li.appendChild(textNode);
  div.appendChild(textNode);

  //3-1. 옵션 , 기준으로 잘라넣기 = p
  const opPrice = addValue.split(','); //배열
  const price = opPrice[opPrice.length - 1];

  //3-2. 잘라넣은 값 p에 text node 추가
  const pricenode = document.createTextNode(price);
  p.appendChild(pricenode);

  //3-3. input p hidden 으로 가격 넘기기
  const amount = document.getElementById('amount');
  const totalP = pricenode*amount ;
  inputP.setAttribute('value',totalP);

  // 4. 생성된 li를 ul에 추가
  // li > div > inputA(amount)
  document 
    .getElementById('opPrint')
    .appendChild(li)
	.appendChild(div)
	.appendChild(priceDiv)
	.appendChild(inputA)
	.appendChild(p)	
	.appendChild(inputP) //nan ?
	;
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

function inputOp() {
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



$(document).ready(function() {
	var i=1; // 변수설정은 함수의 바깥에 설정!
  $("selectop").onchange(function() {
    $("#opWrap").append("<p class='original'>옵션"+i+"</p>");
    i++; // 함수 내 하단에 증가문 설정
  });
});
