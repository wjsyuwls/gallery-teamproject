<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/login_button.css">
<link rel="stylesheet" type="text/css" href="../css/login.css">
<script type="text/javascript">	
	window.onload = function(){
		var dialog = document.getElementById("login_dialog");
		dialog.showModal();
	}
	function close_ok() {
		var dialog = document.getElementById("login_dialog");
		dialog.close();
		location.href = "../main/index.jsp";
	}
</script>
</head>
<body>
<div id="div">
   <dialog id="login_dialog">      
      ${message }<br><br>
      <c:if test="${message == '로그인 성공' }">
         <button type="button" id="button" onclick="close_ok()">메인으로</button>
      </c:if>
      <c:if test="${message != '로그인 성공' }">
         <button type="button" id="button" onclick="close_ok()">메인으로</button>
      </c:if>
   </dialog>
</div>
</body>
</html>