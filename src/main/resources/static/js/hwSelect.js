/**
 * 
 */

$("#like").on("click", function() {
	let hwNum = $("#hwNum").val();
	let username = $("#username").val();
	
	$.ajax({
		url:"./",
		type: "GET",
		data: {fileNum:fileNum},
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
	
})