/**
 * 
*/

let hwNum = $("#comments").attr("title");
getList();


$("#comments").on("click", ".remove", function(){
	hwReplyNum = $(this).val();
	console.log(hwReplyNum);
	
	$.post("../hwReply/hwReplyDelete", 
	{
		hwReplyNum:hwReplyNum
	}, 
	function(data){
		data = data.trim();
		if(data > 0){
			alert("삭제 완료");
			getList();
		} else {
			alert("삭제 실패");
		}
	});
});


function getList(){
	$.get("../hwReply/hwReplyList?hwNum="+hwNum,function(data){
		console.log(data);
		$("#comments").html(data.trim());
	});
}

$("#write").click(function(){
	let username = $("#username").val();
	console.log($("#username").val());
	let comment = $("#comment").val();
	console.log($("#comment").val());
	
	$.post("../hwReply/hwReplyInsert", 
	{
		hwNum:hwNum,
		username:username,
		comment:comment
	}, 
	function(data){
		data = data.trim();
		if(data==1){
			//alert('등록 성공');
			$("#username").val('');
			$("#comment").val('');
			getList();
		}else {
			alert('등록 실패');
		}
	});
});
