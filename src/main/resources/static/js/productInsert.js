
//대분류에서 선택시
$('.ch').click(function(){
	let check = $('.ch').prop('checked');
	//중복방지
	$('#two').empty();
	$('#three').empty();
	$('.ch[name="one"]').prop('checked', false);
	$(this).prop('checked', true);
	
	if(check){
		let categoryID=$(this).prop("value");
		
		$.ajax({
			type:"GET",
			url:"./getCategoryTwo",
			data:{categoryID: categoryID},
			success:function(data){
				$('#two').append(data);
			}
		});//ajax
	}//if check
});

//중분류에서 선택시
$('#two').on('click', '.ch2', function(){
	let check = $(this).prop('checked');
	//중복방지
	$('#three').empty();
	$('.ch2[name="two"]').prop('checked', false);
	$(this).prop('checked', true);
	
	if(check){
		let categoryID = $(this).prop("value");
	
		$.ajax({
			type:"GET",
			url:"./getCategoryThree",
			data:{categoryID: categoryID},
			success:function(data){
				$('#three').append(data);
				$('#three').on('click', '.ch2', function(){
					$(this).prop("title", "three");
					$(this).prop("name", "categoryID");
				});
			}
		});//ajax
	}//if check
});

$('#three').on('click', '.ch2', function(){
	//중복방지
	$('.ch2[title="three"]').prop('checked', false);
	$(this).prop('checked', true);
})

//modal controller
//일체형일경우 false, 조합형일 경우 true
let check =false;
$('#use').click(function(){
	check=$('#use').prop('checked');
});
//modal내부에 +버튼
$('#add').click(function(){
	$('.addForm').append($('.optionForm').html());
});
//modal close
$('#modal').click(function(){
	//count: 만들어진 테이블이 있을 경우, i값이 같아서 중복으로 tr태그가 들어가는 것을 방지
	let count=$('table').length;
	console.log('table: '+count);
	let kind="";
	let names="";
	let step="";
	
	$('.kinds').each(function(i, k){
		countI = count+i;
		kind = $(k).val();
		//makeThead
		$('#table').append(makeThead(kind, countI));
			
			$('.names').each(function(j, n){
				if(i==j){
					names = $(n).val().split('/');
					for(nm of names){
						
						if(check){
							step=countI;//조합형일 경우
						}else{
							step='0';
						}
						//makeTbody
						$('.t'+countI).append(makeTbody(kind, nm, step));
						
					}
				}//if i==j
			});//each names
		
	})//each kind
//modal 닫힐 때 input창 초기화
	let optionForm =$('.optionForm').html();
	$('.optionForm').empty();
	$('.optionForm').html(optionForm);
});

$('#table').on('click','.table', function(){
	$('this').html();
	console.log($('this').html())
	$('this :td.add').click(function(){
		alert('hi')
	})
	//kind, step 가져와야함
	console.log($('this').toString())
	$('this').addClass('select');
	//console.log($('this').html())
	console.log($('td.add').parent().html());//tr의 내부가 나타남
	console.log($('td.add').parent().parent().html());//tfoot내부 
	console.log($('td.add').parent().parent().parent().html());//table까지 나타나지만, 무조건 첫번째 요소
	let name="";
	
});

//make Table code
function makeThead(kind, i){
	return	'<table class="table">'+
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
				'<tfoot><tr><td></td><td></td><td></td><td class="add">+</td></tr></tfoot>'+			
			'</table>';	
};

function makeTbody(kind, name, step){
	return 	'<tr>'+
				'<td><input name="optionKinds" hidden="hidden"	value="'+kind+'"></td>'+
				'<td><input name="optionName"  type="text"		value="'+name+'" class="form-control" ></td>'+
				'<td><input name="optionPrice" type="number"	value="0" 		 class="form-control" ></td>'+
				'<td><input name="step"		   hidden="hidden"	value="'+step+'"></td>'+
			'</tr>';
}