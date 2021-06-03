/**
 * 
 */

//더하기 버튼
$('#option').on("click", ".add",function(){
	alert('hio')
	
});

//옵션 추가

$('#use').click(function(){
		$.ajax({
			type: "GET",
			url: "/options/setOption",
			success: function(data){
				$('#option').append(data);
			}
		})
	}
	
});

//디테일 옵션 추가
$('#option').on("click", ".notDetailUse",function(){
	$('.detailOption').empty();
	
});
$('#option').on("click", ".detailUse",function(){
	
	let optionForm = $('.options').html();
	$('.detailOption').append(optionForm);
	
});