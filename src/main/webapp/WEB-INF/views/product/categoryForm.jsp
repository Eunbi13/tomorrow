<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class=""> 
				<div class="form-group "><!-- 클릭하면 ajax로 중부류, 소분류 불러오기 -->
					<div  class="form-box" >
						<label class=" form-label">선택 <span>*</span></label>
						<div>
							<c:forEach items="${category}" var="vo">
							<div class=" form-check-inline ">
								<input class="form-check-input ch2" name="two" type="checkbox" value="${vo.categoryID}">
								<label class="form-check-label" for="inlineCheckbox1">${vo.category_detail_NM }</label>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>