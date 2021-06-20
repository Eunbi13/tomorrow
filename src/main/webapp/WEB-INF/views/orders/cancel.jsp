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
.title{
font-size:20px;
font-weight:bold;
}

img{
width:80px;
max-width: 100px;
border-radius: 10px;
}

.subTitle{
width: 10%; 
color:gray;
padding-left:10px;
}

.gray{
color:gray;
}

.noresize {
  resize: none; /* 사용자 임의 변경 불가 */
  width:100%; 
  height:100px; 
  
}

</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
hi
 <div class="container">
  <div style="font-size:24px; font-weight:bold; margin-top:40px;">주문취소요청</div> 
  	<div class="title">주문 취소 및 환불 안내</div>
         <div class="normal"> 주문 상품 옵션 단위로 한불이 가능합니다. 
           묶음 배송 제품의 부분취소의 경우 배송비를 제외하고 환불될 수 있습니다. </div>
     
     	<div class="title"> 취소 요청 상품 확인</div>
     	   <hr style="margin-top:50px;">
     	   <table class="">
     	   		
			    <tr>
				    <td style="width: 10%; border-right:none; max-width:100px;">
				    <img src="../resources/images/glove.webp" class="mr-3" alt="...">
				  </td>
				    <td style="width: 90%; border-left:none; font-size: 16px;">
				      <div class="gray">상품 옵션번호:${cartVO.cartNum}</div>
				      <div style="font-weight: bold; margin-top:10px;"> [${cartVO.brandVO.brandName}]  ${cartVO.productVO.productName} </div>
				    
					     
					    <div> <div class="gray" style="margin:10px 0px">${cartVO.unitName}&#160; </div> <div class="gray" style="float:left; color:gray;">| ${cartVO.amount}개</div></div>
					    
					 </td>
			     </tr>
		    </table>	        
     	   
     	<div class="title"> 취소 수량</div>
     	   <hr style="margin-top:50px;">
     	
     	<div class="title"> 취소 금액 확인</div>
     	   <hr style="margin-top:50px;">
     	   
     	   <table class="info" style="margin-bottom:70px;">
 					 	<tr>
 					 		<td class="subTitle">옵션 결제액</td>
 					 		<td style="width: 90%;">${ordersVO.shippingVO.shipName} </td>
 					 	</tr>
 					 	<tr>
 					 		<td class="subTitle">선불 배송비</td>
 					 		<td style="width: 90%;">(+) ${ordersVO.shippingVO.shipPhone} </td>
 					 	</tr>
 					 	<tr>
 					 		<td class="subTitle">추가 배송비</td>
 					 		<td style="width: 90%;">(-) ${ordersVO.shippingVO.shipDetailAddress} </td>
 					 	</tr>
 					 	<tr>
 					 		<td class="subTitle">취소 예상금액</td>
 					 		<td style="width: 90%;">
 					 		
 					 		</td>
 					 	</tr>
 					 	<tr>
 					 	  <ul>
 					 	      <li> 취소 상태에 따른 배송비 계산에서 차이가 발생할 수 있습니다. </li>
 					 	  </ul> 
 					 	   
 					 	</tr>
 					 </table>
     	<div class="title"> 취소 사유 입력</div>
     	   <hr style="margin-top:50px;">
     	       <select>
     	       		<option>취소 사유를 선택해주세요</option>
     	       		<option>상품이 필요 없어짐</option>
     	       		<option>다른 상품 구매함</option>
     	       		<option>타 쇼핑몰에서 구매함</option>
     	       		<option>상품 품절됨(판매자 요청 취소)</option>
     	       		<option>상품 배송 지연됨(출고 지연)</option>
     	       	    <option>재주문</option>
     	       </select>
     	       
     	     <textarea class="nosize"> </textarea>





</div>


<c:import url="../template/footer.jsp"></c:import>
</body>
</html>