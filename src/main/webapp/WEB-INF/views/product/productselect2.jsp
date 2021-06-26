<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- PRODUCT SELECT //// STORE -->
<!-- class 이름 정리 -->
<!DOCTYPE html>
<style>
#optionAdd{
  display:none;
}

</style>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>store select</title>
<style type="text/css">

ul{
   list-style:none;
   }

.main {
display: flex;
flex-direction: row;
margin-top: 20px;
margin-bottom: 40px;
flex-wrap: wrap;
box-sizing: border-box; 
margin-right: auto;
margin-left: auto;
max-width: 100%;
min-height: 1px;
}

/* 사진 div */
.main-pic{ 
float: left;
flex:1;
position: relative;
box-sizing: border-box;
flex-grow: 0;
flex-shrink: 0;
align-items: flex-start;
flex-basis: 55em;

}



/* select 좌측 작은 사진 */
.main-pic-small{
list-style: none; 
float: left; 
margin-right: 10px;
display: block;
flex:1;
}

/* select 좌측 작은 사진- 버튼 */
.main-pic-small-bt{
margin: 2px;
border: 0;
outline: 0; 
border-radius: 12px;
}

/* select 메인 우측 사진 */
.main-pic-big{
float: left;
border-radius: 12px;
box-sizing: border-box;
max-width: 40%;
flex:5;
}

.main-contents{
float: left;
position: relative;
box-sizing: border-box;
display: block;

}
.price-div{
display: flex;
flex-direction: row;
}

.price-product{
padding: 20px 10px 20px 10px;
margin-bottom: 25px;
}

.price-left{
float:left;
font-size: 16px;
font-weight: bold;

}

.price-right{
float:right;
font-size: 22px;
font-weight: bold;
}

.store-select-buttons{
clear: both;
width:100%;
text-align:center;
}

</style>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>

	<div class="main">
		<div class="main-pic" >
		<div class="main-pic-wrap"> 
		<!-- select 좌측 작은 사진 -->
		<ul class="main-pic-small" >
			<li >	
			<button class="main-pic-small-bt">
				<img alt="상품이미지"
				src="../resources/images/categoryPic/A1.webp">
			</button>
			</li>
			<li >	
			<button class="main-pic-small-bt">
				<img alt="상품이미지"
				src="../resources/images/categoryPic/A1.webp">
			</button>
			</li>
			<li >	
			<button class="main-pic-small-bt">
				<img alt="상품이미지"
				src="../resources/images/categoryPic/A1.webp">
			</button>
			</li>
		</ul>
		<!-- select 메인 우측 사진 -->
		<div class="main-pic-big">
			<img alt="상품이미지" style="width:600px;"
			src="../resources/images/storeEX/glove.webp">
		</div>
		</div>
		</div> <!--div class="main-pic"-->

		<!-- select 메인 좌측 -->
		<div class="main-contents">
			<div class="brand" style="font-size: 14px; color: gray;">
				<c:if test="${brandVO.brandNum eq productVO.brandNum}">
					${vo.brandVO.brandName }
				</c:if>
			</div>

			<div class="title" style="font-size: 23px;">${vo.productName}</div>

			<div class="price">
				<div class="price-div">
				<!-- 할인율 계산 후 표시 -->
				<c:if test="${((vo.productPrice - vo.discountPrice)/100) != 0}">
					<div class="price-percent" style="font-size: 17px; margin-right: 10px;">${(vo.productPrice - vo.discountPrice)/100}%
					</div>
				</c:if>
				<!-- 원가 -->
				<div class="price-origin" style="color:gray; text-decoration:line-through; font-size:17px; ">
					${vo.productPrice}원</div>
				</div>	
				<!-- 할인가 -->
				<div class="price-final" style="font-weight: bold; font-size:25px; ">${vo.discountPrice}원</div>
			</div>
			<!-- price 클래스 끝 -->

			<div class="ship">
				<c:choose>
					<c:when test="${vo.shippingFee eq 0}">
					무료배송
					</c:when>
					<c:otherwise>
					${vo.shippingFee}원
					<div style="font-weight: lighter;">(30,000원 이상 구매시 무료배송)</div>
					</c:otherwise>
				</c:choose>
			</div>
			<!-- ship 클래스 끝 -->

			<div class="brand-url">
				<c:if test="${brandVO.brandNum eq productVO.brandNum}">
					<a href=""> ${brand }</a>
				</c:if>
			</div>

			<div class="option">
			
					<select id="selectop" name="options" onchange='addList()'>
									<!-- 0 쓰지마라 ... -->
						<option value="optionKinds" selected disabled>${vo.optionsVOs.get(0).optionKinds} </option> <!-- 수정 -->
						<c:forEach items="${optionsar}" var="OPvo" varStatus="status">
							<option value="${OPvo.optionNum}" data-OPname="${OPvo.optionName}" data-OPprice="${vo.discountPrice + OPvo.optionPrice}">
								<div id="OPname">${OPvo.optionName}</div>,
								<div id="OPprice">${vo.discountPrice + OPvo.optionPrice}</div>	
							</option>
						</c:forEach>
					</select>
					<br>*** <br>
					  <form id="frm" action="../cart/insert" method="post">
					  
					<!-- option 값 출력되는 곳 -->
					<ul id='opPrint'>
		
					</ul>
					
					<!-- <button type="submit"
							class="store-select-button btn btn-outline-primary"
							style="color: #A63F82;"  >장바구니</button> -->
					 
					<div id='optionResult'></div>
					
					
					<!-- product안에 선택된 모든 옵션들의 가격 -->
					<div class="price-product">
					<div class="price-left">주문금액</div>
					<div class="price-right">
						<input  readonly="readonly" value="0" id="productVOPrice" class="productPrice num"  style=" width:200px; height:30px; background-color:transparent;border:0 solid black; text-align:right;">원
						
					</div>
					</div>
					
					
					

					<div class="store-select-buttons">
						<button type="submit"
							class="store-select-button btn btn-outline-primary"
							style="color: #A63F82; width:48%;"  >장바구니</button>
							
						<button type="button" onclick="directPay()" class="store-select-button btn btn-default"
							style="background-color: #A63F82; #A63F82; width:48%;">바로구매</button>
					</div>
			</form>
			
			<!-- option -->
					 <div id="optionAdd" class="optionAdd">
					  
					     <li id="carts" title="${vo.brandNum}">
					       <input type="hidden" name="brandNum" value="${vo.brandNum}">
					       <input type="hidden" name="productNum" id="productNum" value="${vo.productNum}">

					         <!--  unitPrice  -->
					       <input type="hidden" class="unitPrice" id="unitPrice" name="unitPrice"  value="">
						      <!-- productNum  -->
							  <div title="${vo.productNum}" class="cartCheck alert alert-secondary alert-dismissible fade show" style="width:100%; height:100%; padding-bottom:40px; word-break:break-all; word-wrap:break-word;" >
							  		 <!-- unitName  -->
							  		<div id=""> <input name="unitName" id="unitName" value=""  style=" width:180px; height:20px; background-color:transparent;border:0 solid black; text-align:;">   </div>
							  		    <div style="width:70px; height:20px; font-size:12px; float: left;">
										     <!--  amount/ 숫자만 입력할수 있도록 type number 지정 -->
										     <input style="width:70px; height:20px; ime-mode:disabled;" onfocus='amountSave.call(this)' onchange='go.call(this)' type="number" min="1"  class="box" data-product-num="${vo.productNum}" title="" id="directInputBox" name="amount" value="1"/>
										</div>
										<div class="num" style="width:200px; height:23px; font-size:16px; padding-bottom:20px; font-weight: bold; float: right;">
										       <!--  cartPrice-->
											       <input type="text" readonly name="cartPrice" id="cartPrice" class="cartPricePlus"  value="" style=" width:180px; height:20px; background-color:transparent;border:0 solid black; text-align:right;" />
											  원
										</div> 
							    <button type="button" class="close delete" onclick='opClose.call(this)'  id="opDelete" title="" data-productNum="${vo.productNum}"  data-brandNum="${vo.brandNum}" aria-label="Close">
							    <span aria-hidden="true">&times;</span>
							  </button>
							 </div>
							 
					       </li>

				       </div>
					       
					    </div>
				       

				      <!-- option end-->
				
                
		
			</div>
			<!-- option 클래스 끝 -->

		</div>
		<!-- main contents 클래스 끝 -->
		

	<!-- main 클래스 끝 -->

	<!-- <script type="text/javascript" src="../resources/js/productSelect.js"></script> -->
	<script type="text/javascript" src="../resources/js/productSelect2.js"></script>
	<script type="text/javascript" src="../resources/js/productSelect3.js"></script>
</body>
</html>