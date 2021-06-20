/**
 * 
	// 선택된 옵션 값 가져오기
	const text = e.options[e.selectedIndex].text;
	console.log(e.options);
  
 	 // 가져온 옵션 값 div id result에 출력
 	 document.getElementById('result').innerText
   	 = text;

 */

function optionprint(e) {
	
	const text = $("#selectop option:selected").text();
	
	document.getElementById('result').innerText
   	 = text;

}

function priceResult(){
	const amount = 
	document.getElementById('directInputBox').value;
/*	const priceR =
	document.getElementById('priceR').value;
	const resultP = amout;*/
  	document.getElementById("priceresult").innerText = amount;
	
}

function addList()  {
  
  // 1. 추가할 값을 input창에서 읽어온다
  const addValue 
    = document.getElementById('selectop').innerText;
  
  // 2. 추가할 li element 생성
  // 2-1. 추가할 li element 생성
  const li = document.createElement("li");
  
  // 2-2. li에 id 속성 추가 
  li.setAttribute('id',addValue);
  
  // 2-3. li에 text node 추가 
  const textNode = document.createTextNode(addValue);
  li.appendChild(textNode);
  
  // 3. 생성된 li를 ul에 추가
  document
    .getElementById('opprint')
    .appendChild(li);
}