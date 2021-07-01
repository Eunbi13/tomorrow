/**
 * 
 */

getList()

function getList() {
	console.log($("#sample1").html());
	$(".listHw").append($("#sample1").html());
}

$(".coverImg0").on("click", function() {
	$(".listHw").children().remove();
	console.log($("#sample0").html());
	$(".listHw").append($("#sample0").html());
});

$(".coverImg1").on("click", function() {
	$("#listHw").children().remove();
	console.log($("#sample1").html());
	$(".listHw").append($("#sample1").html());
});