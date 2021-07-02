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
        <div class="title">옵션 추가 하기</div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <!-- 시작 -->
	    <ul>
			<li>옵션 명: 옵션의 이름을 정합니다</li>
			<li>옵션 값: 옵션의 값을 정합니다. '/'을 기준으로 입력해주세요</li>
		</ul>
        <fieldset>
        	<div class="addForm">
				<div class="optionForm ">
						<div class="form-group ">
							<label class="form-label-op">옵션명</label>
							<input class="form-control form-control-op kinds" name="op" type="text" placeholder="컬러">
						</div>
						<div class="form-group ">
							<label class="form-label-op">옵션값</label>
							<input class="form-control form-control-op names" name="op" type="text" placeholder="블랙/화이트/레드/블루">
						</div>
						<hr>
				</div>
			</div>
			<div class="btn-outline btn-outline-op" id="add">추가</div>
			
		</fieldset>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="modal">저장하기</button>
      </div>
    </div>
  </div>
</div>
		</fieldset>
