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


$('table').hide();

$('#modal').click(function(){
let kind="";
let names="";
	$('.kinds').each(function(i, k){
		kind = $(k).val();
		console.log(kind);
		
		$('.names').each(function(j, n){
			if(i==j){
				names = $(n).val().split('/');
				for(nm of names){
					console.log(nm);
					table(kind, nm);
					$('tbody').append(table(kind, nm));
					$('table').show();
				}
			}
		});
		
	});
	
	
});

function table(kind, name){
	let table1='<tr>'+
		'<td><input type="text" readonly="readonly" name="optionKinds" value="'+kind+'" style="border:none"></td>'+
		'<td><input type="text" readonly="readonly" name="optionName" value="'+name+'" style="border:none"></td>'+
		'<td><input type="number" name="optionPrice" value="0" ></td>'+
	'</tr>';
	return table1;
}
