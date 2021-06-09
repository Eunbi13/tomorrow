//imageAdd
$('#imageAdd').click(function(){
	
	let imageInput = $('.imageAdd>:eq(0)').html();
	$('.imageAdd').append(imageInput);
});
$('.imageAdd').on('click', 'div.imageInput', function(){
	$('.deleteImage').click(function(){
		alert('hi')
	$(this).html();
	console.log($(this).html())
});
});



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
						$('tbody.t'+countI).append(makeTbody(kind, nm, step));
						
					}
				}//if i==j
			});//each names
		
	})//each kind
//modal 닫힐 때 input창 초기화
	let optionForm =$('.optionForm').html();
	$('.optionForm').empty();
	$('.optionForm').html(optionForm);
});

$('#table').on('click','table', function(){
	let kind="";
	let step="";
	let name="";
	$('td.add').click(function(){
		let a = $(this).attr('title');
		console.log(a);//[name="optionKinds"]
		
		let count = $('tbody.'+a+'>tr').length;
		console.log(count);
		
		let c=$('tbody.'+a+'>:eq(0)').html();
		console.log(c)
		console.log('===========');
		console.log($(c+'>:eq(0)').html());
		console.log('===========');
//		console.log($(c+'>:eq(0)').children('td').html())
//		let f=$(c+' :nth-child(1):eq(0)').html();
//			console.log(f)
//		let x = $(c+'>:eq(0)').children('td:eq(0)').html();
//		console.log('xxxxxxxxxxx'+x)
		console.log($(c+' td').html())
		$(c+' td').each(function(i,k){
			console.log('k'+$(k).html())
			console.log('k'+$($(k).html()).attr('name'))
			console.log('k'+i)
			if($($(k).html()).attr('name')=='optionKinds'){
				kind=$($(k).html()).val();
			}
			if($($(k).html()).attr('name')=='step'){
				step=$($(k).html()).val();
			}
		})
		console.log('===========');
		console.log('===========');
		/*let oo = $(c).children('td');//[]
		$(oo).each(function(i, o){
			console.log('oo: '+$(o).html());
			console.log('oo: '+$(o).attr('name'));
			console.log('oo: '+$($(o).html()).attr('name'));
			console.log(i)
			if($($(o).html()).attr('name')=='optionKinds'){
				 kind = $($(o).html()).val();
				console.log(kind)
			}else if($($(o).html()).attr('name')=='step'){
				step = $($(o).html()).val();
				console.log(step);
			}
		});*/
		console.log('===========');
	/*	let xx = $(c+'>:eq(0)').children('td');//[]
		$(xx).each(function(i, x){
			
			console.log('xx: '+$(x).html());//xx: <input name="optionKinds" hidden="hidden" value="sd" class="tdKind">
			console.log('xx: '+$(x).attr('name'));
			console.log('xx: '+$($(x).html()).attr('name'));
			
			if($($(x).html()).attr('name')=='optionKinds'){
				 kind = $($(x).html()).val();
				console.log(kind)
			}else if($($(x).html()).attr('name')=='step'){
				step = $($(x).html()).val();
				console.log(step);
			}
		})*/
		
		//$('tbody.'+a).append('<tr>'+b+'</tr>');//그리고 makeTbody()사용하기 
		console.log('=========')
	
		$('tbody.'+a).append(makeTbody(kind, name, step));
		stop = $('tbody.'+a+'>tr').length;
		console.log(stop);
		if(count+1==stop){
			return false;
		}
	});
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
				'<tfoot><tr><td></td><td></td><td></td><td class="add" title="t'+i+'">+</td></tr></tfoot>'+			
			'</table>';	
};

function makeTbody(kind, name, step){
	return 	'<tr>'+
				'<td><input name="optionKinds" hidden="hidden"	value="'+kind+'" class="tdKind"></td>'+
				'<td><input name="optionName"  type="text"		value="'+name+'" class="tdName form-control" ></td>'+
				'<td><input name="optionPrice" type="number"	value="0" 		 class="tdPrice form-control" ></td>'+
				'<td><input name="step"		   hidden="hidden"	value="'+step+'" class="tdStep"></td>'+
			'</tr>';
}