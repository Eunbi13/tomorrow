/**
 * eb_DOM이 생성되었을 시점에 실행=$(document).ready
 */
$(document).ready(function(){
	//페이지 열렸을 때 실행
	open();
	function open(){
		//class="on"인 메뉴의 서브네비 보여주기
		$('.subNav-item').hide();
		let title =$('.on').attr('title');
		$('.'+title).show();
	}
	//nav클릭할경우
	$('nav a').click(function(){
		$('nav a').removeClass('on');
		$(this).addClass('on');
		open();
	})
	
		
		//$(this).css({'z-index':'500'})

})
