<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.line{
margin-top:16px;
}
.title{
font-size:20px;
font-weight:bold;
margin-top: 60px;
}

.normal{

font-size:16px;
margin-top:20px;

}

img{
width:80px;
max-width: 100px;
border-radius: 10px;
}

.subTitle{
font-size:18px;
width: 15%; 
color:gray;
padding-left:10px;
}
.subContent{
font-size:18px;
width: 85%; 
padding-left:20px;
}

.gray{
color:gray;
}




.bigTitle{

font-size:26px; 
font-weight:bold; 
margin-top:40px;

}
.ref{
font-size:14px; 
color: #4d4d4d;
padding-left:20px;
}

.select{
font-size:16px; 
height: 40px;
width: 300px;
padding-left:10px;
margin-bottom: 20px;
border-color:lightgray;
}

.btn-default{
	padding:11px 22px;
	font-weight: bold;
	font-size: 18px;
	border-radius:0;
	background-color: #A63F82;
	color:#FFF;
	border-color: #A63F82;
	border:3px solid;
	margin-bottom:100px;
}

.btn-default:hover, .btn-default:focus, .btn-default:active, .btn-default.active, .open .dropdown-toggle.btn-default {
 
	background-color: #732944;
	color:#FFF;
	border-color: #732944;
}

</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

 <div class="container">
<c:if test="${sel == '취소'}">
  <div class="bigTitle">주문취소요청</div> 
  	<div class="title">주문 취소 및 환불 안내</div>
  		<div class="normal"> 주문 상품 옵션 단위로 환불이 가능합니다. <br>
           묶음 배송 제품의 부분취소의 경우 배송비를 제외하고 환불될 수 있습니다. </div>
 </c:if>
 
 <c:if test="${sel =='환불'}">
  <div class="bigTitle"> 환불 요청</div> 
  	<div class="title"> 환불 안내</div>
  		<div class="normal"> 주문 상품 옵션 단위로 환불이 가능합니다. <br>
           묶음 배송 제품의 부분취소의 경우 배송비를 제외하고 환불될 수 있습니다. </div>
 </c:if>
 
 <c:if test="${sel =='교환'}">
  <div class="bigTitle"> 교환 요청</div> 
  	<div class="title"> 교환 안내</div>
  		<div class="normal"> 주문 상품 옵션 단위로 교환이 가능합니다. <br>
           묶음 배송 제품의 부분교환의 경우 추가 배송비가 요청될 수 있습니다.</div>
 </c:if>
         
     
     	<div class="title"> ${sel} 요청 상품 확인</div>
     	   <hr class="line">
     	   <table class="">
     	   		
			    <tr>
				    <td style="width: 10%; border-right:none; max-width:100px;">
				    <img src="../resources/images/glove.webp" class="mr-3" alt="...">
				  </td>
				    <td style="width: 90%; border-left:none; font-size: 16px;">
				      <div class="gray">상품 옵션번호: ${cartVO.cartNum}</div>
				      <div style="font-weight: bold; margin-top:10px; font-size:20px;"> [${cartVO.brandVO.brandName}]  ${cartVO.productVO.productName} </div>
				    
					     
					    <div> <div class="gray" style="float:left; margin:10px 0px;">${cartVO.unitName}&#160;&#160;&#160; </div> <div class="gray" style="float:left; margin:10px 0px;">| &#160;&#160;&#160;${cartVO.amount}개</div></div>
					    
					 </td>
			     </tr>
		    </table>
		         	   <hr class="line">
		    	        
     	   
     	<div class="title"> ${sel} 수량</div>
     	   <hr class="line">
     	  <div class="normal"> ${cartVO.amount}개 </div>
     	 
      <c:if test="${sel =='환불'} || ${sel =='취소'}">	 
     	
     	<div class="title"> ${sel} 금액 확인</div>
     	   <hr class="line">
     	   
     	   <table class="info" style="margin-bottom:10px;">
 					 	<tr style="height: 40px;">
 					 		<td class="subTitle">옵션 결제액</td>
 					 		<td class="subContent">${cartVO.cartPrice}원 </td>
 					 	</tr>
 					 	<tr style="height: 40px;">
 					 		<td class="subTitle">선불 배송비</td>
 					 		<td class="subContent">(+) ${cartVO.brandShipping}원 </td>
 					 	</tr>
 					 	<tr style="height: 40px;">
 					 		<td class="subTitle">추가 배송비</td>
 					 		<td class="subContent">(-) 0원 </td>
 					 	</tr>
 					 	<tr style="height: 40px;">
 					 		<td class="subTitle">취소 예상금액</td>
 					 		<td class="subContent"> ${cartVO.cartPrice}원 </td>
 					 	</tr>
 					 	
 					 </table>
 					 
 					   <div class="ref"> 
 					     <li> ${sel} 상태에 따른 배송비 계산에서 차이가 발생할 수 있습니다. </li>
 					   </div>
 					   
 		</c:if>
 		
     	<div class="title"> ${sel} 사유 입력</div>
     	   <hr class="line">
     	      <div>
	     	       <select class="select">
	     	       		<option>취소 사유를 선택해주세요</option>
	     	       		<option>상품이 필요 없어짐</option>
	     	       		<option>다른 상품 구매함</option>
	     	       		<option>타 쇼핑몰에서 구매함</option>
	     	       		<option>상품 품절됨(판매자 요청 취소)</option>
	     	       		<option>상품 배송 지연됨(출고 지연)</option>
	     	       	    <option>재주문</option>
	     	       </select>
     	      </div>
     	       
     	       <div>
     	    	 <textarea cols="50" rows="5" class="nosize" style="resize: none; border-color:lightgray;"> </textarea>
     	      </div>
     	      
     	      <div>
     	      <button type="button" class="btn-default"> ${sel} 요청하기 </button>
     	      
             </div>




</div>


<c:import url="../template/footer.jsp"></c:import>
</body>
</html>