<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	/* 해당페이지에 들어오게 되면 메뉴 클릭이 비활성화되게 설정 */
	$(document).ready(function() {
		$("#ArtFairs").css("color", "lightgray").on("click", function(event) {
			event.preventDefault();
		});
	});
</script>
<style type="text/css">
.div{
	padding-top: 150px;
	padding-bottom: 150px;
	width: 100%;
	height: 80%;
	font-family: Arial,Helvetica,sans-serif;
}
td>input{
	width: 98%;
	background-color:transparent;
	border: none;
}
table{
	border: none;
	width: 17%;
	border-spacing: 20px;
}
td{
	border-bottom: 1px solid black;
}
.button{
	text-align: center;
}
#button{
	width: 100px;
	height: 30px;
	border-radius: 10px;
	background-color: black;
	color: white;
	box-shadow: 3px 3px 3px rgba(0,0,0,0.8);
	cursor: pointer;
	border: none;
}
#button:active {
	box-shadow: 1px 1px 1px rgba(0,0,0,0.7);
	position: relative;
	top: 2px;
	left: 2px;
}
</style>
</head>
<body>
	<div class="div">
		<form action="logIn.do" method="post">
			<table align="center">
				<tr>
					<td width="25%">ID</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="text" name="pw"></td>
				</tr>
			</table>
			<div class="button">
				<button type="submit" id="button">로그인</button> 
				<button type="button" id="button" onclick="location.href='join.do'">회원가입</button>
			</div>
		</form>
	</div>
</body>
</html>