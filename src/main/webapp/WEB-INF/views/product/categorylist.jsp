<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- PRODUCT LIST //// STORE -->
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

</style>
<c:import url="../template/bootStrap.jsp"></c:import>
<meta charset="UTF-8">
<title>category list</title>
<style type="text/css">
ul ul{display:none;}
ul li:hover > ul {display:block;}	
</style>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
<main>

<div class='zeta-menu-bar'>
  <ul class="zeta-menu">

    <li><a href="대분류">가구</a> <!-- 대 -->
      <ul> <!-- 중 -->
        <li><a href="중분류">소파/거실가구</a></li> 
        <li><a href="#2B">침실가구</a>
          <ul> <!-- 소 -->
            <li><a href="소분류">침대</a></li>  
            <li><a href="#2B2">매트리스</a></li>
            <li><a href="#2B3">서랍장</a></li>
            <li><a href="#2B4">협탁</a></li>
          </ul> <!-- 소 -->
        </li>
      </ul>  <!-- 중 -->
    </li>
  </ul>
</div>
	
</main>

<c:import url="../template/footer.jsp"></c:import>
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
$(function(){
	$(document).mouseup(function(e) {
		if ($(e.target).parents('.zeta-menu').length == 0) {
			$('.zeta-menu li').removeClass('expand');
			$('.zeta-menu ul').hide();
		}
	});
	$(".zeta-menu>li:has(ul)>a").each( function() {
		$(this).html( $(this).html()+' &or;' );
	});
	$(".zeta-menu ul li:has(ul)")
		.find("a:first")
		.append("<p style='float:right;margin:-3px'>&#9656;</p>");

	$(".zeta-menu li>a").click(function(){
		var li = $(this).parent();
		var ul = li.parent()
		ul.find('li').removeClass('expand');
		ul.find('ul').not(li.find('ul')).hide();
		li.children('ul').toggle();
		if( li.children('ul').is(':visible') || li.has('ul')) {
			li.addClass('expand');
		}
	});
});
</script>

<script type="text/javascript" src="/js/productSet.js"></script>
</body>
</html>