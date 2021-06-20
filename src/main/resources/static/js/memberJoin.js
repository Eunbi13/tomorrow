/**
 * 
 */

let check = false;
let result = false;
let otherCheck = false;
//전체 동의
$('#all').click(function(){
	check = $('#all').prop("checked");
	$('.one').prop("checked", check);
	$('.other').prop("checked", check);
});
//필수 동의 
$('.one').click(function(){
	result = true;
	$('.one').each(function(){
		check = $(this).prop("checked");
		if(!check){
			result = false;
		}
	});
	if(result&&otherCheck){
		$('#all').prop("checked", true);
	}else{
		$('#all').prop("checked", false);
	}
});
//선택 동의 
$('.other').click(function(){
	otherCheck = $('.other').prop("checked");
	if(result&&otherCheck){
		$('#all').prop("checked", true);
	}else{
		$('#all').prop("checked", false);
	}
});

let count = 0;
$('#btn').click(function(){		
	if(check||result){
		$('#frm').submit();
	}else{
		if(count<1){
			$('#error').append('필수 동의 항목입니다.');
			count++;
		}
	}
});


