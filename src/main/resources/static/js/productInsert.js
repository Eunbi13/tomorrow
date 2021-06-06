/**
 * 옵션쪽 구현 아직 안함
 */

$('.ch').click(function(){
	let categoryID=$(this).prop("value");
	$.ajax({
		type:"GET",
		url:"./getCategoryTwo",
		data:{categoryID: categoryID},
		success:function(data){
			$('#two').append(data);
		}
		
	});
});

$('#two').on('click', '.ch2', function(){
	let categoryID = $(this).prop("value");
	$.ajax({
		type:"GET",
		url:"./getCategoryThree",
		data:{categoryID: categoryID},
		success:function(data){
			$('#three').append(data);
		}
		
	});
	
});


