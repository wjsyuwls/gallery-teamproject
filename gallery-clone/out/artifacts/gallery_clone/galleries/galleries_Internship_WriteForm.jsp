<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/galleries_Frame.css">
<title>Insert title here</title>
<script type="text/javascript">
$(function () {
    $(document).ready(function () {
        $("#Galleries").css("color", "lightgray").on("click", function (event) {
            event.preventDefault();
        });
        $("#galleries_nav_Internship > a").css("color", "lightgray").on("click", function (event) {
            event.preventDefault();
        });
    });
});
</script>
</head>
<body>
	<div id="galleries_Frame">
		<div id="galleries_nav">
			<table>
				<tr>
					<td id="galleries_nav_About"><a href="../galleries/galleries_About.do">About</a></td>
				</tr>
				<tr>
					<td id="galleries_nav_BK_Hannam"><a href="../galleries/galleries_BK_Hannam.do">BK Hannam</a></td>
				</tr>
				<tr>
					<td id="galleries_nav_BK_Itaewon"><a href="../galleries/galleries_BK_Itaewon.do">BK Itaewon</a></td>
				</tr>
				<tr>
					<td id="galleries_nav_Internship"><a href="../galleries/galleries_Internship.do">Internship</a></td>
				</tr>
				<tr>
					<td id="galleries_nav_Contact"><a href="../galleries/galleries_Contact.do">Contact</a></td>
				</tr>
			</table>
		</div>
		
		<div id="galleries_Content">
			<div id="galleries_Content_Title">Gallery BK Hannam</div>
			<div id="galleries_UnderLine"></div>
			
			<div>
				<form action="../galleries/galleries_Internship_Write.do">
					<textarea rows="40em" cols="100em" name="internship_Content" >
						${internship_Content }
					</textarea>
					<input type="submit" value="저장">
				</form>
			</div>
		</div>
	</div>
	

</body>
</html>