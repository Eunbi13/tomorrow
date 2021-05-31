<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- shipping  
<script src="./jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
shipping  -->
<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<title>Insert title here</title>
<style type="text/css">
.shipInsertBody{
 height: 550px;
}

.shipInsert{
	font-size:16px;
}

.modal-scroll-panel {


    overflow-y: scroll !important;

}
.modal-content {
  height: 750px !important;
  

}
.modal{

    position: fixed;
    max-height: 850px;
	height: 850px;
}
.ship-change{
  font-size: 20px;
  text-decoration: none; 

}

table{
    margin-left:auto; 
    margin-right:auto;
    border-collapse: separate;
}

td{
   border-collapse: separate;
    border: 0.5px solid Gainsboro;
    border-radius: 5%;
    padding: 10px 10px 0px 10px;

}


.card_pay{
	 text-align: center;
}
p{
	 text-align: center;
}

.card-img-top{
    padding: -30px;
    align: center;
    width: 100px;
    height: 70px;
    object-fit: cover;
  
}
section{
	margin-top: 30px;
}
._2w0fH {
    text-align: center;
    width: 72px;
    padding: 3px 8px;
    box-sizing: border-box;
    border: 1px solid #35c5f0;
    border-radius: 100px;
    font-size: 12px;
    line-height: 14px;
    color: #35c5f0;
    margin-left: 8px;
    user-select: none;
}
._3Bt8k ._3K8Q8 {
    padding-right: 30px;
}
._1qwAY {
    padding: 8px 15px 9px;
}

._3ASDR {
    display: inline-block;
    width: 100%;
    background-color: rgb(255, 255, 255);
    color: rgb(0, 0, 0);
    box-sizing: border-box;
    font-family: "Noto Sans KR", "Noto Sans CJK KR", "맑은 고딕", "Malgun Gothic", sans-serif;
    font-size: 15px;
    line-height: 21px;
    resize: none;
    appearance: none;
    margin: 0px;
    padding: 8px 15px 9px;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(219, 219, 219);
    border-image: initial;
    border-radius: 4px;
    transition: border-color 0.1s ease 0s, background-color 0.1s ease 0s;
}

.IgBXR {
    position: absolute;
    top: 50%;
    right: 15px;
    width: 10px;
    height: 10px;
    margin-top: -5px;
    pointer-events: none;
    color: #bdbdbd;
}

.pay{
margin-top: 20px;
}
.green {
    color: rgb(15, 207, 143);
    font-weight: 680
}

@media(max-width:567px) {
    .mobile {
        padding-top: 40px
    }
}
</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>



<!-- 배송지 리스트 Modal -->
<div id="shippingListModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
       <div class="modal-title" style="font-size:24px; width:100%; margin:0 auto; font-weight:bold;">배송지 선택</div>
        <button type="button" class="close" data-dismiss="modal">&times;</button>

      </div>
      <div class="modal-body modal-scroll-panel ">
        
        
        	<!-- shipping select -->
	          <div class="card" style="width: 100%; height:200px; margin-bottom: 10px; border: 1px solid LightGray; border-radius:10px;">
				  <div class="card-body ">
				  
				      <div class="card-title" style=" font-weight: bold; font-size: 18px;">본가</div>
				   
				     
				          <div style="font-size: 16px; "> 서울 강남구 개포로 202 (개포동) 석인빌딩, 쌍용</div>
				    	  <div  style="font-size: 14px; font-weight: lighter; padding-bottom:10px;"> 이미주 010-1234-1234 </div>
				    	
						
				    	 <div style="width:130px; height:50px; float: left;">
							 <button type="button" class="btn" style="font-size:14px; border: 1px solid LightGray">삭제</button>   
							 <button type="button" class="btn" style="font-size:14px; border: 1px solid LightGray">수정</button>
						 </div>
						 <div style="width:70px; height:50px;  float: right;">
						   <button type="button" class="btn btn-info" style="font-size:14px;" >선택</button>
						 </div>
					  
				  </div>
			  </div>
			  	<!-- shipping select  end -->
			  	
			  	<!-- shipping select -->
	          <div class="card" style="width: 100%; height:200px; margin-bottom: 10px; border: 1px solid LightGray; border-radius:10px;">
				  <div class="card-body ">
				  
				      <div class="card-title" style=" font-weight: bold; font-size: 18px;">본가</div>
				   
				     
				          <div style="font-size: 16px; "> 서울 강남구 개포로 202 (개포동) 석인빌딩, 쌍용</div>
				    	  <div  style="font-size: 14px; font-weight: lighter; padding-bottom:10px;"> 이미주 010-1234-1234 </div>
				    	
						
				    	 <div style="width:130px; height:50px; float: left;">
							 <button type="button" class="btn" style="font-size:14px; border: 1px solid LightGray">삭제</button>   
							 <button type="button" class="btn" style="font-size:14px; border: 1px solid LightGray">수정</button>
						 </div>
						 <div style="width:70px; height:50px;  float: right;">
						   <button type="button" class="btn btn-info" style="font-size:14px;" >선택</button>
						 </div>
					  
				  </div>
			  </div>
			  	<!-- shipping select  end -->
			  	
			  	<!-- shipping select -->
	          <div class="card" style="width: 100%; height:200px; margin-bottom: 10px; border: 1px solid LightGray; border-radius:10px;">
				  <div class="card-body ">
				  
				      <div class="card-title" style=" font-weight: bold; font-size: 18px;">본가</div>
				   
				     
				          <div style="font-size: 16px; "> 서울 강남구 개포로 202 (개포동) 석인빌딩, 쌍용</div>
				    	  <div  style="font-size: 14px; font-weight: lighter; padding-bottom:10px;"> 이미주 010-1234-1234 </div>
				    	
						
				    	 <div style="width:130px; height:50px; float: left;">
							 <button type="button" class="btn" style="font-size:14px; border: 1px solid LightGray">삭제</button>   
							 <button type="button" class="btn" style="font-size:14px; border: 1px solid LightGray">수정</button>
						 </div>
						 <div style="width:70px; height:50px;  float: right;">
						   <button type="button" class="btn btn-info" style="font-size:14px;" >선택</button>
						 </div>
					  
				  </div>
			  </div>
			  	<!-- shipping select  end -->
			  	
			  	<!-- shipping select -->
	          <div class="card" style="width: 100%; height:200px; margin-bottom: 10px; border: 1px solid LightGray; border-radius:10px;">
				  <div class="card-body ">
				  
				      <div class="card-title" style=" font-weight: bold; font-size: 18px;">본가</div>
				   
				     
				          <div style="font-size: 16px; "> 서울 강남구 개포로 202 (개포동) 석인빌딩, 쌍용</div>
				    	  <div  style="font-size: 14px; font-weight: lighter; padding-bottom:10px;"> 이미주 010-1234-1234 </div>
				    	
						
				    	 <div style="width:130px; height:50px; float: left;">
							 <button type="button" class="btn" style="font-size:14px; border: 1px solid LightGray">삭제</button>   
							 <button type="button" class="btn" style="font-size:14px; border: 1px solid LightGray">수정</button>
						 </div>
						 <div style="width:70px; height:50px;  float: right;">
						   <button type="button" class="btn btn-info" style="font-size:14px;" >선택</button>
						 </div>
					  
				  </div>
			  </div>
			  	<!-- shipping select  end -->
			  
	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn  btn-toggle btn-info btn-lg btn-block" data-toggle="modal" data-target="#shippingInsertModal" style="font-size:24px;">배송지 추가</button>

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
        <div class="modal-title" id="exampleModalLongTitle" style="font-size:24px; font-weight:bold;">배송지 추가</div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="frm" action="./shippingInsert" method="post">
      <div class="modal-body shipInsertBody">
     	 
     	 
     	 <div class="form-group">
				<input type="hidden" id="username" name="username" value="id1">
		</div>
     	 	  <div class="form-group row shipInsert">
			    <label for="shipTitle" class="col-sm-3 col-form-label">배송지명</label>
			    <div class="col-sm-9">
			      <input type="text" name="shipTitle" class="form-control" id="shipTitle" >
			    </div>
			  </div>
			  <div class="form-group row shipInsert">
			    <label for="shipName" class="col-sm-3 col-form-label">받는 사람</label>
			    <div class="col-sm-9">
			      <input type="text" name="shipName" class="form-control" id="shipName">
			    </div>
			  </div>
			  <div class="form-group row shipInsert">
			    <label for="inputPassword" class="col-sm-3 col-form-label">연락처</label>
			    <div class="col-sm-9">
			      <input type="text" name="shipPhone" class="form-control" id="shipPhone">
			    </div>
			  </div>
			  <div class="form-group row shipInsert">
			    <label for="inputPassword" class="col-sm-3 col-form-label"> 주소 </label>
			    <div class="col-sm-9 row">
			    
			    
                      <div class="col-sm-6">
			    	<input type="text" id="sample6_postcode" placeholder="우편번호" name="shipAddress" class="form-control" style="font-size:16px; display:inline-block; margin-bottom:10px;" >
			    	  </div>
			    	  <div class="col-sm-6">
			    	  
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" name="shipAddress" class="form-control btn btn-outline-info" style="font-size:16px; display:inline-block; margin-bottom:10px;">
			            </div>
			    </div>
			    <label for="inputPassword" class="col-sm-3 col-form-label"> </label>
			    <div class="col-sm-9">
			  
					<input type="text" id="sample6_address" placeholder="주소" name="shipAddress" class="form-control" style="font-size:16px; margin-bottom:10px;">
					<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="shipAddress" class="form-control" style="font-size:16px; margin-bottom:10px;">
				
					
					<div class="form-check">
						<label class="form-check-label"> 
						<input type="checkbox" class="form-check-input" name="shipDefault" value="1" style="margin-bottom: 100px">기본 배송지로 등록
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
                <button type="button" class="btn btn-info btn-lg btn-block" style="font-size:24px;">저장</button>
        
      </div>
       </form>
      
    </div>
  </div>
</div>
<!-- 배송지 추가 Modal 끝 -->



<div class="container-fluid rounded bg-white">
    <div class="row d-flex justify-content-center pb-5">
        <div class="col-sm-5 col-md-6 ml-1">
            <div class="py-4 d-flex flex-row">
                <h5><span class="fa fa-check-square-o"></span><b>주문/결제</b>  
            </div>
            
        <section class="_3oseG">
           <div class="d-flex">
                <div class="p-1">배송지</div>
                
                <div class="ml-auto p-1"><!-- Button trigger modal -->
				
				<!-- 배송지 리스트 button -->
                <a class="ship-change" data-toggle="modal" data-target="#shippingListModal" style="text-decoration: none;">변경</a>
				</div>
                  <!-- Button trigger modal -->

                  
            </div>
            <hr>
            
	            <div class="d-flex pt-2">
	            <div class="bbqwt">
					<div class="checkout-container _3tfrw">
						<div class="_2s2Nq">
						   <div class="_3dE3S" style="float:left;"> 배송지제목:</div>
							
							<c:if test="${shipping.isDefault == true}">
							<div>
								<div class="_2w0fH" style="float:left;">기본배송지</div>
							</div>
							</c:if>
					</div>
					<div class="" style="clear:both;">경기 고양시 일산동구 탄중로 343 (중산동) 중산마을5단지아파트, 513동 404호</div>
				<div class="">
					<div class="">${orderVO}</div>
					<div class="">010-7399-9178</div>
				</div>
				<div class="css-nj6fnr-DeliveryRequestInput e84q8kd0">
					<div class="_3Bt8k">
						<select class="_3ASDR _1qwAY _3K8Q8">
							<option value="0">배송시 요청사항을 선택해주세요</option>
							<option value="1">부재시 문앞에 놓아주세요</option>
							<option value="2">배송전에 미리 연락주세요</option>
							<option value="3">부재시 경비실에 맡겨 주세요</option>
							<option value="4">부재시 전화주시거나 문자 남겨 주세요</option>
							<option value="5">직접입력</option>
						</select>
				<svg width="1em" height="1em" viewBox="0 0 10 10" fill="currentColor" class="IgBXR">
					<path d="M0 3l5 5 5-5z"></path>
				</svg>
				</div>
				</div>
				</div>
				</div>
				</div>
				
				
			</section>
				
				
            <section>
            <div class="d-flex">
                <div class="p-1">주문자</div>
             
            </div>
            <hr>
            
		  <form class="form" action="/action_page.php">
		      <div class="form-group row">
			    <label class="control-label col-sm-2" for="name">이름</label>
			    <div class="col-sm-8">
			      <input type="text" class="form-control" id="name" name="name">
			    </div>
			  </div>
			  <div class="form-group row">
			    <label class="control-label col-sm-2" for="email">이메일</label>
			    <div class="col-sm-8">
			      <input type="email" class="form-control" id="email" name="email">
			    </div>
			  </div>
			  <div class="form-group row">
			    <label class="control-label col-sm-2" for="phone">휴대전화</label>
			    <div class="col-sm-8">
			      <input type="text" class="form-control" id="phone" name="phone">
			    </div>
			  </div>
			  
			  <!-- 혹시 인증번호 발송 기능 사용하면 넣
			   <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			      <button type="submit" class="btn btn-default">Submit</button>
			    </div>
			  </div> -->
			</form>
			
			
			
            
            
            
            </section>
            
            
            
            
             <section>
             <div class="d-flex">
                <div class="p-1">주문상품</div>
             
            </div>
            <hr>
            
            <div class="card">
			  <div class="card-header">
			  <div class="d-flex">
                <div class="p-1">회사이름</div>
			  <div class="ml-auto p-1"> 무료배송 </div>
			  </div>
			  </div>
			  
			  <div class="card-body">
			  	<ul class="list-group list-group-flush">
				    <li class="list-group-item">제품 1</li>
				    <li class="list-group-item">제품 2</li>
				    <li class="list-group-item">제품 3</li>
				 </ul>
			    
			  </div>
			</div>
            
            
            </section>
            
            
            <section>
             <div class="d-flex">
                <div class="p-1">결제수단</div>
            </div>
            
            <hr>
       
          <div class="">
            <table>
	       <td>
		    
		       <p><img class="card-img-top" src="../resources/images/img_card.png" alt="Card image cap"></p>
		       <p>카드</p>
		     
	       </td>
	       <td>
	        <p><img class="card-img-top" src="../resources/images/img_vbank.webp" alt="Card image cap"></p>
	            <p>무통장</p>
	       </th>
	       <td>
	        <p> <img class="card-img-top" src="../resources/images/img_kakaopay.webp" alt="Card image cap"></p>
	        <p>카카오페이</p>
	     </td>
	        </table>
	       </div>
	       
				
            </section>
          
             <!--부트스트랩  -->
            <!-- <div class="pt-2">
                <div class="d-flex">
                    <div>
                        <p><b>Patient Balance.</b><span class="green">$13.24</span></p>
                    </div>
                    <div class="ml-auto p-2">
                        <p class="text-primary"><i class="fa fa-plus-circle text-primary"></i>Add payment card</p>
                    </div>
                </div>
                <p> This is an estimate for the portion of your order (not covered by insurance) due today . once insurance finalizes their review refunds and/or balances will reconcile automatically. </p>
                <form class="pb-3">
                    <div class="d-flex flex-row align-content-center">
                        <div class="pt-2 pr-2"><input type="radio" name="radio1" id="r1" checked></div>
                        <div class="rounded border d-flex w-100 px-2">
                            <div class="pt-2">
                                <p><i class="fa fa-cc-visa text-primary pr-2"></i>Visa Debit Card</p>
                            </div>
                            <div class="ml-auto pt-2">************3456</div>
                        </div>
                    </div>
                </form>
                <form class="pb-3">
                    <div class="d-flex flex-row w-100">
                        <div class="pt-2 pr-2"><input type="radio" name="radio2" id="r2"></div>
                        <div class="rounded d-flex w-100 px-2">
                            <div class="pt-2">
                                <p><i class="fa fa-cc-mastercard pr-2"></i>Mastercard Office</p>
                            </div>
                            <div class="ml-auto pt-2">************1038</div>
                        </div>
                    </div>
                </form>
            </div> -->
        </div>
        
        
        <div class="col-sm-3 col-md-4 offset-md-1 mobile">
            <div class="py-4 d-flex justify-content-end">
              
            </div>
            <div class="bg-light rounded d-flex flex-column">
                <div class="p-2 ml-3">
                    <h6>결제금액</h6>
                </div>
                <div class="p-2 d-flex">
                    <div class="col-8">총 상품 금액</div>
                    <div class="ml-auto">0원</div>
                </div>
                <div class="p-2 d-flex">
                    <div class="col-8">배송비</div>
                    <div class="ml-auto">0원</div>
                </div>
             
                <div class="border-top px-4 mx-3"> </div>
                
             
                <div class="border-top px-4 mx-3"></div>
                
                <div class="p-2 d-flex pt-3">
                    <div class="col-8"><b>최종 결제 금액</b></div>
                    <div class="ml-auto"><b class="green">0원</b></div>
                </div>
            </div>
            
                <div>    <input type="button" onclick="iamport()"value="원 결제하기" class="btn btn-info btn-block pay"> </div>
       
        </div>
    </div>
</div>
<c:import url="../template/footer.jsp"></c:import>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- <script type="text/javascript" src="/js/shippingInsert.js"></script> -->
<script type="text/javascript">
function iamport(){
	//가맹점 식별코드
	IMP.init('imp63068221');
	IMP.request_pay({
	    pg : 'html5_inicis',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '상품1', //결제창에서 보여질 이름
	    amount : 100, //실제 결제되는 가격
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
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
	    } else {
	    	 var msg = '결제에 실패하였습니다.';
	         msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
}


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

</body>
</html>