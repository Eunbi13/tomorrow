//imageAdd
$('#imageAdd').click(function(){
	let imageInput = $('#filesSample').html();
	$('#files').append(imageInput);
});
//imageDelete
$('#files').on('click', '.deleteImage', function(){
	$(this).parent().remove();
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
/*
modal controller
일체형일경우 false, 조합형일 경우 true
옵션 구성 타입의 값이 달라지면 table초기화
*/
let check =false;

$('#notUse').change(function(){
	check=$('#use').prop('checked');
	$('#table').empty();
})
$('#use').change(function(){
	check=$('#use').prop('checked');
	$('#table').empty();
})
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
	$('.addForm').empty();
	$('.optionForm').html(optionForm);
});


let count =0;
$('#table').on('click','table', function(){
	//테이블에 행 추가
	$('td.add').click(function(){
		let kind="";
		let step="";
		let name="";
		//table 찾기 위한 title 값
		let a = $(this).attr('title');
		//makeTbody할때 내가 클릭한 총 횟수만큼 이벤트가 일어남,, 왜지?
		//그걸 방지하기 위한 count와 stop 변수
		count = $('tbody.'+a+'>tr').length;
		
		console.log(count)
		let c=$('tbody.'+a+'>:eq(0)').html();
		$(c+' td').each(function(i,k){
			if($($(k).html()).attr('name')=='optionKinds'){
				kind=$($(k).html()).val();
			}
			if($($(k).html()).attr('name')=='step'){
				step=$($(k).html()).val();
			}
		})
		
		$('tbody.'+a).append(makeTbody(kind, name, step));
		let stop = $('tbody.'+a+'>tr').length;
		if(count+1==stop){
			return false;
		}
	});
	
	//테이블에 행 삭제
	$('.rowDelete').click(function(){
		let tbody =$(this).parent().parent().html();
		count = $(tbody+'>tr').length-1;
		$(this).parent().remove();
		console.log('dd'+count)
	});
	
	//테이블 삭제
	$('.tableDelete').click(function(){
		$(this).parents('table').remove();
		
		//중복 방지를 위해 테이블에 있는 값들을 수정해야함
		let tNum =$('table').length;
		console.log(tNum)
		$('table').each(function(i, t){
			console.log('i: '+i)
			let table = $(t).html();
			console.log(table);//table 부터 시작,, 
			//여기까지 thead랑 뜸>>t에서 해결을 봐야함.
			let thead = $(t).find('thead').html();//이래도 tr이 뜸,, thead
			//thead x tbody class, step &tfoot title
			/*$(table).each(function(i,j){
				console.log($(j).html())
				//여기서부터 tr이 뜸
			})*/
			//let thead = $(t+':has(thead)').html();
			console.log('THEAD:: '+thead);
			let tbody = $(table).nextAll('tbody').html();
			console.log('TBODY:: '+tbody);
			let tfoot = $(table).nextAll('tfoot').html();
			console.log('TFOOT:: '+tfoot);
			console.log('==================');
			$($(tbody).parent().html()).removeClass();
			console.log($(tbody).parent())//undifined
			$($(tbody).parent().html()).addClass('t'+i)
			/*let thead = $(t).find('thead>tr').html();
			//thead = $(thead+'.tH').html();
			console.log(thead);
			;
			console.log($(thead).find('.tH').html())
			
			$(tbody).addClass('')
			//tbody = $(tbody).find('input[name="step"]').html();
			console.log(tbody);
			let tfoot = $(t).find('tfoot>tr').html();
			//tfoot = $(tfoot).find(td.tF).html();
			console.log(tfoot);*/
		});
	});
});



//make Table code
function makeThead(kind, i){
	return	'<table class="table">'+
				'<thead>'+	 	
					'<tr class="thead">'+				
						'<th scope="col"></th>'+					
						'<th scope="col">'+kind+'</th>'+					
						'<th scope="col">옵션가격</th>'+					
						'<th scope="col"></th>'+
						'<th scope="col" class="tableDelete">x</th>'+					
					'</tr>'+				
				'</thead>'+				
				'<tbody class="t'+i+'">'+
				'</tbody>'+
				'<tfoot>'+
					'<tr class="tfoot">'+
						'<td></td><td></td><td></td><td></td><td class="add" title="t'+i+'">+</td>'+
					'</tr>'+
				'</tfoot>'+			
			'</table>';	
};

function makeTbody(kind, name, step){
	return 	'<tr class="tbody">'+
				'<td><input name="optionKinds" hidden="hidden"	value="'+kind+'" class="tdKind"></td>'+
				'<td><input name="optionName"  type="text"		value="'+name+'" class="tdName form-control" ></td>'+
				'<td><input name="optionPrice" type="number"	value="0" 		 class="tdPrice form-control" ></td>'+
				'<td><input name="step"		   hidden="hidden"	value="'+step+'" class="tdStep"></td>'+
				'<td class="rowDelete" >x</td>'+
			'</tr>';
}