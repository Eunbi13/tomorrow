/**
 * 
 */
$('#notUse').click(function(){
	$('#option').empty();
});

$('#use').click(function(){
	$.ajax({
		type: "GET",
		url: "/options/setOption",
		success: function(data){
			$('#option').append(data);
		}
	})
	
	
});

$('#option').on("click", ".notDetailUse",function(){
	$('.detailOption').empty();
});

$('#option').on("click", ".detailUse",function(){
	let optionForm = $('.addOption').html();
	$('.detailOption').append(optionForm);
	alert('hi')
});