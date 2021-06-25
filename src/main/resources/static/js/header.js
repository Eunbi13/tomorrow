/**
 * eb_DOM이 생성되었을 시점에 실행=$(document).ready
 */
$(document).ready(function(){
	//페이지 열렸을 때 class="on"인 메뉴의 서브네비 보여주기
	
	//nav클릭할경우
	$('.na').click(function(){
		$('.na').removeClass('on');
		$(this).addClass('on');
	})
})
