<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!-- <ul class="list-group list-group-flush">
  <li class="list-group-item"> -->
	<table class="table table-hover">
		<c:forEach items="${list}" var="reply">
			<tr>
				<td>${reply.username}</td>
				<td>${reply.comment}</td>
				
				<td>
					<sec:authentication property="principal" var="pinfo" />
					<c:if test="${pinfo.username eq reply.username}">
						<button type="button" class="btn btn-default remove" id="remove" value="${reply.hwReplyNum}">Delete</button>
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
<!--   </li>
</ul> -->


 

