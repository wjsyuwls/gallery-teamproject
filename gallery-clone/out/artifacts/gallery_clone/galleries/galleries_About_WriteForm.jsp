<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/galleries_Frame.css">
<script type="text/javascript">
$(function () {
    $(document).ready(function () {
    	/* 해당페이지에 들어오게 되면 메뉴 클릭이 비활성화되게 설정 */
        $("#Galleries").css("color", "lightgray").on("click", function (event) {
            event.preventDefault();
        });
        /* nav쪽에 About을 클릭시에 해당 글자 색 변경, 클릭 안되게 설정 */
        $("#galleries_nav_About > a").css("color", "lightgray").on("click", function (event) {
            event.preventDefault();
        });
    });
});
</script>
</head>
<body>
	<div id="galleries_Frame">
		<!-- 좌측 nav -->
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
		
		<!-- About Content -->
		<div id="galleries_Content">
			<!-- Content쪽 상단 Title -->
			<div id="galleries_Content_Title">About</div>
			<!-- Content쪽 Title 하단 밑줄 -->
			<div id="galleries_UnderLine"></div>
			<!-- Content -->
			<div id="content">
				<!-- 버튼 클릭시 galleries_About_Write로 이동 -->
				<form action="../galleries/galleries_About_Write.do">
						<!-- 수정 내용 입력할 textarea -->
						<textarea rows="40em" cols="90em" name="about_Content">
							${about_Content }
						</textarea>
					<input type="submit" value="저장">
				</form>
			</div>
		</div>
	</div>
</body>
</html>