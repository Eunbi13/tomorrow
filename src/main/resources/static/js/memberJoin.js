/**
 * 
 */

let check = false;
let result = false;
let otherCheck = false;
//전체 동의
$('.all').click(function(){
	check = $('.all').prop("checked");
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
		$('.all').prop("checked", true);
	}else{
		$('.all').prop("checked", false);
	}
});
//선택 동의 
$('.other').click(function(){
	otherCheck = $('.other').prop("checked");
	if(result&&otherCheck){
		$('.all').prop("checked", true);
	}else{
		$('.all').prop("checked", false);
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



//eb_email 
//.email value를 form:input path="email"에 입력
let id="";
let domain ="";
let emailF="";

$('.id').blur(function(){
	id=$(this).val();
	email();
})
$('select').change(function(){
	//직접 입력 선택시 인풋창 변화
	if($(this).val()=='1'){
		selectDomain = $(this).html();
		$(this).css('display','none');
		$('.domain').css('display','');
		$('#x').css('display','');
		return false;
	}
	domain = $(this).val();
	email();
})
//직접 입력 선택시 데이터 변수에 담기
$('.domain').blur(function(){
	domain = $(this).val();
	email();
})
//직접입력 선택시 취소할 수 있는 x버튼
$('#x').click(function(){
	$('.domain').css('display','none');
	$('#x').css('display','none');
	$('select').css('display','');
	$('select').val('0');
})

function email(){
	emailF = id+'@'+domain;
	$('#email').val(emailF);
}

=