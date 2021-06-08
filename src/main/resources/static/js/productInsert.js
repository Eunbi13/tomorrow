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

//modal controller
let check =false;
$('#use').click(function(){
	check=$('#use').prop('checked');
});
$('table').hide();
$('#add').click(function(){
	$('.addForm').append($('.optionForm').html());
});

function makeTable(kind, i){
	let thead=
		'<table class="table">'+
			'<thead>'+	 	
				'<tr id="thead">'+				
				'<th scope="col"></th>'+					
				'<th scope="col" class="kind'+i+'">'+kind+'</th>'+					
				'<th scope="col">옵션가격</th>'+					
				'<th scope="col"></th>'+					
				'</tr>'+				
			'</thead>'+				
			'<tbody class="t'+i+'">'+
			'</tbody>'+			
		'</table>';			
					
	return thead;
};


$('#modal').click(function(){
let kind="";
let names="";
let step="";
	$('.kinds').each(function(i, k){

		kind = $(k).val();
		//makeTable
		$('#test').append(makeTable(kind, i));
		
		console.log($('tbody').attr('title'));
			$('table').show();
			$('.names').each(function(j, n){
				if(i==j){
					names = $(n).val().split('/');
					for(nm of names){
						
						if(check){
							step=i;//조합형일 경우
						}else{
							step='0';
						}
						
						$('.t'+i).append(table(kind, nm, step));
						
					}
				}//if i==j
			});

	})
		
		
		
});
	


function table(kind, name, step){
	let t1=
		
		'<tr>'+
			'<td><input name="optionKinds" hidden="hidden"	  value="'+kind+'" style="border:none"></td>'+
			'<td><input name="optionName"  type="text"   readonly="readonly"  value="'+name+'" style="border:none"></td>'+
			'<td><input name="optionPrice" type="number" class="form-control" value="0" ></td>'+
			'<td><input name="step"		   hidden="hidden"      value="'+step+'"class="form-control"  ></td>'+
		'</tr>';
	
		return t1;
}
