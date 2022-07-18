<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/login_button.css">
<link rel="stylesheet" type="text/css" href="../css/login.css">
<script type="text/javascript" src="../script/loginScript.js"></script>
 
<script type="text/javascript">
	/* 해당페이지에 들어오게 되면 메뉴 클릭이 비활성화되게 설정 */
	$(document).ready(function() {
		$("#ArtFairs").css("color", "lightgray").on("click", function(event) {
			event.preventDefault();
		});
	});
</script>
</head>
<body>
	<div class="div">
		<form action="../login/logIn.do" method="post" name="loginForm">
			<table align="center" id="login_Form_table">
				<tr>
					<td class="td" width="25%">ID</td>
					<td class="td"><input class="input" type="text" name="memid"></td>
				</tr>
				<tr>
					<td class="td">Password</td>
					<td class="td"><input class="input" type="password" name="pw"></td>
				</tr>
				
				<!-- 
					회원탈퇴를 여기다가 만들자
					confirm 으로 다시한번확인한후 확인 클릭시 탈퇴
				 -->
			</table>
			<div class="button">
				<button type="submit" id="button" onclick="checkLogin();">로그인</button> 
				<button type="button" id="button" onclick="location.href='../login/joinForm.do'">회원가입</button>
				<button type="submit" id="button" formaction="../login/deleteForm.do">회원탈퇴</button>
			</div>
		</form>
	</div>
</body>
</html>