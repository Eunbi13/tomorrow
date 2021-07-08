/**
 * 
 */
$(document).ready(function(){
	
$('body').on('click', 'dt', function(){
	let categoryID = $(this).attr('title');
	let brandNum = $('#brandNum').attr('title');
	let categoryOneNM = $(this).text();
/*eb_brandHome.jsp*/
//category 선택하면 관련 상품 뜨기
	$.ajax({
		type:"GET",
		url:"/product/prodFromCat",
		data:{categoryID:categoryID, brandNum:brandNum},
		success:function(data){
			$('#productList').html(data);
		}		
		
	});
//eb_brandHome
//category 선택하면 선택한 카테고리와 그 하위 카테고리 보여주기
	$.ajax({
		type:"GET",
		url:"/product/getTwoCategory",
		data:{categoryID:categoryID, brandNum:brandNum},
		success:function(data){
			$('#select-category').html(data);
			$('#select-categoryOne').text(categoryOneNM);
		}		
		
	});

});





let price = [];
let disPrice = [];
$('.price').each(function(i, p){
//	console.log($(this).html())
	price.push($(this).text());
})

$('.disPrice').each(function(j, d){
//	console.log($(this).attr('title'))
	disPrice.push($(this).attr('title'));
})

$('.percent').each(function(k, per){
	let percent=disPrice[k]/price[k]*100
	$(per).text(parseInt(percent));
//	console.log(parseInt(percent))
})


})