<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   
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
							<input class="form-control" name="optionPrice" type="text" placeholder="Please price">
						</div>
					</div>
					<div class="form-group row col-sm-1" >
						<img alt="" src="/images/plusIcon.png" style="width: 30px; height: 30px;">
					</div>
				</div>
				<div>
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
							<input class="form-control" name="optionPrice" type="text" placeholder="Please price">
						</div>
					</div>
					<div class="form-group row col-sm-1" >
						<img alt="" src="/images/plusIcon.png" style="width: 30px; height: 30px;">
					</div>
				</div>
			</div>
<<<<<<< HEAD
			<div class="addForm"></div>
			
			<div class="col-sm-1 row form-group" >
				<div class="form-control" id="add" >+</div>
			</div>
		</fieldset>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">저장하기</button>
      </div>
    </div>
  </div>
</div>
=======
		</fieldset>
>>>>>>> parent of 5a3fa14 (1)
