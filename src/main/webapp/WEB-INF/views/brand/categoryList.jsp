<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <h2></h2>
    <ul>
    	<c:forEach items="${two}" var="two" varStatus="i">
    		<li><span>-</span><span>${two.groupID}</span>${two.category_detail_NM}</li>
    		
    	</c:forEach>
    </ul>