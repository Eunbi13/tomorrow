/**
 * 
 */
let url="";
let use= false;
$('#use').click(function(){
	use = $('#use').prop("checked");
});

$('#btn').click(function(){
	if(!use){
		$('#productFrm').submit();
	}else{
		alert(use);
	}
	
	
});