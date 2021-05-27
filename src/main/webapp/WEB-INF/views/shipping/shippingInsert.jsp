<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<!-- Button trigger modal -->
<button type="button" id="myModalBtn" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
  shipping Insert
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">배송지 추가</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="frm" action="./shippingInsert" method="post">
      <div class="modal-body">
     	 
     	 
     	 <div class="form-group">
				<input type="hidden" id="username" name="username" value="id123">
		</div>
     	 	  <div class="form-group row">
			    <label for="staticEmail" class="col-sm-2 col-form-label">배송지명</label>
			    <div class="col-sm-10">
			      <input type="text" name="shipTitle" class="form-control-plaintext" id="shipTitle" >
			    </div>
			  </div>
			  <div class="form-group row">
			    <label for="inputPassword" class="col-sm-2 col-form-label">받는 사람</label>
			    <div class="col-sm-10">
			      <input type="text" name="shipName" class="form-control" id="shipName">
			    </div>
			  </div>
			  <div class="form-group row">
			    <label for="inputPassword" class="col-sm-2 col-form-label">연락처</label>
			    <div class="col-sm-10">
			      <input type="text" name="shipPhone" class="form-control" id="shipPhone">
			    </div>
			  </div>
			  <div class="form-group row">
			    <label for="inputPassword" class="col-sm-2 col-form-label"> 주소 </label>
			    <div class="col-sm-10">
			    	<input type="text" id="sample2_postcode" placeholder="우편번호" name="shipAddress">
					<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기" name="shipAddress"><br>
					<input type="text" id="sample2_address" placeholder="주소" name="shipAddress"><br>
					<input type="text" id="sample2_detailAddress" placeholder="상세주소" name="shipAddress">
					<input type="text" id="sample2_extraAddress" placeholder="참고항목">
					
					<div class="form-check">
						<label class="form-check-label"> 
						<input type="checkbox" class="form-check-input" name="shipDefault" value="1">기본 배송지로 등록
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
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-info">저장</button>
      </div>
       </form>
      
    </div>
  </div>
</div>



<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../resources/js/shippingInsert.js"></script>
<script type="text/javascript">

$('#myModalBtn').click(function(e){
	e.preventDefault();
	$('#myModal').modal("show");
});


</script>

</body>
</html>