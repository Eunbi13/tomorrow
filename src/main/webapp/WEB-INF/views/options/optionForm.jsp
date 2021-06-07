<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   
<fieldset>
			<!-- Modal -->
<div class="modal fade " id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLabel">옵션</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <!-- 시작 -->
	     <ul>
			<li>옵션 명: 옵션의 이름을 정합니다</li>
			<li>옵션 값: 옵션의 값을 정합니다. '/'을 기준으로 입력해주세요</li>
			<li>옵션 가격: 옵션별로 가격을 책정합니다. 아무것도 입력하지 않을 경우 +0원으로 입력됩니다.</li>
		</ul>
        <fieldset>
	        <div class="optionForm">
				<div class="col-sm-11 row">
					<div class="form-group col-md-4">
						<label>옵션명</label>
						<div >
							<input class="form-control kinds" type="text" placeholder="Please kinds">
						</div>
					</div>
					<div class="form-group col-md-8">
						<label>옵션값</label>
						<div >
							<input class="form-control names" type="text" placeholder="Please name">
						</div>
					</div>
					
				</div>
			</div>
			<div class="addForm"></div>
			<div class="col-sm-1 row form-group" >
				<div class="form-control" id="add">+</div>
			</div>
		</fieldset>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="modal">저장하기</button>
      </div>
    </div>
  </div>
</div>
		</fieldset>
