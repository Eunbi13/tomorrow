<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* flex-item / 4개씩 정렬 */
.item-container{
	display: flex;
	justify-content: space-around;
	flex-flow: wrap;
}
.store-list-item-card{
	margin-right: 5px;
	flex-basis: 25%;
	height: auto;
	display: flex;
 	flex-direction: column;
}
.item-img{
	max-width:100%;
	max-height:100%;
	flex: auto;
}

</style>
</head>
<body>
<main>
	<div class="dropdown">
        <button onclick="dp_menu()" class="button">Drop</button>
        <div style="display: none;" id="drop-content">
            <a hreaf='#'>Menu1</a>
            <a hreaf='#'>Menu2</a>
            <a hreaf='#'>Menu3</a>
            <a hreaf='#'>Menu4</a>
            <a hreaf='#'>Menu5</a>
        </div>
    </div>
 
    <script>
        function dp_menu(){
            let click = document.getElementById("drop-content");
            if(click.style.display === "none"){
                click.style.display = "block";
 
            }else{
                click.style.display = "none";
 
            }
        }
    </script>
</main>
</body>
</html>