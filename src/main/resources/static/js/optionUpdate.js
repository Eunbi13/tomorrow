/**
 * 
 */
//option table 생성하는 함수
option();

//#table과 관련된 이벤트 막기
//optionONEvent();은 productSet.js에 있음
optionOFFEvent();
function optionOFFEvent(){
	$('#table').off('click');
}
//eb_옵션 추가&라디오 버튼 사용 못하게 설정 
let optionCheck=false;
$('#optionButton').hide();
$('#optionUpdateCancel').hide();
//수정버튼 누르면 옵션 추가보튼 사용할 수 있고 input readonly설정 지우기
let tableData="";
$('#optionUpdateButton').click(function(){
	//취소버튼 활성화를 위해 #table 데이터 담아두기
	tableData=$('#table').html();
	
	$('#optionButton').show();
	$('#optionUpdateCancel').show();
	$('#optionUpdateButton').hide();
	$('#table input').removeAttr('readonly');
	//이벤트 실행 버튼
	optionONEvent();
	optionCheck=true;
	$('input[type="radio"]').attr('onclick','return(true)');
	
})
//옵션 수정 취소 버튼
$('#optionUpdateCancel').click(function(){
	$('#table').html(tableData);
	$('#optionButton').hide();
	$('#optionUpdateCancel').hide();
	$('#optionUpdateButton').show();
	optionOFFEvent()
	optionCheck=false;
	$('input[type="radio"]').attr('onclick','return(false)');
})




/*$('.frmBtn').click(function(){
	if(optionCheck){
		$('#optionFrm').submit();
	}else{
		let productNum = $('input[name="productNum"]').val();
		location.href='/product/productselect2?productNum='+productNum;
	}
});
*/

//eb_업데이트 페이지 열릴때, 옵션vo를 테이블 형태로 보여주기
function option(){
	let optionKinds =[];
	let optionNmae = [];
	let optionPrice = [];
	let step = [];
	let type=false;
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
		if($(s).text()>0){
			type=true;
		}
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
	
	//optionInput 수정 못하도록 설정
	$('#table input').attr('readonly','readonly');
	
	//step이 0보다 큰 수가 있다면 조합분리선택형이다 자동으로 선택되도록 하기
	//radio버튼 사용 못하게 만들기
	$('input[type="radio"]').attr('onclick','return(false)');
	if(type){
		$('#use').prop('checked','checked');
	}
	
	
}//option()fin

