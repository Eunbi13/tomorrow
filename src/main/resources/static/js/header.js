/**
 * eb_DOM이 생성되었을 시점에 실행=$(document).ready
 */
$(document).ready(function(){
	//서브 네비 먼저 숨기기	
	$('.subNav-item').hide();
	//페이지 열렸을 때 url 주소에 따라 커뮤니티/스토어 선택되는 코드
	let homeUrl = location.href;
	let urlNum = homeUrl.lastIndexOf('localhost')+('localhost').length;
	$('.mainNav-item a').removeClass('on');
	$('a[href="'+homeUrl.substring(urlNum)+'"]').addClass('on');
	
	//열린 페이지 맞는 서브 네비 보여주기
	let title =$('.on').attr('title');
	$('#'+title).show();
	
	
	//프로필 클릭하면 드랍다운창 뜨면서 테두리 생기도록 설정
	//한번 더 클릭하면 드랍다운창 닫히면서 테두리도 닫힘
	let count=0;
	$('img[alt="profile"]').click(function(){
		$(this).css('border', '1px solid #A63F82');
		count++;
		console.log(count)
		if(count%2==0){
			$('img[alt="profile"]').css('border','');
		}
	})
	//마우스 위치에 따라 서브 네비 보이기
	$('.mainNav-item-T').mouseenter(function(){
		//scroll위치에 관계없이 보여주기 위해서 위치 바꾸기
		$('.sticky-chlid>div').css('transform','translate(0px, 0px)');
		title =$(this).attr('title');
		$('.subNav-item').hide();
		$('#'+title).show();
	})
	
	$('.mainNav-item-T').mouseleave(function(){
		$('.sticky-chlid>div').css('transform','translate(0px, -100px)');
	})
	//스크롤 위치 감지
	let scrollNum = $(document).scrollTop();
	$(window).scroll(function(){
		//스크롤 위치가 50보다 크면 css트랜드레이트 생기도록 하기
		if(scrollNum>100){
			$('.sticky-chlid>div').css('transform','translate(0px, -100px)');
		}else if(scrollNum<100||scrollNum==0){
			$('.sticky-chlid>div').css('transform','translate(0px, 0px)');
		}
	})

})



