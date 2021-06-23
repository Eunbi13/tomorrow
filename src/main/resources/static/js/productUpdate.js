/**
 * 
 */


option();
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
	if(type){
		$('#use').prop('checked','checked');
	}
	
	
}

//eb_대표이미지 교체할 경우
$('#productPicButton').click(function(){
	$('#productPicChange').css('display','inline');
})

//eb_제품의 카테고리 수정
let category ='';
$('#changeCategoryNM').click(function(){
	category=$('#category').html();
	$('#category').empty();
	$('#categoryCheckBox').removeAttr('hidden');
});
	
//eb_제품의 카테고리 수정을 취소
$('#categoryCancel').click(function(){
	$('#category').append(category);
	$('#categoryCheckBox').attr('hidden', 'hidden')
})

