/**
 * 
 */

$(".familyType").on("click", ".fmtOption", function() {
		
	console.log($(this).val());

	$("#fmtBtn").val($(this).val());
	$("#fmt").append($("#sampleFmt").html());
	//console.log($(".fmtBtn").html());
});

//$(".delete").on("click", function() {
//	$(this).parent().remove();
//});