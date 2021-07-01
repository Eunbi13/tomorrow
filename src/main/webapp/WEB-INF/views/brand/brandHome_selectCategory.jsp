<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<c:forEach items="${twoCategory}" var="two" varStatus="i">
	<dt class="two" title="${two.categoryID}" >
		${two.category_detail_NM}
	</dt>
</c:forEach>