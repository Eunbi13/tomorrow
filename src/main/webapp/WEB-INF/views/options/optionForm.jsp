<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   
<div class="addOption">

	<div class="col-sm-12 options" title="0"> 
	
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
		
		<div class="add form-group row col-sm-1">
			<img alt="옵션 추가하기" src="/images/plusIcon.png"  style="height: 30px; width: 30px;">	
		</div>
	</div>
	
	<div class="col-sm-12 detail " style="background-color: #d3d3d3;">
		<label class="col-sm-2 col-form-label">추가 세부 사항</label>
			사용안함<input type="radio" class="notDetailUse" name="option" checked>
			사용<input type="radio" class="detailUse" name="option">
		<div class="detailOption" ></div>
	</div>

		<button id="dddd">button2</button>

</div>	
	