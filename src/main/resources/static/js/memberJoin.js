/**
 * 
 */

let check = false;
let result = false;
let result2 = false;
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
	if(result&&result2){
		$('#all').prop("checked", result);
	}else{
		$('#all').prop("checked", result);
	}
});
//선택 동의 
$('.other').click(function(){
	result2 = $('.other').prop("checked");
	if(result&&result2){
		$('#all').prop("checked", result2);
	}else{
		$('#all').prop("checked", result);
	}
});


$('.btn').click(function(){
		
	if(check||result){
		alert('hi')
	}
});


