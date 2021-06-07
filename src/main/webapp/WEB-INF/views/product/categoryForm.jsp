<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-12"> 
				<div class="form-group row"><!-- 클릭하면 ajax로 중부류, 소분류 불러오기 -->
					<div class="col-sm-12">
						<label class="col-sm-2 col-form-label">${detail}</label>
						<c:forEach items="${category}" var="vo">
						<div class=" form-check form-check-inline ">
							<input class="form-check-input ch2" type="checkbox" value="${vo.categoryID}">
							<label class="form-check-label" for="inlineCheckbox1">${vo.category_detail_NM }</label>
						</div>
						</c:forEach>
					</div>
				</div>
			</div>