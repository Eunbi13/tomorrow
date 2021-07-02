/**
 * 
 */

let hwNum = $(".hwNumText").text();
let picNum = 0;
let productNum = 0;

/*
$("#sncontents").find("img").each(function(s1, s2) {
	$(s2).on("click", function() {
		console.log(s1);
		console.log(this);
		
		picNum = s1;
		
		this.append($(".tagSample").html());
		console.log($(".tagSample").html());
		
	});
});
*/

$(".plus").on("click", function() {
	$(".plus").prepend($(".tagSample").html());
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
	
	/*
	$.post("../housewarming/update", 
	{
		hwNum:hwNum,
		coverImg:1
	}, 
	function(data){
		data = data.trim();
		if(data > 0){
			console.log("완료");
			alert("발행 완료");
		} else {
			console.log("실패");
		}
	});
	*/
	
}