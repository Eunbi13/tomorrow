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
//개별동의 
$('.one').click(function(){
	result = true;
	$('.one').each(function(){
		check = $(this).prop("checked");
		if(!check){
			result = false;
		}
	});
	check = result;
	/*if(check){
		$('#all').prop("checked", check);
	}*/
});

$('.other').click(function(){
	result2 = $('.other').prop("checked");
	if(result&&result2){
		$('#all').prop("checked", result2);
	}
});


$('.btn').click(function(){
		alert(check)
	if(check){
	}
});


