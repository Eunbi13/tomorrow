<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

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
<style>
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
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong">
				 변경
				</button>
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
					<div class="">${shippingVO}</div>
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
            
                <div> <input type="button" value="원 결제하기" class="btn btn-info btn-block pay"> </div>
       
        </div>
    </div>
</div>
<c:import url="../template/footer.jsp"></c:import>

</body>
</html>