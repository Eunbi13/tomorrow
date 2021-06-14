/**
 * 
 */
//category select
$('li').click(function(){
	let id = $(this).attr('title');
	console.log(id)
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



