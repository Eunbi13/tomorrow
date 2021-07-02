/**
 * 
 */

$.ajax({
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