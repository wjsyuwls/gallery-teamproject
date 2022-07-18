<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/login_button.css">
<link rel="stylesheet" type="text/css" href="../css/artFairs.css">
<script type="text/javascript">
	window.onload = function(){
		var dialog = document.getElementById("delete_dialog");
		dialog.showModal();
	}
	function close_ok() {
		var dialog = document.getElementById("delete_dialog");
		dialog.close();
		location.href="../artFairs/artFairsDelete.do?title=${title}";
	}
	function close_cancel() {
		var dialog = document.getElementById("delete_dialog");
		dialog.close();
		location.href = "../artFairs/artFairsView.do?title=${title}";
	}
</script>
</head>
<body>
<div id="div">
	<dialog id="delete_dialog">		
		해당 글을 삭제하시겠습니까?
		<input type="hidden" value="${title}"> <br><br>
			<button type="button" id="button" onclick="close_ok()">삭제</button>
			<button type="button" id="button" onclick="close_cancel()">취소</button>
	</dialog>
</div>
</body>
</html>