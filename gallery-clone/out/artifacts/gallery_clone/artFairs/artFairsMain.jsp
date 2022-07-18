<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/artFairs.css">
<link rel="stylesheet" type="text/css" href="../css/login_button.css">
<script type="text/javascript">
	/* 해당페이지에 들어오게 되면 메뉴 클릭이 비활성화되게 설정 */
	$(document).ready(function () {
	    $("#ArtFairs").css("color", "lightgray").on("click", function (event) {
	        event.preventDefault();
	    });
	});
</script>
</head>
<body>
	<div class="all_main">
		<div class="main_all">
			<c:forEach var="dto" items="${list }">
				<div class="af">
					<a href="artFairsView.do?title=${dto.title}"> 
						<img id="mainimg_src" src="${dto.mainimg_src}">
					</a> <br> 
					<span class="D">${dto.afdate}</span> <br> 
					<span class="T">${dto.title}</span>
				</div>
			</c:forEach>
			
			<c:if test="${memid != null}">
				<div align="center">
					<button type="button" id="button" onclick="location.href='../artFairs/artFairsWriteForm.do'">글 등록</button>
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>