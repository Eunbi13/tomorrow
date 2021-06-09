/**
 * 
 */

$("#like").on("click", function() {
	let hwNum = $("#hwNum").val();
	let username = $("#username").val();
	
	$.post("./", 
	{
		hwNum:hwNum,
		username:username
	}, 
	function(data){
		data = data.trim();
		if(data==1){
			alert('등록 성공');
			$("#hwNum").val('');
			$("#username").val('');
			getList();
		}else {
			alert('등록 실패');
		}
	});
	
})