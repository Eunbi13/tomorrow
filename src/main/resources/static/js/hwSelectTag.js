/**
 * 
 */

let hwNum = $("#comments").attr("title");
let picNum = 0;
let productNum = 0;

$("#sncontents").find("img").each(function(s1, s2) {
	$(s2).on("click", function() {
		console.log(s1);
		console.log(this);
		
		picNum = s1;
		
		this.append($(".tagSample").html());
		console.log($(".tagSample").html());
	});
});

function tagInsert() {
	productNum = $("#productNum").val().lastIndexOf("=");
	console.log($("#productNum").val());
	console.log(productNum);
	
	$.post("../hwTag/hwTagInsert", 
	{
		hwNum:hwNum,
		picNum:picNum,
		productNum:productNum
	}, 
	function(data){
		data = data.trim();
		if(data > 0){
			console.log("완료");
		} else {
			console.log("실패");
		}
	});
}