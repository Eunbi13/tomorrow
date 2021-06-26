<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- PRODUCT SELECT //// STORE -->
<!-- class 이름 정리 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/bootStrap.jsp"></c:import>
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>store select</title>

<style type="text/css">

.pic-small{
width: 80px;
}
#selectop{
width:100%;
height: 40px;
padding:0px 20px 0px 16px;
font-size:16px;
vertical-align: center;
border: #A63F82 1px solid;
border-radius: 4px;
}

#optionAdd{
  display:none;
}

ul{
   list-style:none;
   padding-left:0px;
   }

.main {
margin-top: 20px;
margin-bottom: 40px;

box-sizing: border-box; 
margin-right: auto;
margin-left: auto;
max-width: 100%;
min-height: 1px;
}
/* 사진 div */
.main-pic{ 
float: left;
position: relative;
box-sizing: border-box;
align-items: flex-start;
}
/* select 좌측 작은 사진 */
.main-pic-small{
list-style: none; 
float: left; 
margin-right: 10px;
display: block;

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
}
.main-contents{
float: left;
position: relative;
box-sizing: border-box;
display: block;
width: 40%;
padding-left: 30px; 
}

.main-contents div{
margin-bottom:10px;
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
.price-percent{
color:#808080;
}

.brandHome{
	background-color: #e5b8d7;
	color:#A63F82;
	border-color: #e5b8d7;
	padding:8px 12px 5px 15px;
	border-radius: 20px;
	border: 0;
	outlin:0;
	font-size:14px;
	font-weight: bold;
}

.brandHome:hover, .brandHomet:focus, .brandHome:active{
    background-color: #A63F82;
	color:#FFF;
	border-color: #A63F82;

}


select {

  /* styling */
  background-color: white;
  border: thin solid blue;
  border-radius: 4px;
  display: inline-block;
  font: inherit;
  line-height: 1.5em;
  padding: 0.5em 3.5em 0.5em 1em;

  /* reset */

  margin: 0;      
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-appearance: none;
  -moz-appearance: none;
}



select.classic {
  background-image:
    linear-gradient(45deg, transparent 50%,  #A63F82 50%),
    linear-gradient(135deg,  #A63F82 50%, transparent 50%),
    linear-gradient(to right, #FFF, #FFF);
  background-position:
    calc(100% - 20px) calc(1em + 2px),
    calc(100% - 15px) calc(1em + 2px),
    100% 0;
  background-size:
    5px 5px,
    5px 5px,
    2.5em 2.5em;
  background-repeat: no-repeat;
}

.btn-orders{
    
    width:125px;
    max-width:100%;
	padding:15px 22px;
	font-weight: bold;
	font-size: 18px;
	border-radius:0;
	background-color: #FFF;
	color:#A63F82;
	border-color: #A63F82;
	border:1px solid;
	border-radius:6px;

}
.btn-orders:hover, .btn-orders:focus, .bbtn-orders:active, .btn-orders.active, .open .dropdown-toggle.btn-orders {
 
	background-color: #e5b8d7;
	color:#A63F82;
	border-color: #A63F82;;
}

.btn-default{
    width:125px;
    max-width:100%;
	padding:15px 22px;
	font-weight: bold;
	font-size: 18px;
	border-radius:0;
	border:1px solid;
	border-radius:6px;
}

.btn-default:hover, .btn-default:focus, .btn-default:active, .btn-default.active, .open .dropdown-toggle.btn-default {
 
	background-color: #732944;
	color:#FFF;
	border-color: #732944;
 
}

.cartCheck{
  font-size: 16px;
  background-color:#f2f2f2;
  border-color:#f2f2f2;
}

/*  nav 삭제예정*/




#navbar {
  /*overflow: hidden;*/
  background-color: hsl(0, 0%, 97%);
  height:52px;
  width:100%;
  position: sticky;
  top: 117px;
  z-index: 100;
  border: 1px #e6e6e6 solid;

  
}

#navbar a {
  float: left;
  display: block;
  color:#333333;
  text-align: center;
  padding: 18px 50px 15px 50px;
  text-decoration: none;
  font-size: 17px;
  font-weight: bold;
 
}

#navbar a:hover {
  background-color: #f2f2f2;
  color: #A63F82;
}

#navbar a.active {
  padding: 18px 50px 12px 50px;
  background-color: #f2f2f2;
  border-bottom: 3px #A63F82 solid;
  color: #A63F82;
}




</style>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
<main>

	<div class="main">
		<div class="main-pic" >
		<div class="main-pic-wrap"> 
		<!-- select 좌측 작은 사진 -->
		<ul class="main-pic-small" >
			<li >	
			<button class="main-pic-small-bt">
				<img alt="상품이미지" class="pic-small"
				src="../resources/images/categoryPic/A1.webp">
			</button>
			</li>
			<li >	
			<button class="main-pic-small-bt">
				<img alt="상품이미지" class="pic-small"
				src="../resources/images/categoryPic/A1.webp">
			</button>
			</li>
			<li >	
			<button class="main-pic-small-bt">
				<img alt="상품이미지" class="pic-small"
				src="../resources/images/categoryPic/A1.webp">
			</button>
			</li>
		</ul>
		<!-- select 메인 우측 사진 -->
		<div class="main-pic-big">
			<img alt="상품이미지" style="max-width:560px; height:auto; border-radius: 15px;"
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
				<div class="price-div" style=" margin-bottom:0px; ">
				<!-- 할인율 계산 후 표시 -->
				<c:if test="${((vo.productPrice - vo.discountPrice)/100) != 0}">
					<div class="price-percent" style="font-size: 17px; margin-right: 10px;">${(vo.productPrice - vo.discountPrice)/100}%
					</div>
				</c:if>
				<!-- 원가 -->
				<div class="price-origin" style="color:#cccccc; text-decoration:line-through; font-size:17px; ">
					${vo.productPrice}원</div>
				</div>	
				<!-- 할인가 -->
				<div class="price-final" style="font-weight:800; font-size:34px; ">${vo.discountPrice}  <font style="font-weight:normal; font-size:28px;"> 원</font></div> 
			</div>
			<!-- price 클래스 끝 -->

			<div class="ship">
			  <div style="float:left; width:10%; font-size:15px; color:#a6a6a6; text-align:left;">
			     배송
			  
			  </div>
			  <div style="float:left; width:85%; font-size:15px; ">
			  		<c:choose>
						<c:when test="${vo.shippingFee eq 0}">
						무료배송
						</c:when>
						<c:otherwise>
						${vo.shippingFee}원 선결제
						<div style="font-weight: lighter; margin-top:5px;">(30,000원 이상 구매시 무료배송)</div>
						</c:otherwise>
				    </c:choose>
				    <div>일반택배</div>
				    <div >  <i class="fas fa-check"  style="font-size:6px; color:#a6a6a6; margin-right:5px;"></i> <font style="color:#a6a6a6; font-size:13px; font-weight:400; ">지역별 차등배송비</font></div> 
			  
			  </div>
				
			</div>
			<!-- ship 클래스 끝 -->
			
            <hr style="margin-top:110px;">
            
			<div class="brand-url">
				<c:if test="${brandVO.brandNum eq productVO.brandNum}">
					    <a href="./">
						<div style="border: blue 0px solid; height:30px">
						 
							<span style="float:left;">
								<img src="/images/house-icon.webp" style="width:28px;">
								<font style="font-weight:bold; font-size:16px;">${vo.brandVO.brandName}</font> 
							</span>
							<span style="float:right;"> 
								<div type="button" class="brandHome"> 브랜드홈 > </div>
							</span>
							
						</div>
						</a>
							
						
				
				</c:if>
			</div>

			<div class="option">
			
			    <div class="select-wrap">			
			    	<select id="selectop" class="classic" name="options" onchange='addList()'>
									<!-- 0 쓰지마라 ... -->
						<option value="optionKinds" selected disabled>${vo.optionsVOs.get(0).optionKinds} </option> <!-- 수정 -->
						<c:forEach items="${optionsar}" var="OPvo" varStatus="status">
							<option value="${OPvo.optionNum}" data-OPname="${OPvo.optionName}" data-OPprice="${vo.discountPrice + OPvo.optionPrice}">
								<div id="OPname">${OPvo.optionName}</div>,
								<div id="OPprice">${vo.discountPrice + OPvo.optionPrice}</div>	
							</option>
						</c:forEach>
					</select>
				</div>		
					
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
						<input  readonly="readonly" value="0" id="productVOPrice" class="productPrice num"  style=" width:200px; height:30px; background-color:transparent; font-weight:800;  border:0 solid black; text-align:right;">원
						
					</div>
					</div>
					
					
					

					<div class="store-select-buttons">
						<button type="submit"
							class="store-select-button btn btn-orders"
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
											       <input type="text" readonly name="cartPrice" id="cartPrice" class="cartPricePlus"  value="" style=" width:180px; height:20px; background-color:transparent; font-weight:800; border:0 solid black; text-align:right;" />
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
	
	      <!-- 아래쪽 상세 정보 시작 -->
	   <!--  상품정포 nav/부모요소가 main이게 할-->
	   
	   <div id="navbar" style="clear:both;">
				  <a class="active" href="javascript:void(0)">Home</a>
				  <a href="#firstMove">상품정보</a>
				  <a href="#secondMove">배송/환불</a>
	   </div> 
	   
     
     
     <p>The navbar will stick to the top when you reach its scroll position.</p>
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
  <div id="firstMove">first </div>
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
    <div> 상품정보</div>
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. I
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>

  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. I
 <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. I
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. I
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
   <div id="secondMove">배송 </div>
   <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. I
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
 <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. I
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. I
  <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. I
 </main>
  <script>
/* window.onscroll = function() {myFunction()};

var navbar = document.getElementById("navbar");
var sticky = navbar.offsetTop;

function myFunction() {
  if (window.pageYOffset >= sticky) {
    navbar.classList.add("sticky")
  } else {
    navbar.classList.remove("sticky");
  }
} */
</script>

	<!-- <script type="text/javascript" src="../resources/js/productSelect.js"></script> -->
	<script type="text/javascript" src="../resources/js/productSelect2.js"></script>
	<script type="text/javascript" src="../resources/js/productSelect3.js"></script>
	 <c:import url="../template/footer.jsp"></c:import>
</body>
</html>