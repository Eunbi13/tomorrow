/**
 * 
 */

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

