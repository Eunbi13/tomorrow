/**
 * eb_DOM이 생성되었을 시점에 실행=$(document).ready
 */
$(document).ready(function(){
	//페이지 열렸을 때 실행
	open();
	function open(){
		//class="on"인 메뉴의 서브네비 보여주기
		let title =$('.on').attr('title');
		console.log(title)
		//let subNavItem=$('.'+title).html();
		//$('.subNav').html(subNavItem);
		$('#'+title).show();
	}
	//nav클릭할경우
	$('nav a').click(function(){
		$('nav a').removeClass('on');
		$(this).addClass('on');
		open();
	})
	
	$('.mainNav-item a').mouseenter(function(){
		//let subNavItem=$('.item-community').html();
		//$('.subNav').html(subNavItem);
		let title =$(this).attr('title');
		$('.subNav-item').hide();
		$('#'+title).show();
	})
	
	$('a[title="item-community"]').mouseleave(function(){
		open();
	})
	
	$('a[title="item-store"]').mouseenter(function(){
		let subNavItem=$('.item-store').html();
		$('.subNav').html(subNavItem);
	})
	
	$('a[title="item-store"]').mouseleave(function(){
		open();
	})
	
	/*
		프로필 드랍박스 보더 설정
		홀수면 프로필 드랍박스 클릭한 것임으로 css 설정
		짝수면 프로필 드랍박스 벗어난 것임으로 css 초기화
	*/
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
	$('a[title="item-community"]').mouseenter(function(){
		$('.subNav').css('position', 'inherit')
	})
	$('a[title="item-store"]')

})