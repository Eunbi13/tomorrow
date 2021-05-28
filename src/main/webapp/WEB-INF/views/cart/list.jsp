<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
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
}
</style>
<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<div class="container-fluid rounded bg-white">
    <div class="row d-flex justify-content-center pb-5">
        <div class="col-sm-5 col-md-6 ml-1">
            <div class="py-4 d-flex flex-row">
           
            <div class="d-flex">
                         <!-- group checkbox -->
            
             <!-- Checked checkbox -->
            <div class="custom-control custom-checkbox">
			  <input type="checkbox" class="custom-control-input" id="customCheck1">
			  <label class="custom-control-label" for="customCheck1">모두선택</label>
			</div>
            <!-- Checked checkbox -->
					
             
			  <div class="ml-auto p-1"> 선택삭제 </div>
			  </div>
            </div>
            
        <section class="">
        
         <div class="card">
			  <div class="card-header">
			  <div class="d-flex">
                <div class="p-1">생활공작소 배송</div>
			  </div>
			  </div>
			  
			  <div class="card-body">
			  	<ul class="list-unstyled">
				  <li class="media ">
				    <!-- Checked checkbox -->
		            <div class="custom-control custom-checkbox">
					  <input type="checkbox" class="custom-control-input" id="customCheck2">
					  <label class="custom-control-label" for="customCheck2"></label>
					</div>
				    <img src="../resources/images/glove.webp" class="mr-3" alt="...">
				    <div class="media-body">
				      <div class="mt-0 mb-1 productName">[생활공작소] 고무장갑 일반형(33cm) 5입(그레이/베이지) 2size(S/M)</div>
				         <div class="shipping">무료배송 | 일반택배</div>
				    </div>
				    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					    <span aria-hidden="true">&times;</span>
					  </button>
					   <p>
					   <!-- option -->
					  <div style="width:100%; word-break:break-all;word-wrap:break-word;" class="alert alert-secondary alert-dismissible fade show" role="alert">
					  <strong>Holy guacamole!</strong> You should check in on some of those fields below.
					  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					    <span aria-hidden="true">&times;</span>
					  </button>
					 </div>
					 </p>
				  </li>
				  
				  
				  <hr>
				  <li class="media my-4 ">
			
				    <!-- Checked checkbox -->
		            <div class="custom-control custom-checkbox">
					  <input type="checkbox" class="custom-control-input" id="customCheck2">
					  <label class="custom-control-label" for="customCheck2"></label>
					</div>
				    <img src="../resources/images/glove.webp" class="mr-3" alt="...">
				    <div class="media-body">
				      <div class="mt-0 mb-1 productName">[생활공작소] 고무장갑 일반형(33cm) 5입(그레이/베이지) 2size(S/M)</div>
				         <div class="shipping">무료배송 | 일반택배</div>
				    </div>
				  </li>
				 
			  
			  <!-- original -->
			  	<ul class="list-group  list-group-flush list-unstyled">
				    <li class="list-group-item media">
				       <img src="../resources/images/glove.webp" class="mr-3" alt="...">
				    <div class="media-body">
				      <div class="mt-0 mb-1 productName">[생활공작소] 고무장갑 일반형(33cm) 5입(그레이/베이지) 2size(S/M)</div>
				         <div class="shipping">무료배송 | 일반택배</div>
				    </div>
				       <ol class="breadcrumb">
					    <li class="breadcrumb-item active" aria-current="page">Home</li>
					  </ol>
				    </li>
				    <li class="list-group-item">
				    제품 2
				      <div class="alert alert-secondary" role="alert">
						  A simple secondary alert—check it out!
						</div>
				    </li>
				    <li class="list-group-item">
				    제품 3
				    <div class="alert alert-secondary alert-dismissible fade show" role="alert">
					  <strong>Holy guacamole!</strong> You should check in on some of those fields below.
					  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					    <span aria-hidden="true">&times;</span>
					  </button>
					</div>
				    
				    </li>
				 </ul>
			    
			  </div>
			</div>
			<!-- Checked checkbox -->
            <div class="custom-control custom-checkbox">
			  <input type="checkbox" class="custom-control-input" id="customCheck1">
			  <label class="custom-control-label" for="customCheck1">모두선택</label>
			</div>
	       
				
        </section>
          
             
        </div>
        
        
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
            
                <div> <input type="button" value="개 상품 구매하기" class="btn btn-info btn-block pay"> </div>
       
        </div>
    </div>
</div>
<script>
  export default {
    data() {
      return {
        selected: [], // Must be an array reference!
        options: [
          { text: 'Orange', value: 'orange' },
          { text: 'Apple', value: 'apple' },
          { text: 'Pineapple', value: 'pineapple' },
          { text: 'Grape', value: 'grape' }
        ]
      }
    }
  }
</script>

<c:import url="../template/footer.jsp"></c:import>
</body>
</html>