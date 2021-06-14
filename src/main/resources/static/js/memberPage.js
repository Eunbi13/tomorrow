/**
 * 
 */

$('#brandHome').click(function(){
	let username = $('#username').text();
	$.ajax({
		type:"POST",
		url:"/product/list",
		data:{username: username},
		success:function(data){
			$('#contents').append(data);
		}
	});
});