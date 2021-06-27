/**
 * 
 */

//----결제하기 누를때 시행되는 이벤트

let payment = $("#payment").attr("title");
let email= $("#email").val();
let name=$("#name").val();
let phone=$("#phone").val();

let address=$("#shipAddress").html();
console.log(address);
let postcode=$("#shipPostcode").val();


$("#finalBtn").click(function(){
	
	
	 if($("#shipFrm3").length>0){
		//shippingVO가 아예없었을 경우, form에 입력한 배송지 정보부터 shipping DB에 입력해 준다.
		 console.log("shipFrm3  enter!!");
	
	// shipping Insert!
		let shipTitle= $("#shipTitle7").val();
		let shipName= $("#shipName7").val();
		let shipPhone= $("#shipPhone7").val();
		let shipAddress= $("#sample7_address").val();
		let shipDetailAddress= $("#sample7_detailAddress").val();
		let postcode= $("#sample7_postcode").val();
		let shipNum;
		let username= $("#ordersUsername").attr("title");
		
		//checkbox 체크여부 받아오기
		let isDefault= $("#isDefault7").prop("checked");
		console.log(isDefault);
		console.log("username:"+username);
		
		
		$.ajax({
			type: "post",
			async: false,
			url: "../shipping/shippingInsert",
			data:{
			shipTitle: shipTitle,
			shipName: shipName,
			shipPhone: shipPhone, 
			shipAddress: shipAddress,
			shipDetailAddress:shipDetailAddress,
			postcode: postcode,
			isDefault: isDefault,
			username:username
			},
			success:function(data){
			console.log("시도!!");
			data= $.trim(data);
			console.log(data);
			
			if(data=='1'){
			console.log("배송지 입력 성공했습니다.");
			
			// shipping list 갱신하기 - 아마 안함.
		
			
			
		//------ 배송지 입력 성공하면, 본격 결제 시작
				//가맹점 식별코드
				IMP.init('imp63068221');
				IMP.request_pay({
				    pg : 'html5_inicis',
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : '내일의집', //결제창에서 보여질 이름
				    amount : 100, //실제 결제되는 가격
				    buyer_email : email,
				    buyer_name : name,
				    buyer_tel : phone,
				    buyer_addr : '서울 강남구 도곡동',
				    buyer_postcode : '12345'
				}, function(rsp) {
					console.log(rsp);
				    if ( rsp.success ) {
				    	var msg = '결제가 완료되었습니다.';
				        msg += '고유ID : ' + rsp.imp_uid;
				        msg += '상점 거래ID : ' + rsp.merchant_uid;
				        msg += '결제 금액 : ' + rsp.paid_amount;
				        msg += '카드 승인번호 : ' + rsp.apply_num;
				        //결제 완료!
				        //cart/orderUpdate: 이제 결제한 cartVO에  orderNum을 넣고  validity를 '결제완료'를 뜻하는 '2' 로 바꾼다.
				         //--------ajax DB Update 
								let orderNum = $("#orderNum").val();
								let validity;
								$(".validity").each(function(){
									validity=$(this).val();
								});
								
								console.log("validity:"+validity);
								console.log("orderNum:"+orderNum);
								$.ajax({
									type: "post",
									url:"../cart/orderUpdate",
									data:{
										orderNum:orderNum,
									    validity: validity
									},
									success:function(data){
										
										data = data.trim();
										console.log("../cart/orderUpdate 후 data"+data);
										if(data>0){
											alert('주문 성공');
											
			    
											
											
										// cartVO 업데이트 성공했으면, ordersVO 업데이트 시작
										// orderVO update: paymentType, shippingMemo,name,email, phone , shipName, shipPhone, shipAddress, postcode
								        //넘어온 cartVO의 orderNum에도 이 order넘버를 넣어준다!

											  
													let shipName= $("#shipName7").val();
													let shipPhone= $("#shipPhone7").val();
													let shipAddress= $("#sample7_address").val()+ $("#sample7_detailAddress").val();
													let postcode= $("#sample7_postcode").val();
												
												
								          
									                orderNum = $("#orderNum").val();
													let paymentType = rsp.card_name;
												/*let shipName=$("#shipName").text();
													let shipPhone = $("#shipPhone").text();
													let shipAddress =$("#shipAddress").text();
													let postcode=$("#shipPostcode").val(); */
											
													//shippingMemo는 선택된 selected된 값을 가져오고 그것이 5일 경우에는, 또 따로 받아온다.
													
													let shippingMemo=$("#shippingMemo option:selected").val();
													console.log("shippingMemo value :"+shippingMemo);
													if(shippingMemo==5){
														console.log("입장. 쉽핑 수정을 위한,,")
														shippingMemo= $("#directInputBox").val();	
													}
													console.log("shippingMemo:"+shippingMemo);
													console.log("paymentType:"+paymentType);
													console.log("orderNum:"+orderNum);
													
													$.ajax({
														type: "post",
												        async: false,
														url:"../orders/ajaxUpdate",
														data:{
															 paymentType:paymentType, 
															 shippingMemo:shippingMemo,
															 orderNum:orderNum,
															 shipName:shipName,
															 shipPhone:shipPhone,
															 shipAddress:shipAddress,
														     postcode:postcode
														},
														success:function(data){
															
															data= $.trim(data);
															console.log("trim 이후 data"+data);
															if(data>0){
															alert('업데이트 성공');
															
															    //  ordersVO 업데이트  성공하면, 주문자 정보 업데이트 하면서 결제완료 페이지로 넘겨준다.
															    $("#updateFrm").submit();
															}else{
																
															alert('업데이트 실패');
															}
															
														}
													})
													
														
													
										}else {
											alert('주문 실패');
										}
									}
								})
				
				     
				        //그 이후로는 판매자가 validity를 바꿀수있다.배송완료, 취소등 상태에 따라  validity를 바꿔줘야한다.
				        //validity가 '2'로 바꾸는 순간, cartVO의 brandNum 대로,브랜드의 관리페이지에서 결제가 들어온 것을 확인가능하다.
				  
				        
				    } else {
				    	 var msg = '결제에 실패하였습니다.';
				         msg += '에러내용 : ' + rsp.error_msg;
				    }
				    alert(msg);
				});
				 
			
			
			
			}else{
			alert("등록 실패했습니다.");
			} //배송지등록 끝 
			
			} //배송지 석세스
			
			
			
			
		}) //배송지 등록Ajax끝 
	 }else{
		//shippingVO(배송지)가 하나라도 있는 경우, 바로 결제 시작 
	
	  //------  결제 시작
		//가맹점 식별코드
			IMP.init('imp63068221');
			IMP.request_pay({
			    pg : 'html5_inicis',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '내일의집', //결제창에서 보여질 이름
			    amount : 100, //실제 결제되는 가격
			    buyer_email : email,
			    buyer_name : name,
			    buyer_tel : phone,
			    buyer_addr : '서울 강남구 도곡동',
			    buyer_postcode : '12345'
			}, function(rsp) {
				console.log(rsp);
			    if ( rsp.success ) {
			    	var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			        //결제 완료!
			        //이제 결제한 cartVO에  orderNum을 넣고  validity를 '결제완료'를 뜻하는 '2' 로 바꾼다. 
			          //--------ajax DB Update 
								let orderNum = $("#orderNum").val();
								let validity;
								$(".validity").each(function(){
									validity=$(this).val();
								});
								
								console.log("validity:"+validity);
								console.log("orderNum:"+orderNum);
								$.ajax({
									type: "post",
									url:"../cart/orderUpdate",
									data:{
										orderNum:orderNum,
									    validity: validity
									},
									success:function(data){
										
										data = data.trim();
										console.log("../cart/orderUpdate 후 data"+data);
										if(data>0){
											alert('주문 성공');
											
										// cartVO 업데이트 성공했으면 ordersVO 업데이트 시작
										// orderVO update: paymentType, shippingMemo,name,email, phone , shipName, shipPhone, shipAddress, postcode
								        //넘어온 cartVO의 orderNum에도 이 order넘버를 넣어준다!
								          
									                orderNum = $("#orderNum").val();
													let paymentType = rsp.card_name;
													let shipName=$("#shipName5").val(); 
													let shipPhone = $("#shipPhone5").val();
													let shipAddress =$("#shipAddress").text();
													let postcode=$("#shipPostcode").val();
													
													console.log("shipName:"+shipName);
													console.log("shipAddress:"+shipAddress);
													console.log("postcode:"+postcode);
													console.log("shipPhone:"+shipPhone);
													
											
													//shippingMemo는 선택된 selected된 값을 가져오고 그것이 5일 경우에는, 또 따로 받아온다.
													
													let shippingMemo=$("#shippingMemo option:selected").val();
													console.log("shippingMemo value :"+shippingMemo);
													if(shippingMemo==5){
														console.log("입장. 쉽핑 수정을 위한,,")
														shippingMemo= $("#directInputBox").val();	
													}
													console.log("shippingMemo:"+shippingMemo);
													console.log("paymentType:"+paymentType);
													console.log("orderNum:"+orderNum);
													
													$.ajax({
														type: "post",
												        async: false,
														url:"../orders/ajaxUpdate",
														data:{
															 paymentType:paymentType, 
															 shippingMemo:shippingMemo,
															 orderNum:orderNum,
															 shipName:shipName,
															 shipPhone:shipPhone,
															 shipAddress:shipAddress,
														     postcode:postcode
														},
														success:function(data){
															
															data= $.trim(data);
															console.log("trim 이후 data"+data);
															if(data>0){
															alert('업데이트 성공');
															
															
															    $("#updateFrm").submit();
															}else{
																
															alert('업데이트 실패');
															}
															
														}
													})
													
												
									}else {
										alert('주문 실패');
									} //if end
								} //success end
							}) //cart/orderUpdate 끝
			
			     
			        //그 이후로는 판매자가 validity를 바꿀수있다.배송완료, 취소등 상태에 따라  validity를 바꿔줘야한다.
			        //validity가 '2'로 바꾸는 순간, cartVO의 brandNum 대로,브랜드의 관리페이지에서 결제가 들어온 것을 확인가능하다.
			  
			        
			    } else {
			    	 var msg = '결제에 실패하였습니다.';
			         msg += '에러내용 : ' + rsp.error_msg;
			    }  //결제 성공 if end
			    alert(msg);
			});  //function(rsp)  end
			
	 }//(shippingVO있을때 )if end
		
		
		
		
});// click event end


// 주문상품의 brand Shipping 표시하기 

$(".cartVOShipping").each(function(){
	let brandNum =$(this).attr("data-brandNum");
	let brandShipping =$(this).val();
	
	let shippingInput="무료배송";
	if(brandShipping!=0){
		  shippingInput ="배송비 "+brandShipping+"원";
	}
	
	 console.log("shippingInput: "+shippingInput);
	$("#brandShipping"+brandNum).text(shippingInput);
	
});






	 



