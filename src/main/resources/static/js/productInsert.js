/**
 * 옵션쪽 구현 아직 안함
 */
//대분류에서 선택시
$('.ch').click(function(){
	let categoryID=$(this).prop("value");
	$.ajax({
		type:"GET",
		url:"./getCategoryTwo",
		data:{categoryID: categoryID},
		success:function(data){
			$('#two').append(data);
		}
		
	});
});
//중분류에서 선택시
$('#two').on('click', '.ch2', function(){
	let categoryID = $(this).prop("value");
	$.ajax({
		type:"GET",
		url:"./getCategoryThree",
		data:{categoryID: categoryID},
		success:function(data){
			$('#three').append(data);
			$('#three').on('click', '.ch2', function(){
				$(this).prop("name", "categoryID");
			});
		}
		
	});
	
});


$('#add').click(function(){
	$('.addForm').append($('.optionForm').html());
});

$('#signUpOption').click(function(){
	
	$('tbody').empty();
	let kinds = $('.kinds').value();
	alert(kinds);
	let names = $('.names').value();
	let nameList = names.split('/');
	for(name of nameList){
		
		alert(name)
		$('tbody').append(table(kinds, name))
	}
});

function table(kinds, name){
	'<tr>'+
		'<td>'+kinds+'</td>'+
		'<td>'+name+'</td>'+
	'</tr>'
}
