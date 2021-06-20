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