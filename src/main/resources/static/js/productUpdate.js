/**
 * 
 */
//eb_업데이트 페이지 열릴때, 옵션vo가 있다면 테이블형태로 보여지기
let optionKinds =[];
let optionNmae = [];
let optionPrice = [];
let step = [];
$('.optionKinds').each(function(i,k){
	optionKinds.push($(k).text());
})
$('.optionName').each(function(i,n){
	optionNmae.push($(n).text());
})
$('.optionPrice').each(function(i,p){
	optionPrice.push($(p).text());
})
$('.step').each(function(i,s){
	step.push($(s).text());
})
//테이블 헤드 먼저 생성
$('#table').append(makeThead(optionKinds[0], 0));
let countI=0;
//테이블 바디 추가
$(optionKinds).each(function(i){
	console.log('===='+countI)
	//optionKinds가 다르면 새로운 테이블 생성하는 코드
	if(i>0 && optionKinds[i]!=optionKinds[i-1]){
		countI++;
		$('#table').append(makeThead(optionKinds[i], countI));
	}
	//테이블바디에 input추가 (같은 테이블에 여러번 들어가야함)
	$('tbody.t'+countI).append(makeTbody(optionKinds[i],optionNmae[i],optionPrice[i], step[i] ));
		
});



