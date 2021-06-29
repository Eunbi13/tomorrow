/**
 * 
 */

//eb_대표이미지 교체할 경우
$('#productPicButton').click(function(){
	$('#productPicChange').css('display','inline');
})

//eb_제품의 카테고리 수정
let category ='';
$('body').on('click', '#changeCategoryNM', function(){
	category=$('#category').html();
	$('#category').empty();
	$('#categoryCheckBox').css('display', '');
	cC++;
	$('#categoryCancel').removeAttr('hidden');
})

	
//eb_제품의 카테고리 수정을 취소
let cC=0;
$('#categoryCancel').click(function(){
	if(cC>0){
		$('#category').append(category);
				
		$('#categoryCheckBox').css('display', 'none')
		$('#two').empty();
		$('#three').empty();
	}
	cC--;
})

