/**
 * 
 */


$('#use').click(function(){
	$.ajax({
		type: "GET",
		url: "/options/setOption",
		success: function(data){
			$('#option').append(data);
		}
	})
	
	
});

$('#notUse').click(function(){
	$('#option').empty();
});

