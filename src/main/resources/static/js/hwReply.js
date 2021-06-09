/**
 * 
*/

let hwNum = $("#comments").attr("title");
getList();


$("#comments").on("click", "#remove", function(){
	const ar = []; //빈 배열
	$(".del").each(function(){
		let ch = $(this).prop("checked");
		if(ch){
			ar.push($(this).val());
		}
	});
	
	$.ajax({
		type: "POST",
		url: "../hwReply/delete",
		traditional: true, //배열은 전송
		data:{hwReplyNum:ar},
		success:function(data){
			alert(data);
		}
	});
});

function getList(){
	$.get("../hwReply/list?hwNum="+hwNum,function(data){
		console.log(data);
		$("#comments").html(data.trim());
	});
}

$("#write").click(function(){
	let username = $("#username").val();
	let comment = $("#comment").val();
	
	$.post("../hwReply/insert", 
	{
		hwNum:hwNum,
		username:username,
		comment:comment
	}, 
	function(data){
		data = data.trim();
		if(data==1){
			alert('등록 성공');
			$("#username").val('');
			$("#comment").val('');
			getList();
		}else {
			alert('등록 실패');
		}
	});
});
