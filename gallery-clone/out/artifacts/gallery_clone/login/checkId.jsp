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
	function checkIdClose() {
		// opener : 자바스크립트 내장 객체, 부모 브라우저를 관리하는 객체
		opener.frm.memid.value = "${memid }";
		window.close();
		opener.frm.pw.focus();
	}
	
	function checkId() {
		if(!document.frm.memid.value) {
			alert("아이디를 입력하세요.");
			document.frm.memid.focus();
		} else {
			document.frm.submit();
		}
	}
</script>
</head>
<body>
<div id="div">
	<form action="checkId.do" method="post" name="frm">
		<c:if test="${exist }">
			${memid }는 사용중입니다.<br><br>
			아이디 <input type="text" name="memid" required="required">
			<button type="button" id="button" onclick="checkId()">중복체크</button>
		</c:if>
		<c:if test="${!(exist) }">
			${memid }는 사용가능합니다.<br><br>
			<button type="button" id="button" onclick="checkIdClose()">사용</button>
		</c:if>	
	</form>
</div>
</body>
</html>