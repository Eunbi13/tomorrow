<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>



</style>
<!-- shipping  -->
<script src="./jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- shipping  -->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<input type="text" id="sample6_postcode" placeholder="우편번호">
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" id="sample6_address" placeholder="주소"><br>
<input type="text" id="sample6_detailAddress" placeholder="상세주소">
<input type="text" id="sample6_extraAddress" placeholder="참고항목">

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>


<!-- 배송지 리스트 button -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#shippingListModal">Open Modal</button>

<!-- 배송지 리스트 Modal -->
<div id="shippingListModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" style="text-align: center; ">배송지 선택</h4>
      </div>
      <div class="modal-body">
      
      <input type="text" id="sample6_postcode" placeholder="우편번호">
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" id="sample6_address" placeholder="주소"><br>
<input type="text" id="sample6_detailAddress" placeholder="상세주소">
<input type="text" id="sample6_extraAddress" placeholder="참고항목">
        
        
        	<!-- shipping select -->
	          <div class="card container" style="width: 100%; height:150px; padding-left:20px; margin-bottom: 20px; border: 1px solid LightGray; border-radius: 10px;">
				  <div class="card-body ">
				  
				      <h5 class="card-title" style="font-weight: bold; padding-top:10px;  font-size: 18px;">본가</h5>
				   
				     
				          <div style="font-size: 16px; font-weight: "> 서울 강남구 개포로 202 (개포동) 석인빌딩, 쌍용</div>
				    	  <div  style="font-size: 14px; font-weight: lighter;"> 이미주 010-1234-1234 </div>
				    	
						
				    	 <div style="width:130px; height:50px; padding:10px 0px 10px 10px; float: left;">
							 <button type="button" class="btn">삭제</button>   
							 <button type="button" class="btn">수정</button>
						 </div>
						 <div style="width:70px; height:50px;  padding:10px; float: right;">
						   <button type="button" class="btn btn-info">선택</button>
						 </div>
					  
				  </div>
			  </div>
			  	<!-- shipping select  end -->
			  	
			  	<!-- shipping select -->
	          <div class="card container" style="width: 100%; height:150px; padding-left:20px; margin-bottom: 20px; border: 1px solid LightGray; border-radius: 10px;">
				  <div class="card-body ">
				  
				      <h5 class="card-title" style="font-weight: bold; padding-top:10px;  font-size: 18px;">본가</h5>
				   
				     
				          <div style="font-size: 16px; font-weight: "> 서울 강남구 개포로 202 (개포동) 석인빌딩, 쌍용</div>
				    	  <div  style="font-size: 14px; font-weight: lighter;"> 이미주 010-1234-1234 </div>
				    	
						
				    	 <div style="width:130px; height:50px; padding:10px 0px 10px 10px; float: left;">
							 <button type="button" class="btn">삭제</button>   
							 <button type="button" class="btn">수정</button>
						 </div>
						 <div style="width:70px; height:50px;  padding:10px; float: right;">
						   <button type="button" class="btn btn-info">선택</button>
						 </div>
					  
				  </div>
			  </div>
			  	<!-- shipping select  end -->
			  
			  
			  <!-- shipping select -->
	          <div class="card container" style="width: 100%; height:150px; padding-left:20px; margin-bottom: 20px; border: 1px solid LightGray; border-radius: 10px;">
				  <div class="card-body ">
				  
				      <h5 class="card-title" style="font-weight: bold; padding-top:10px;  font-size: 18px;">본가</h5>
				   
				     
				          <div style="font-size: 16px; font-weight: "> 서울 강남구 개포로 202 (개포동) 석인빌딩, 쌍용</div>
				    	  <div  style="font-size: 14px; font-weight: lighter;"> 이미주 010-1234-1234 </div>
				    	
						
				    	 <div style="width:130px; height:50px; padding:10px 0px 10px 10px; float: left;">
							 <button type="button" class="btn">삭제</button>   
							 <button type="button" class="btn">수정</button>
						 </div>
						 <div style="width:70px; height:50px;  padding:10px; float: right;">
						   <button type="button" class="btn btn-info">선택</button>
						 </div>
					  
				  </div>
			  </div>
			  	<!-- shipping select  end -->
			  
			  <!-- shipping select -->
	          <div class="card container" style="width: 100%; height:150px; padding-left:20px; margin-bottom: 20px; border: 1px solid LightGray; border-radius: 10px;">
				  <div class="card-body ">
				  
				      <h5 class="card-title" style="font-weight: bold; padding-top:10px;  font-size: 18px;">본가</h5>
				   
				     
				          <div style="font-size: 16px; font-weight: "> 서울 강남구 개포로 202 (개포동) 석인빌딩, 쌍용</div>
				    	  <div  style="font-size: 14px; font-weight: lighter;"> 이미주 010-1234-1234 </div>
				    	
						
				    	 <div style="width:130px; height:50px; padding:10px 0px 10px 10px; float: left;">
							 <button type="button" class="btn">삭제</button>   
							 <button type="button" class="btn">수정</button>
						 </div>
						 <div style="width:70px; height:50px;  padding:10px; float: right;">
						   <button type="button" class="btn btn-info">선택</button>
						 </div>
					  
				  </div>
			  </div>
			  	<!-- shipping select  end -->
			  
			  <!-- shipping select -->
	          <div class="card container" style="width: 100%; height:150px; padding-left:20px; margin-bottom: 20px; border: 1px solid LightGray; border-radius: 10px;">
				  <div class="card-body ">
				  
				      <h5 class="card-title" style="font-weight: bold; padding-top:10px;  font-size: 18px;">본가</h5>
				   
				     
				          <div style="font-size: 16px; font-weight: "> 서울 강남구 개포로 202 (개포동) 석인빌딩, 쌍용</div>
				    	  <div  style="font-size: 14px; font-weight: lighter;"> 이미주 010-1234-1234 </div>
				    	
						
				    	 <div style="width:130px; height:50px; padding:10px 0px 10px 10px; float: left;">
							 <button type="button" class="btn">삭제</button>   
							 <button type="button" class="btn">수정</button>
						 </div>
						 <div style="width:70px; height:50px;  padding:10px; float: right;">
						   <button type="button" class="btn btn-info">선택</button>
						 </div>
					  
				  </div>
			  </div>
			  	<!-- shipping select  end -->
			  
			  
	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn  btn-toggle btn-info btn-lg btn-block" data-toggle="modal" data-target="#shippingInsertModal">배송지 추가</button>

      </div>
    </div>

  </div>
</div>

<!-- 배송지 리스트 Modal 끝 -->



<!-- 배송지 추가 Modal  -->
<div class="modal fade" id="shippingInsertModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">배송지 추가</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="frm" action="./shippingInsert" method="post">
      <div class="modal-body">
     	 
     	 
     	 <div class="form-group">
				<input type="hidden" id="username" name="username" value="id1">
		</div>
     	 	  <div class="form-group row">
			    <label for="shipTitle" class="col-sm-2 col-form-label">배송지명</label>
			    <div class="col-sm-10">
			      <input type="text" name="shipTitle" class="form-control" id="shipTitle" >
			    </div>
			  </div>
			  <div class="form-group row">
			    <label for="shipName" class="col-sm-2 col-form-label">받는 사람</label>
			    <div class="col-sm-10">
			      <input type="text" name="shipName" class="form-control" id="shipName">
			    </div>
			  </div>
			  <div class="form-group row">
			    <label for="inputPassword" class="col-sm-2 col-form-label">연락처</label>
			    <div class="col-sm-10">
			      <input type="text" name="shipPhone" class="form-control" id="shipPhone">
			    </div>
			  </div>
			  <div class="form-group row">
			    <label for="inputPassword" class="col-sm-2 col-form-label"> 주소 </label>
			    <div class="col-sm-10">

			    	<input type="text" id="sample6_postcode" placeholder="우편번호" name="shipAddress" class="form-control" style="display:inline-block;" >
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" name="shipAddress" class="form-control" style="display:inline-block;">
			
					<input type="text" id="sample6_address" placeholder="주소" name="shipAddress" class="form-control">
					<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="shipAddress" class="form-control">
				
					
					<div class="form-check">
						<label class="form-check-label"> 
						<input type="checkbox" class="form-check-input" name="shipDefault" value="1">기본 배송지로 등록
						</label>
					</div>
					
					
					<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
					<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
					<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
					</div>
			    </div>
			  </div>
            
		 
           
			
        
      </div>
      <div class="modal-footer">
                <button type="button" class="btn btn-info btn-lg btn-block">배송지 추가</button>
        
      </div>
       </form>
      
    </div>
  </div>
</div>
<!-- 배송지 추가 Modal 끝 -->



<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/js/shippingInsert.js"></script>

<script type="text/javascript">



</script>

</body> 
</html>