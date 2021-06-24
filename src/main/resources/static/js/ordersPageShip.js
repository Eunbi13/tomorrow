/**
 * 
 */



// shippingMemo : 직접입력 인풋박스 기존에는 숨어있다가

		
$("#directInputBox").hide();


$("#shippingMemo").change(function() {
              //직접입력을 선텍하면 나타남
		if($("#shippingMemo").val() == "5") {
			$("#directInputBox").show();
			
		}  else {
			$("#directInputBox").hide();
		}
});
 
 

/* $(function(){
	//shipping select는 이벤트락 없더라도 뿌려야한다. 
	getList(1)
	
	// shipping select를 가져오는 함수선언 - 호출을 해야 실행
    function getList(page){
		//기본페이지 처리
		if(!page) page =1;
		//데이터 수집
		let pageInfo = {};
		pageInfo.page = page;
		pageInfo.no = $("#no").text();
		//ajax 객체 호출 처리 -get 방식으로 처리할거라면  body에 안들어가고 url에 포함이..
		
	}
	
}) */
//shipping Update get!
$(document).on('click',".shipUpdateBtn", function(){

	console.log(" 수정 클릭");

	let shipNum = $(this).attr("title");
	console.log(shipNum);

		$.get("../shipping/shippingUpdate?shipNum="+shipNum, function(data){
			console.log(data)
			//받아온 정보를 shippingUp div 안에 넣기
			$("#shippingUp").html(data);
			// 수정 모달창 열기
			$("#shippingUpdateModal").modal();
			
		});

});
   
   
// shipping update post!
   $(document).on('click','#updateSave', function(){

   	let shipTitle= $("#shipTitle8").val();
   	let shipName= $("#shipName8").val();
   	let shipPhone= $("#shipPhone8").val();
   	let shipAddress= $("#sample8_address").val();
   	let shipDetailAddress= $("#sample8_detailAddress").val();
   	let postcode= $("#sample8_postcode").val();
   	
   	let username= $("#ordersUsername").attr("title");
   	let shipNum =$("#shipNum8").val();

   	//checkbox 체크여부 받아오기
   	let isDefault= $("#isDefault8").prop("checked");
      console.log(isDefault);
      console.log("username:"+username);
    //isDefault true를 체크했다면, 다른 shipping의 Defalut를 false로 업데이트 해줘야함
	   if(isDefault){
			console.log("isDefault 수정 시도");
			   
			   $.ajax({
			      	type: "post",
			      	url: "../shipping/shippingDefaultUpdate",
			      	data:{
			    
			           username:username
			      	},
			      	success:function(data){
			   			console.log("디폴트 수정 시도!!");
			   			data= $.trim(data);
			   			console.log(data);
			   			
			   			if(data=='1'){
			   			    console.log("디폴트 수정 성공했습니다.");
							   }
			           	}
			    })
		   }
      
      $.ajax({
      	type: "post",
      	url: "../shipping/shippingUpdate",
      	data:{
      	   shipNum: shipNum,
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
      		
   			console.log("수정시도!!");
   			data= $.trim(data);
   			console.log(data);
   			
   			if(data=='1'){
   			    console.log("배송지 수정 성공했습니다.");
   			    //update 성공후 update창 갱신 
   			    $("#shipTitle8").val('');
   				$("#shipName8").val('');
   				$("#shipPhone8").val('');
   				$("#sample8_address").val('');
   				$("#sample8_detailAddress").val('');
   			
   				$("#sample8_postcode").val('');
   				$("#isDefault8").val('');
   				
   				// shipping list 갱신하기 
   			    username= $("#ordersUsername").attr("title");
   			     
   				 $.get("../shipping/shippingList?username="+username,function(data){
   						console.log(data)
			            data= $.trim(data);
   						$("#shippingList").empty();
   						$("#shippingList").html(data);
   					
   					});
   				 
   				 $("#shippingUpdateModal").modal("hide"); //shipping Insert 모달 닫기 
   				
   				
   				
   				/* if(isDefault){
   					//default를 선택하면 다른 shippingVO의 default를 다 false로 만들어줘야한다
   					//ajax update 만들어서 넣어주시기
   					//ajax list만들어서 넣어주기
   				} */
   			}else{
   				alert("수정 실패했습니다.");
   			}
      		
         	}
         
       })
       
       

   	
     });
   	
   	
  


//shipping Delete!
$(document).on('click',".shipDelBtn", function(){

	console.log("삭제 클릭");

	let shipNum = $(this).attr("title");
	console.log(shipNum);
	let result =confirm("삭제하시겠습니까?");
	if(result){
		console.log("삭제 통과")
		$.get("../shipping/shippingDelete?shipNum="+shipNum, function(data){
			
			alert("배송지를 삭제하였습니다.");
			//getList
			let username= $("#ordersUsername").attr("title");
			console.log("username:"+ username);
			 $.get("../shipping/shippingList?username="+username,function(data){
					console.log(data)
					 data= $.trim(data);
					$("#shippingList").empty();
					$("#shippingList").html(data);
				
				});
		   
			
		});
		
		

	}
	
	
});


//이미 배송지수가 5개라면 '배송지 5개 초과로 입력할 수 없습니다.'경고창띄우기
$("#shippingAdd").click(function(){
	
	let shippingLength=$("#shippingListSize").attr("title");
	if(shippingLength>4){
		alert("배송지는 5개까지 입력할 수 있습니다."
				+"다른 배송지를 입력하시려면 배송지 리스트안의 배송지를 삭제하시고 진행해주세요.")
		//배송지가 5개 이상일때 shipping insert창의 연결을 끊는다
		$(this).attr("data-target"," ");
			  
	
	} else{
		$(this).attr("data-target","#shippingInsertModal");
	}
	
});

// shipping Insert!
$(document).on('click',"#shipInsertBtn", function(){

	let shipTitle= $("#shipTitle").val();
	let shipName= $("#shipName").val();
	let shipPhone= $("#shipPhone").val();
	let shipAddress= $("#sample6_address").val();
	let shipDetailAddress= $("#sample6_detailAddress").val();
	let postcode= $("#sample6_postcode").val();
	
	let username= $("#ordersUsername").attr("title");

	//checkbox 체크여부 받아오기
	let isDefault= $("#isDefault").prop("checked");
     console.log(isDefault);
     console.log("username:"+username);
   //isDefault true를 체크했다면, 다른 shipping의 Defalut를 false로 업데이트 해줘야함
	   if(isDefault){
			console.log("isDefault 수정 시도");
			   
			   $.ajax({
			      	type: "post",
			      	url: "../shipping/shippingDefaultUpdate",
			      	data:{
			    
			           username:username
			      	},
			      	success:function(data){
			   			console.log("디폴트 수정 시도!!");
			   			data= $.trim(data);
			   			console.log(data);
			   			
			   			if(data=='1'){
			   			    console.log("디폴트 수정 성공했습니다.");
							   }
			           	}
			    })
		   }
		
   console.log("shipDetailAddress"+shipDetailAddress);
   
   $.ajax({
   	type: "post",
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
			
			console.log("새로운isDefault!!"+isDefault);
			data= $.trim(data);
			console.log(data);
			
			if(data=='1'){
				console.log("배송지 입력 성공했습니다.");
				
				
				// shipping insert창 갱신
			    $("#shipTitle").val('');
				$("#shipName").val('');
				$("#shipPhone").val('');
				$("#sample6_address").val('');
				$("#sample6_detailAddress").val('');
			
				$("#sample6_postcode").val('');
				$("#isDefault").prop("checked", false);
					   
					      	
									
				// shipping list 갱신하기 
			    username= $("#ordersUsername").attr("title");
			     
				 $.get("../shipping/shippingList?username="+username,function(data){
						console.log(data)
						data= $.trim(data);
						$("#shippingList").empty();
						$("#shippingList").html(data);
					
					});
				 
				 $("#shippingInsertModal").modal("hide"); //shipping Insert 모달 닫기 
				
				
				
				/* if(isDefault){
					//default를 선택하면 다른 shippingVO의 default를 다 false로 만들어줘야한다
					//ajax update 만들어서 넣어주시기
					//ajax list만들어서 넣어주기
				} */
			}else{
				alert("등록 실패했습니다.");
			}
   		
      	}
   	
      
    })
    
    
     
    
    
    
    

	
  });
	
	
	


 
//shipping List

function getList(){
	let username= $("#ordersUsername").attr("title");
	
	 $.get("../shipping/shippingList?username="+username,function(data){
			console.log(data)
			data= $.trim(data);
			$("#shippingList").empty();
			$("#shippingList").html(data);
		
		});
	
	
	}
 

	
//shipping list에서 선택 버튼 누를시, 주문페이지에 나타는 배송지 정보가 변한다. 	
$(document).on('click', '.shipSelect', function(){
	let shipNum =$(this).attr("title");
	
    console.log(shipNum);
    
    
    
    $.get("../shipping/shippingSelect?shipNum="+shipNum,function(data){
		console.log(data)
		data= $.trim(data);
		$("#shippingSel").empty();
		$("#shippingSel").html(data);
		$('#shippingListModal').modal("hide"); //모달 닫기 
	});
    
});
	
	 //--------shippingSelect
function getSelect(){
    $.get("../shipping/shippingSelect?shipNum="+shipNum,function(data){
		console.log(data)
		data= $.trim(data);
		$("#shippingSel").empty();
		$("#shippingSel").html(data);
		
	});
 }

	
//shipping 삭제


	
	