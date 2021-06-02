<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   

	<div class="col-sm-12 options" > 
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">옵션 종류</label>
			<div class="col-sm-10">
				<input class="form-control" name="optionKinds" type="text" placeholder="Please kinds">
			</div>
		</div>
		<div class="form-group row col-sm-6">
			<label class="col-sm-3 col-form-label">옵션별 이름</label>
			<div >
				<input class="form-control" name="optionName" type="text" placeholder="Please name">
			</div>
		</div>
		<div class="form-group row col-sm-6">
			<label class="col-sm-3 col-form-label">옵션별 가격</label>
			<div >
				<input class="form-control" name="optionPrice" type="number" placeholder="Please price">
			</div>
		</div>
	</div>
	<div id="add">추가하기</div>
	<div class="col-sm-12">
	<label class="col-sm-2 col-form-label">옵션 세부 사항 설정</label>
			사용안함<input type="radio" class="notDetailUse" name="option" checked>
			사용<input type="radio" class="detailUse" name="option">
			<div id="option"></div>
		</div>
	
		<button>button2</button>

	