<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>



        <a class="order_list_menu_list" title="2" >
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">결제완료</div>
 				<div class="order_list_menu_list_value">${fn:length(ar2)}  </div>
 			</div>
 		</a>
 		<a class="order_list_menu_list" title="3" >
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">배송준비</div>
 				<div class="order_list_menu_list_value"> ${fn:length(ar3)}   </div>
 			</div>
 		</a>
 		<a class="order_list_menu_list" title="4" >
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">배송중</div>
 				<div class="order_list_menu_list_value"> ${fn:length(ar4)}  </div>
 			</div>
 		</a>
 		<a class="order_list_menu_list" title="5" >
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">배송완료</div>
 				<div class="order_list_menu_list_value"> ${fn:length(ar5)}  </div>
 			</div>
 		</a>
 		<a class="order_list_menu_list" title="6" >
 			<div class="order_list_menu_list_wrap">
 				<div class="order_list_menu_list_title">구매확정</div>
 				<div class="order_list_menu_list_value"> ${fn:length(ar6)}  </div>
 			</div>
 		</a>

 		
 		<script type="text/javascript">

			//order_list_menu_list 클릭시, 누른 주문상태와  가지고 있는 기간 버튼의 기간의 가져와서  리스트 갱신
			$(".order_list_menu_list").click(function(){
				alert("hi");
				 let st=$(this).attr("title");
				let be =$("#before").val();
			    alert("be:"+be+"st:"+st);
			
				$.ajax({
					type: "get", 
					url: "../orders/ajaxList", 
				
					data:{
					   before:be,
					   status:st
						
					}, 
					success:function(data){
						console.log(data);
						$("#AjaxList").empty();
						
						$("#AjaxList").html(data);
					}
					
				}); 
				
			});
			
			</script>