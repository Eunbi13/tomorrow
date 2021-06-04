<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<fieldset>
			<legend>옵션</legend>
			<div class="col-sm-12">
				<label class="col-sm-2 col-form-label">옵션 구성 타입 </label>
				조합 일체선택형<input type="radio" id="notUse" name="o1" checked>
				조합 분리선택형<input type="radio" id="use" name="o1">
				<div >
					<div class="form-group row col-sm-3">
						<label class="col-form-label">옵션 종류</label>
						<div >
							<input class="form-control" name="optionKinds" type="text" placeholder="Please kinds">
						</div>
					</div>
					<div class="form-group row col-sm-3">
						<label class="col-form-label">옵션별 이름</label>
						<div >
							<input class="form-control" name="optionName" type="text" placeholder="Please name">
						</div>
					</div>
					<div class="form-group row col-sm-3">
						<label class="col-form-label">옵션별 가격</label>
						<div >
							<input class="form-control" name="optionPrice" type="number" placeholder="Please price">
						</div>
					</div>
					<div class="form-group row col-sm-1" >
						<img alt="" src="/images/plusIcon.png" style="width: 30px; height: 30px;">
					</div>
				</div>
			</div>
			<div id="option" class="btn btn-secondary">개별옵션 추가하기</div>
			
		</fieldset>
		
		<script type="text/javascript" src="/js/productInsert.js"></script>

</body>
</html>