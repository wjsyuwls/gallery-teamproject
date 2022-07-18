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
	window.onload = function(){
		var dialog = document.getElementById("write_dialog");
		dialog.showModal();
	}
	function close_ok() {
		var dialog = document.getElementById("write_dialog");
		dialog.close();
		location.href = "../artFairs/artFairsMain.do";
	}
</script>
</head>
<body>
<div id="div">
	<dialog id="write_dialog">		
		<c:if test="${result > 0 }">
			저장 완료<br><br>
			<button type="button" id="button" onclick="close_ok()">확인</button>
		</c:if>
		<c:if test="${result == 0}">
			저장 실패<br><br>
			<button type="button" id="button" onclick="history.back()">뒤로</button>
		</c:if>
	</dialog>
</div>
</body>
</html>