/**
 * $.ajax({
		url:"./",
		type: "GET",
		data: {hwNum:hwNum},
		success:function(result){
			result=result.trim();
			if(result>0){
				alert("삭제 성공");
				$(obj).parent().remove();
				count--;
			}else {
				alert("삭제 실패");
			}
			
		}
		
	});
 */

$("#like").on("click", function() {
	let hwNum = $("#hwNum").val();
	let like = $("#like").val()+1;
	
	$.post("./update", 
	{
		hwNum:hwNum,
		like:like
	}, 
	function(data){
		data = data.trim();
		if(data==1){
			
		}else {
			alert('등록 실패');
		}
	});
	
})