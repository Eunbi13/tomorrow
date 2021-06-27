/**
 * eb_memberJoin&memberUpdate
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

/*update에서 프로필 사진 클릭하면 인풋창 */
$('.profileImage-add').click(function(){
	$('input[type="file"]').click();
})

//이미지(input태그)에 변화가 있을 경우
$('input[type="file"]').change(function(){
	//input태그를 매개변수로 준다.
	console.log(this);
	//<input hidden="hidden" id="rep" type="file" name="rep" class="form-control col-sm-10">
	console.log(this.files);
	//fileList {0:File, length:1}
	//선택자의 파일배열을 fileList에 담는다.
	let fileList = this.files;
	//파일리더 선언
	let reader = new FileReader();
	//이미지의 url을 읽어주는 메서드, 매개값으로 input에 담긴 파일을 넣는다.
	//base64 인코딩 된 스트링 데이터가 result 속성(attribute)에 담아지게 된다(자동)
	reader.readAsDataURL(fileList[0])
	//로드 이벤트가 실행되면 보여지고 싶은 선택자 src속성에 넣기
	reader.addEventListener('load', function(){
		$('.profileImage-add').attr('src', reader.result);
	})
})

