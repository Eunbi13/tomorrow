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

//지금 돌아가고 있는 건 이거
 var i = 1;
function addList(){

 
  // 1. 추가할 값을 option 창에서 읽어온다 (옵션명, 가격)
  const addValue 
    = $("#selectop option:selected").text();
  
  
  // 2. 추가할 li element 생성
  // 2-1. 추가할 li element 생성
  const li = document.createElement("li");
  const div = document.createElement("div");
  // 2-2. li에 id 속성 추가 
  li.setAttribute('value',addValue);
  
  
  
  // 2-3. li에 text node 추가 
  const textNode = document.createTextNode(addValue);
  li.appendChild(textNode);
  div.appendChild(textNode);
  // 3. 생성된 li를 ul에 추가
  document
    .getElementById('opPrint')
    .appendChild(li)
	.appendChild(div);
	i++;
}


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
