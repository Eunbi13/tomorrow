/**
 * eb_memberLogin
 */
//페이지 열렸을 때 실행
$(document).ready(function(){
	//로그인 실패했을 때 이메일 인풋창에 밸류값을 넣기 위해 세션 설정
	//입력값이 변한다면 추적할 데이터를 세션에 저장
	 $('.loginInput-email').change(function(){
		sessionStorage.setItem('emailData', $('.loginInput-email').val());
	})
	//자동저장 값이 저장하는 지 판별
	//(페이지를 새로 불러올 경우에 경우에만 발생)
	if(sessionStorage.getItem('emailData')){
		//입력 칸에 복구
		$('.loginInput-email').val(sessionStorage.getItem('emailData'));
	}
	
	
	let error = $('.message').text().trim();
	console.log(error)
	if(error=='이메일을 확인해주세요.'){
		$('.loginInput-email').css('border-color', 'red');
	}else if(error=='비밀번호를 잘 못 입력하셨습니다.'){
		$('.loginInput-pw').css('border-color', 'red');
	}
	
})