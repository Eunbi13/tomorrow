/**
 * 
 */

/*eb_brandHome.jsp*/
//category select
$('li').click(function(){
	let categoryID = $(this).attr('title');
	let brandNum = $('#brandNum').attr('title');
	$.ajax({
		type:"GET",
		url:"/product/prodFromCat",
		data:{categoryID:categoryID, brandNum:brandNum},
		success:function(data){
			$('#productList').html(data);
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



