<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

.product-bottom{
 margin-top: -15px;
 margin-bottom: -20px;
}

.d-top{
margin-top:20px;
}

.p-2{
	font-size: 16px;
}


.card{
    margin-bottom: 15px;
}
.card-header{
   background-color: white;
}
 .card-footer{
 margin-top: -30px;
 font-size: 16px;
}
.option{
   font-size: 16px;
   padding-bottom: 20px;
}
img{
	width: 64px;
	height: 64px;
}
.productName{
  
  font-weight: bold;
  font-size: 16px;
}
.shipping{
   font-size: 12px;
    padding-bottom: 20px;
}
</style>
<script type="text/javascript">
function cartVOPrice() {
	
}

$(#directInputBox${cartVO.cartNum})

$("#cartVOPrice").html(str);

</script>
<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<form name="calFrm" action="./doPlus" method="get"> 
<div class="container-fluid rounded bg-white">
    <div class="row d-flex justify-content-center pb-5">
        <div class="col-sm-5 col-md-6 ml-1">
        
         
         
            <!-- d-flex -->
    
                  <div class="d-flex justify-content-between d-top">
				    <div class="p-2 ">
		                       <div class="custom-control custom-checkbox">
								  <input type="checkbox" class="custom-control-input" id="customCheck1">
								  <label class="custom-control-label" for="customCheck1">모두선택</label>
								</div>
				    </div>
				   
				    <div class="p-2 ">선택삭제</div>
				  </div>      
            
            
			   <!-- d-flex end -->
    
            
        <section class="">
        <!-- brand -->
 
        
        <c:forEach items="${brandAr}"  var="brandVO">

         <div class="card">
			  <div class="card-header">
				 
	                <div class="p-1" style="text-align: center; font-size:16px;"> <c:out value="${brandVO.brandName}"/> 배송</div>
			
			  </div>
			  
			  <div class="card-body">
			  	<ul class="list-unstyled">
			
			  	
			  	<c:forEach items="${productAr}" var="productVO">
			  	
			  	<c:if test="${brandVO.brandNum eq productVO.brandNum}">
			  	
			     <!-- product  -->
			  	
				  <li class="media mb-4">
				    <!-- Checked checkbox -->
		            <div class="custom-control custom-checkbox">
					  <input type="checkbox" class="custom-control-input" id="customCheck2">
					  <label class="custom-control-label" for="customCheck2"></label>
					</div>
					<!-- Checked checkbox  end -->
				    <img src="../resources/images/glove.webp" class="mr-3" alt="...">
				    <div class="media-body">
				      <div class="mt-0 mb-1 productName">${productVO.productName}</div>
				         <div class="shipping">무료배송 | 일반택배</div>
				    </div>
				    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					    <span aria-hidden="true">&times;</span>
					 </button>
					  
					  <c:forEach items="${cartAr}" var="cartVO">
					  <c:if test="${productVO.productNum eq cartVO.productNum}">
					      <c:out value="${cartVO.cartPrice}"/>
					  <c:out value="${cartVO.optionNum}"/>
					       <c:forEach items="${cartVO.optionList}" var="optionList">
					   <!-- option -->
						   <li>
							  <div style="width:100%; height:100%; padding-bottom:40px; word-break:break-all;word-wrap:break-word;" class="alert alert-secondary alert-dismissible fade show" role="alert">
							  		<div class="option">  <c:out value="${optionList.optionKinds}"/>: ${optionList.optionName} </div>
							  		   <div style="width:70px; height:20px; font-size:12px; float: left;">
							  		   <c:out value="${cartVO.amount}"/>: ${cartVO.amount}
							  		     <input type="hidden" class="cartNum" id="cartNum" title="${cartVO.cartNum}">
							  		   
											<%-- <select style="width:70px; height:20px;" class="form-control amountSelect" id="amountSelect${cartVO.cartNum}" title="${cartVO.amount}" name="amount" value="${cartVO.amount}">
										      <option value="1">1</option>
										      <option value="2">2</option>
										      <option value="3">3</option>
										      <option value="4">4</option>
										      <option value="5">5</option>
										      <option value="6">6</option>
										      <option value="7">7</option>
										      <option value="8">8</option>
										      <option value="9">9</option>
										      <option value="directInput">10+</option>
										    </select> --%>
										     <!-- 상단의 select box에 수량 10개이상 선택시 나타날 인풋박스 -->
										     <input style="width:70px; height:20px;" type="text" class="directInputBox" id="directInputBox" name="amount" value="${cartVO.amount}"/>
										</div>
										<div style="width:70px; height:20px; font-size:16px;  font-weight: bold; float: right;">
										      <input type="hidden" class="optionPrice" id="optionPrice" name="optionPrice" title="${optionList.optionPrice}">
											<div id="cartVOPrice"> ${cartVO.cartPrice}  </div>원
										</div>
							  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
							    <span aria-hidden="true">&times;</span>
							  </button>
							 </div>
							 
					       </li>
				       
				      <!-- option end-->
				           </c:forEach>
				      </c:if>
				      </c:forEach>
				      
				      
				      	<div class="d-flex justify-content-between product-bottom">
				    		<div class="p-2" style="font-size:14px;" >
				    			옵션변경  |  바로결제
				    		</div>
				    		
				    		<!-- 그냥. 돌아가는옵션들의 가격 = cartPrice 를 애드해서 뿌려줄까..? -->
				    		<div class="p-2" style=" font-size:18px;  font-weight: bold;">
				    				${productVO.productNum} 25,800원
				    		</div>
				    	</div>
				        
			        
					 </li>
					 
				  <hr>
					   
				  <!-- product end -->
				  </c:if>
				  
				  </c:forEach>
				  
			
				  
				 </ul>
				 
		
			    
			  </div>
					  <div class="card-footer text-center text-muted">
					   배송비 무료
					  </div>
			  
			</div>
			
			</c:forEach>
			
	       		 <!-- brand end -->
	       		 
	       		 
	
				
        </section>
          
             
        </div>
        
        <!-- 결제 창 -->
        
        <div class="col-sm-3 col-md-4 offset-md-1 mobile">
            <div class="py-4 d-flex justify-content-end">
              
            </div>
            <div class="bg-light rounded d-flex flex-column">
                <div class="p-2 ml-3">
             
                </div>
                <div class="p-2 d-flex">
                    <div class="col-8">총 상품 금액</div>
                    <div class="ml-auto">0원</div>
                </div>
                <div class="p-2 d-flex">
                    <div class="col-8">총 배송비</div>
                    <div class="ml-auto">0원</div>
                </div>
                      <div class="p-2 d-flex">
                    <div class="col-8">총 할인금액</div>
                    <div class="ml-auto">0원</div>
                </div>
             
                <div class="border-top px-4 mx-3"> </div>
                
             
                <div class="border-top px-4 mx-3"></div>
                
                <div class="p-2 d-flex pt-3">
                    <div class="col-8"><b>결제 금액</b></div>
                    <div class="ml-auto"><b class="green">0원</b></div>
                </div>
            </div>
            
                <div> <a href="../order/insert"><input type="button"  value="개 상품 구매하기" class="btn btn-info btn-block pay"></a> </div>
       
        </div>
        
    </div>
</div>
	</form>		

<script type="text/javascript">



var list = new Array();

list.push(${cartVO.cartNum});
console.log(list);

/* 
//직접입력 인풋박스 기존에는 숨어있다가

let amount  = $("#amountSelect").attr("title");
console.log(amount)


for (i=1; i < cnt[province].length;i++){ 
		sel.options[i] = new Option(cnt[province][i], cnt[province][i]);

		if( amount == sel.options[i].value){
		    sel.options[i].selected = true;
	
		} 

$("#amountSelect").val(amount).prop("selected", true); 
		



$("#directInputBox").hide();
 */
/* 
$(".amountSelect").change(function() {

              //직접입력을 누를 때 나타남

		if($(".amountSelect").val() == "directInput") {
			$(".directInputBox").show();
			$(".amountSelect").hide();
		}  else {
			$(".directInputBox").hide();
		}

	}) 

	

});
  
 */




  
    
 


</script>



<c:import url="../template/footer.jsp"></c:import>
</body>
</html>