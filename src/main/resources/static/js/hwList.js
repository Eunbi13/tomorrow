/**
 * 



$(".coverImg0").on("click", function() {
	$(".coverImg1").remove();
	console.log($("#sample0").html());
	$(".listHw").append($("#sample0").html());
});

$(".coverImg1").on("click", function() {
	$("#listHw").children().remove();
	console.log($("#sample1").html());
	$(".listHw").append($("#sample1").html());
});

 */