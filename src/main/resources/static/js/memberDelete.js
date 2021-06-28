/**
 * 
 */
//eb_취소하기 누르면 회원정보 수정페이지로 이동
$('#cancel').click(function(){
	location.replace('./update')
})

//eb_체크 검사
$('#running').click(function(){
	let check = false;
	check=$('.accept').prop('checked');
	if(check){
		$('.deleteFrm').submit();
	}else{
		$('span').addClass('red');
	}
	
	
})