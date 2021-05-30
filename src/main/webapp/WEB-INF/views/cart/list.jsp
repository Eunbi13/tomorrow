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
<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
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

         <div class="card">
			  <div class="card-header">
				 
	                <div class="p-1" style="text-align: center; font-size:16px;">생활공작소 배송</div>
			
			  </div>
			  
			  <div class="card-body">
			  	<ul class="list-unstyled">
			  	
			     <!-- product  -->
			  	
				  <li class="media">
				    <!-- Checked checkbox -->
		            <div class="custom-control custom-checkbox">
					  <input type="checkbox" class="custom-control-input" id="customCheck2">
					  <label class="custom-control-label" for="customCheck2"></label>
					</div>
					<!-- Checked checkbox  end -->
				    <img src="../resources/images/glove.webp" class="mr-3" alt="...">
				    <div class="media-body">
				      <div class="mt-0 mb-1 productName">[생활공작소] 고무장갑 일반형(33cm) 5입(그레이/베이지) 2size(S/M)</div>
				         <div class="shipping">무료배송 | 일반택배</div>
				    </div>
				    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					    <span aria-hidden="true">&times;</span>
					 </button>
					  
					   <!-- option -->
						   <li>
							  <div style="width:100%; height:100%; padding-bottom:40px; word-break:break-all;word-wrap:break-word;" class="alert alert-secondary alert-dismissible fade show" role="alert">
							  		<div class="option">구성: 01. 고무장갑 5입 / 색상/사이즈: 베이지 M</div>
							  		   <div style="width:70px; height:20px; font-size:12px; float: left;">
											<select style="width:70px; height:20px;" "class="form-control" id="exampleFormControlSelect1">
										      <option>1</option>
										      <option>2</option>
										      <option>3</option>
										      <option>4</option>
										      <option>5</option>
										    </select>
										</div>
										<div style="width:70px; height:20px; font-size:16px;  font-weight: bold; float: right;">
										12,900원
										</div>
							  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
							    <span aria-hidden="true">&times;</span>
							  </button>
							 </div>
					       </li>
				      <!-- option end-->
				       <!-- option -->
						   <li>
							  <div style="width:100%; height:100%; padding-bottom:40px; word-break:break-all;word-wrap:break-word;" class="alert alert-secondary alert-dismissible fade show" role="alert">
							  		<div class="option">구성: 01. 고무장갑 5입 / 색상/사이즈: 베이지 M</div>
							  		   <div style="width:70px; height:20px; font-size:12px; float: left;">
											<select style="width:70px; height:20px;" "class="form-control" id="exampleFormControlSelect1">
										      <option>1</option>
										      <option>2</option>
										      <option>3</option>
										      <option>4</option>
										      <option>5</option>
										    </select>
										</div>
										<div style="width:70px; height:20px; font-size:16px;  font-weight: bold; float: right;">
										12,900원
										</div>
							  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
							    <span aria-hidden="true">&times;</span>
							  </button>
							 </div>
					       </li>
				      <!-- option end-->
				      	<div class="d-flex justify-content-between product-bottom">
				    		<div class="p-2" style="font-size:14px;" >
				    			옵션변경  |  바로결제
				    		</div>
				    		<div class="p-2" style=" font-size:18px;  font-weight: bold;">
				    				25,800원
				    		</div>
				    	</div>
				        
			        
					 </li>
					   
				  <!-- product end -->
				  
				  <hr>
				  
				   <!-- product 2 -->
				  <li class="media my-4 ">
						 <!-- Checked checkbox -->
		            <div class="custom-control custom-checkbox">
					  <input type="checkbox" class="custom-control-input" id="customCheck2">
					  <label class="custom-control-label" for="customCheck2"></label>
					</div>
					<!-- Checked checkbox  end -->
				    <img src="../resources/images/glove.webp" class="mr-3" alt="...">
				    <div class="media-body">
				      <div class="mt-0 mb-1 productName">[생활공작소] 고무장갑 일반형(33cm) 5입(그레이/베이지) 2size(S/M)</div>
				         <div class="shipping">무료배송 | 일반택배</div>
				    </div>
				    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					    <span aria-hidden="true">&times;</span>
					 </button>
					  
					   <!-- option -->
						   <li>
							  <div style="width:100%; height:100%; padding-bottom:40px; word-break:break-all;word-wrap:break-word;" class="alert alert-secondary alert-dismissible fade show" role="alert">
							  		<div class="option">구성: 01. 고무장갑 5입 / 색상/사이즈: 베이지 M</div>
							  		   <div style="width:70px; height:20px; font-size:12px; float: left;">
											<select style="width:70px; height:20px;" "class="form-control" id="exampleFormControlSelect1">
										      <option>1</option>
										      <option>2</option>
										      <option>3</option>
										      <option>4</option>
										      <option>5</option>
										    </select>
										</div>
										<div style="width:70px; height:20px; font-size:16px;  font-weight: bold; float: right;">
										12,900원
										</div>
							  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
							    <span aria-hidden="true">&times;</span>
							  </button>
							 </div>
					       </li>
				      <!-- option end-->
				       <!-- option -->
						   <li>
							  <div style="width:100%; height:100%; padding-bottom:40px; word-break:break-all;word-wrap:break-word;" class="alert alert-secondary alert-dismissible fade show" role="alert">
							  		<div class="option">구성: 01. 고무장갑 5입 / 색상/사이즈: 베이지 M</div>
							  		   <div style="width:70px; height:20px; font-size:12px; float: left;">
											<select style="width:70px; height:20px;" "class="form-control" id="exampleFormControlSelect1">
										      <option>1</option>
										      <option>2</option>
										      <option>3</option>
										      <option>4</option>
										      <option>5</option>
										    </select>
										</div>
										<div style="width:70px; height:20px; font-size:16px;  font-weight: bold; float: right;">
										12,900원
										</div>
							  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
							    <span aria-hidden="true">&times;</span>
							  </button>
							 </div>
					       </li>
				      <!-- option end-->
				      	<div class="d-flex justify-content-between product-bottom">
				    		<div class="p-2" style="font-size:14px;" >
				    			옵션변경  |  바로결제
				    		</div>
				    		<div class="p-2" style=" font-size:18px;  font-weight: bold;">
				    				25,800원
				    		</div>
				    	</div>
				        
			        
					 </li>
					   
				  <!-- product end -->
				  
				   
			
			    <hr>
				  
				  <!-- product 2 -->
				  <li class="media my-4 ">
					 <!-- Checked checkbox -->
		            <div class="custom-control custom-checkbox">
					  <input type="checkbox" class="custom-control-input" id="customCheck2">
					  <label class="custom-control-label" for="customCheck2"></label>
					</div>
					<!-- Checked checkbox  end -->
				    <img src="../resources/images/glove.webp" class="mr-3" alt="...">
				    <div class="media-body">
				      <div class="mt-0 mb-1 productName">[생활공작소] 고무장갑 일반형(33cm) 5입(그레이/베이지) 2size(S/M)</div>
				         <div class="shipping">무료배송 | 일반택배</div>
				    </div>
				    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					    <span aria-hidden="true">&times;</span>
					 </button>
					  
					   <!-- option -->
						   <li>
							  <div style="width:100%; height:100%; padding-bottom:40px; word-break:break-all;word-wrap:break-word;" class="alert alert-secondary alert-dismissible fade show" role="alert">
							  		<div class="option">구성: 01. 고무장갑 5입 / 색상/사이즈: 베이지 M</div>
							  		   <div style="width:70px; height:20px; font-size:12px; float: left;">
											<select style="width:70px; height:20px;" "class="form-control" id="exampleFormControlSelect1">
										      <option>1</option>
										      <option>2</option>
										      <option>3</option>
										      <option>4</option>
										      <option>5</option>
										    </select>
										</div>
										<div style="width:70px; height:20px; font-size:16px;  font-weight: bold; float: right;">
										12,900원
										</div>
							  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
							    <span aria-hidden="true">&times;</span>
							  </button>
							 </div>
					       </li>
				      <!-- option end-->
				       <!-- option -->
						   <li>
							  <div style="width:100%; height:100%; padding-bottom:40px; word-break:break-all;word-wrap:break-word;" class="alert alert-secondary alert-dismissible fade show" role="alert">
							  		<div class="option">구성: 01. 고무장갑 5입 / 색상/사이즈: 베이지 M</div>
							  		   <div style="width:70px; height:20px; font-size:12px; float: left;">
											<select style="width:70px; height:20px;" "class="form-control" id="exampleFormControlSelect1">
										      <option>1</option>
										      <option>2</option>
										      <option>3</option>
										      <option>4</option>
										      <option>5</option>
										    </select>
										</div>
										<div style="width:70px; height:20px; font-size:16px;  font-weight: bold; float: right;">
										12,900원
										</div>
							  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
							    <span aria-hidden="true">&times;</span>
							  </button>
							 </div>
					       </li>
				      <!-- option end-->
				      	<div class="d-flex justify-content-between product-bottom">
				    		<div class="p-2" style="font-size:14px;" >
				    			옵션변경  |  바로결제
				    		</div>
				    		<div class="p-2" style=" font-size:18px;  font-weight: bold;">
				    				25,800원
				    		</div>
				    	</div>
				        
			        
					 </li>
					   
				  <!-- product end -->
				  
		
				  
				 </ul>
				 
		
			    
			  </div>
					  <div class="card-footer text-center text-muted">
					   배송비 무료
					  </div>
			  
			</div>
			
	       		 <!-- brand end -->
	       		 
	       		<!-- brand -->

         <div class="card">
			  <div class="card-header">
				 
	                <div class="p-1" style="text-align: center; font-size:16px;">생활공작소 배송</div>
			
			  </div>
			  
			  <div class="card-body">
			  	<ul class="list-unstyled">
			  	
			     <!-- product  -->
			  	
				  <li class="media">
				    <!-- Checked checkbox -->
		            <div class="custom-control custom-checkbox">
					  <input type="checkbox" class="custom-control-input" id="customCheck2">
					  <label class="custom-control-label" for="customCheck2"></label>
					</div>
					<!-- Checked checkbox  end -->
				    <img src="../resources/images/glove.webp" class="mr-3" alt="...">
				    <div class="media-body">
				      <div class="mt-0 mb-1 productName">[생활공작소] 고무장갑 일반형(33cm) 5입(그레이/베이지) 2size(S/M)</div>
				         <div class="shipping">무료배송 | 일반택배</div>
				    </div>
				    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					    <span aria-hidden="true">&times;</span>
					 </button>
					  
					   <!-- option -->
						   <li>
							  <div style="width:100%; height:100%; padding-bottom:40px; word-break:break-all;word-wrap:break-word;" class="alert alert-secondary alert-dismissible fade show" role="alert">
							  		<div class="option">구성: 01. 고무장갑 5입 / 색상/사이즈: 베이지 M</div>
							  		   <div style="width:70px; height:20px; font-size:12px; float: left;">
											<select style="width:70px; height:20px;" "class="form-control" id="exampleFormControlSelect1">
										      <option>1</option>
										      <option>2</option>
										      <option>3</option>
										      <option>4</option>
										      <option>5</option>
										    </select>
										</div>
										<div style="width:70px; height:20px; font-size:16px;  font-weight: bold; float: right;">
										12,900원
										</div>
							  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
							    <span aria-hidden="true">&times;</span>
							  </button>
							 </div>
					       </li>
				      <!-- option end-->
				       <!-- option -->
						   <li>
							  <div style="width:100%; height:100%; padding-bottom:40px; word-break:break-all;word-wrap:break-word;" class="alert alert-secondary alert-dismissible fade show" role="alert">
							  		<div class="option">구성: 01. 고무장갑 5입 / 색상/사이즈: 베이지 M</div>
							  		   <div style="width:70px; height:20px; font-size:12px; float: left;">
											<select style="width:70px; height:20px;" "class="form-control" id="exampleFormControlSelect1">
										      <option>1</option>
										      <option>2</option>
										      <option>3</option>
										      <option>4</option>
										      <option>5</option>
										    </select>
										</div>
										<div style="width:70px; height:20px; font-size:16px;  font-weight: bold; float: right;">
										12,900원
										</div>
							  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
							    <span aria-hidden="true">&times;</span>
							  </button>
							 </div>
					       </li>
				      <!-- option end-->
				         <p>
				      				 <div style=" font-size:12px; float: left;">
											옵션변경 | 바로결제
											</div>
									<div style=" font-size:16px;  font-weight: bold; float: right;">
									25,800원
									</div>
						  </p>
			        
					 </li>
					   
				  <!-- product end -->
				  
				  <hr>
				  
				   <!-- product 2 -->
				  <li class="media my-4 ">
						 <!-- Checked checkbox -->
		            <div class="custom-control custom-checkbox">
					  <input type="checkbox" class="custom-control-input" id="customCheck2">
					  <label class="custom-control-label" for="customCheck2"></label>
					</div>
					<!-- Checked checkbox  end -->
				    <img src="../resources/images/glove.webp" class="mr-3" alt="...">
				    <div class="media-body">
				      <div class="mt-0 mb-1 productName">[생활공작소] 고무장갑 일반형(33cm) 5입(그레이/베이지) 2size(S/M)</div>
				         <div class="shipping">무료배송 | 일반택배</div>
				    </div>
				    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					    <span aria-hidden="true">&times;</span>
					 </button>
					  
					   <!-- option -->
						   <li>
							  <div style="width:100%; height:100%; padding-bottom:40px; word-break:break-all;word-wrap:break-word;" class="alert alert-secondary alert-dismissible fade show" role="alert">
							  		<div class="option">구성: 01. 고무장갑 5입 / 색상/사이즈: 베이지 M</div>
							  		   <div style="width:70px; height:20px; font-size:12px; float: left;">
											<select style="width:70px; height:20px;" "class="form-control" id="exampleFormControlSelect1">
										      <option>1</option>
										      <option>2</option>
										      <option>3</option>
										      <option>4</option>
										      <option>5</option>
										    </select>
										</div>
										<div style="width:70px; height:20px; font-size:16px;  font-weight: bold; float: right;">
										12,900원
										</div>
							  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
							    <span aria-hidden="true">&times;</span>
							  </button>
							 </div>
					       </li>
				      <!-- option end-->
				       <!-- option -->
						   <li>
							  <div style="width:100%; height:100%; padding-bottom:40px; word-break:break-all;word-wrap:break-word;" class="alert alert-secondary alert-dismissible fade show" role="alert">
							  		<div class="option">구성: 01. 고무장갑 5입 / 색상/사이즈: 베이지 M</div>
							  		   <div style="width:70px; height:20px; font-size:12px; float: left;">
											<select style="width:70px; height:20px;" "class="form-control" id="exampleFormControlSelect1">
										      <option>1</option>
										      <option>2</option>
										      <option>3</option>
										      <option>4</option>
										      <option>5</option>
										    </select>
										</div>
										<div style="width:70px; height:20px; font-size:16px;  font-weight: bold; float: right;">
										12,900원
										</div>
							  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
							    <span aria-hidden="true">&times;</span>
							  </button>
							 </div>
					       </li>
				      <!-- option end-->
				         <p>
				      				 <div style=" font-size:12px; float: left;">
										 옵션변경 | 바로결제
									</div>
									<div style=" font-size:16px;  font-weight: bold; float: right;">
									25,800원
									</div>
					     </p>
			        
					 </li>
					  
				  <!-- product end -->
				   
			
			    <hr>
				  
				  <!-- product 2 -->
				  <li class="media my-4 ">
						 <!-- Checked checkbox -->
		            <div class="custom-control custom-checkbox">
					  <input type="checkbox" class="custom-control-input" id="customCheck2">
					  <label class="custom-control-label" for="customCheck2"></label>
					</div>
					<!-- Checked checkbox  end -->
				    <img src="../resources/images/glove.webp" class="mr-3" alt="...">
				    <div class="media-body">
				      <div class="mt-0 mb-1 productName">[생활공작소] 고무장갑 일반형(33cm) 5입(그레이/베이지) 2size(S/M)</div>
				         <div class="shipping">무료배송 | 일반택배</div>
				    </div>
				    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					    <span aria-hidden="true">&times;</span>
					 </button>
					  
					   <!-- option -->
						   <li>
							  <div style="width:100%; height:100%; padding-bottom:40px; word-break:break-all;word-wrap:break-word;" class="alert alert-secondary alert-dismissible fade show" role="alert">
							  		<div class="option">구성: 01. 고무장갑 5입 / 색상/사이즈: 베이지 M</div>
							  		   <div style="width:70px; height:20px; font-size:12px; float: left;">
											<select style="width:70px; height:20px;" "class="form-control" id="exampleFormControlSelect1">
										      <option>1</option>
										      <option>2</option>
										      <option>3</option>
										      <option>4</option>
										      <option>5</option>
										    </select>
										</div>
										<div style="width:70px; height:20px; font-size:16px;  font-weight: bold; float: right;">
										12,900원
										</div>
							  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
							    <span aria-hidden="true">&times;</span>
							  </button>
							 </div>
					       </li>
				      <!-- option end-->
				       <!-- option -->
						   <li>
							  <div style="width:100%; height:100%; padding-bottom:40px; word-break:break-all;word-wrap:break-word;" class="alert alert-secondary alert-dismissible fade show" role="alert">
							  		<div class="option">구성: 01. 고무장갑 5입 / 색상/사이즈: 베이지 M</div>
							  		   <div style="width:70px; height:20px; font-size:12px; float: left;">
											<select style="width:70px; height:20px;" "class="form-control" id="exampleFormControlSelect1">
										      <option>1</option>
										      <option>2</option>
										      <option>3</option>
										      <option>4</option>
										      <option>5</option>
										    </select>
										</div>
										<div style="width:70px; height:20px; font-size:16px;  font-weight: bold; float: right;">
										12,900원
										</div>
							  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
							    <span aria-hidden="true">&times;</span>
							  </button>
							 </div>
					       </li>
				      <!-- option end-->
				         <p>
				      				 <div style=" font-size:12px; float: left;">
										 옵션변경 | 바로결제
									 </div>
									<div style=" font-size:16px;  font-weight: bold; float: right;">
									25,800원
									</div>
						  </p>
			        
					 </li>
					   
				  <!-- product end -->
			
			     	    <hr>
			     	    <!-- product 2 -->
				  <li class="media my-4 ">
						 <!-- Checked checkbox -->
		            <div class="custom-control custom-checkbox">
					  <input type="checkbox" class="custom-control-input" id="customCheck2">
					  <label class="custom-control-label" for="customCheck2"></label>
					</div>
					<!-- Checked checkbox  end -->
				    <img src="../resources/images/glove.webp" class="mr-3" alt="...">
				    <div class="media-body">
				      <div class="mt-0 mb-1 productName">[생활공작소] 고무장갑 일반형(33cm) 5입(그레이/베이지) 2size(S/M)</div>
				         <div class="shipping">무료배송 | 일반택배</div>
				    </div>
				    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					    <span aria-hidden="true">&times;</span>
					 </button>
					  
					   <!-- option -->
						   <li>
							  <div style="width:100%; height:100%; padding-bottom:40px; word-break:break-all;word-wrap:break-word;" class="alert alert-secondary alert-dismissible fade show" role="alert">
							  		<div class="option">구성: 01. 고무장갑 5입 / 색상/사이즈: 베이지 M</div>
							  		   <div style="width:70px; height:20px; font-size:12px; float: left;">
											<select style="width:70px; height:20px;" "class="form-control" id="exampleFormControlSelect1">
										      <option>1</option>
										      <option>2</option>
										      <option>3</option>
										      <option>4</option>
										      <option>5</option>
										    </select>
										</div>
										<div style="width:70px; height:20px; font-size:16px;  font-weight: bold; float: right;">
										12,900원
										</div>
							  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
							    <span aria-hidden="true">&times;</span>
							  </button>
							 </div>
					       </li>
				      <!-- option end-->
				       <!-- option -->
						   <li>
							  <div style="width:100%; height:100%; padding-bottom:40px; word-break:break-all;word-wrap:break-word;" class="alert alert-secondary alert-dismissible fade show" role="alert">
							  		<div class="option">구성: 01. 고무장갑 5입 / 색상/사이즈: 베이지 M</div>
							  		   <div style="width:70px; height:20px; font-size:12px; float: left;">
											<select style="width:70px; height:20px;" "class="form-control" id="exampleFormControlSelect1">
										      <option>1</option>
										      <option>2</option>
										      <option>3</option>
										      <option>4</option>
										      <option>5</option>
										    </select>
										</div>
										<div style="width:70px; height:20px; font-size:16px;  font-weight: bold; float: right;">
										12,900원
										</div>
							  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
							    <span aria-hidden="true">&times;</span>
							  </button>
							 </div>
					       </li>
				      <!-- option end-->
				         <p>
				      				 <div style=" font-size:12px; float: left;">
										 옵션변경 | 바로결제
								    </div>
									<div style=" font-size:16px;  font-weight: bold; float: right; text-align: right;">
									25,800원
									</div>
						  </p>
			        
					 </li>
					   
				  <!-- product end -->
			     
		
				  
				 </ul>
				 
		
			    
			  </div>
					  <div class="card-footer text-center text-muted">
					   배송비 무료
					  </div>
			  
			</div>
			
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

<script>
  
</script>

<c:import url="../template/footer.jsp"></c:import>
</body>
</html>