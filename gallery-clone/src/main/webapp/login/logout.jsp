<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/login_button.css">
<link rel="stylesheet" type="text/css" href="../css/login.css">
<script type="text/javascript">
	// <body onload="함수명"> 와 동일함
	window.onload = function() {
		var dialog = document.getElementById("logout_dialog");
		dialog.showModal();
	}
	function close_ok() {
		var dialog = document.getElementById("logout_dialog");
		dialog.close();
		location.href = "../main/index.jsp";
	}
</script>
</head>
<body>
	<div id="div">
		<dialog id="logout_dialog">
			로그아웃 완료<br><br>
			<button type="button" id="button" onclick="close_ok()">확인</button>
		</dialog>
	</div>
</body>
</html>