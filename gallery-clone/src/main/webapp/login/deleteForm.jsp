<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/login_button.css">
<link rel="stylesheet" type="text/css" href="../css/login.css">
<script type="text/javascript" src="../script/loginScript.js"></script>
<script type="text/javascript">
	window.onload = function(){
		var dialog = document.getElementById("delete_dialog");
		dialog.showModal();
	}
	function close_ok() {
		var dialog = document.getElementById("delete_dialog");
		dialog.close();
		location.href="../login/delete.do?memid=${memid}";
	}
	function close_cancel() {
		var dialog = document.getElementById("delete_dialog");
		dialog.close();
		location.href = "../main/index.jsp";
	}
</script>
</head>
<body>
<div id="div">
   <dialog id="delete_dialog">      
      ${message }<br><br>
      <input type="hidden" value="${memid }">
      <c:if test="${message == '탈퇴하시겠습니까?'}">
         <button type="button" id="button" onclick="close_ok()">탈퇴</button>
         <button type="button" id="button" onclick="close_cancel()">취소</button>
      </c:if>
      
      <c:if test="${message != '탈퇴하시겠습니까?'}">
         <button type="button" id="button" onclick="history.back()">뒤로</button>
      </c:if>
   </dialog>
</div>
</body>
</html>