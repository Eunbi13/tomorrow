<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- <ul class="list-group list-group-flush">
  <li class="list-group-item"> -->
	<table class="table table-hover">
		<c:forEach items="${list}" var="reply">
			<tr>
				<td>${reply.username}</td>
				<td>${reply.comment}</td>
				<td>${reply.regDate}</td>
				<td><input type="checkbox" class="del" value="${reply.commentNum}"></td>
			</tr>
		</c:forEach>
	</table>
<!--   </li>
</ul> -->


<button type="button" class="btn btn-danger" id="remove">Delete</button>

