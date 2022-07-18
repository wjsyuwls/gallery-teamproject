<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/galleries_Frame.css">
<link rel="stylesheet" type="text/css" href="../css/login_button.css?v=0.1">
<title>Insert title here</title>
<script type="text/javascript">
$(function () {
    $(document).ready(function () {
    	// 상단 menu에 Galleries를 클릭했을경우, 해당 글자 색 변경, 클릭 안되게 설정
    	$("#Galleries").css("color", "lightgray").on("click", function (event) {
            event.preventDefault();
        });
    	// nav쪽에 Internship을 클릭시에 해당 글자 색 변경, 클릭 안되게 설정
        $("#galleries_nav_Internship > a").css("color", "lightgray").on("click", function (event) {
            event.preventDefault();
        });
    });
});
</script>
</head>
<body>
	<div id="galleries_Frame">
		<!-- nav -->
		<div id="galleries_nav">
			<table>
				<tr>
					<td id="galleries_nav_About">
						<a href="../galleries/galleries_About.do">About</a>
					</td>
				</tr>
				<tr>
					<td id="galleries_nav_BK_Hannam">
						<a href="../galleries/galleries_BK_Hannam.do">BK Hannam</a>
					</td>
				</tr>
				<tr>
					<td id="galleries_nav_BK_Itaewon">
						<a href="../galleries/galleries_BK_Itaewon.do">BK Itaewon</a>
					</td>
				</tr>
				<tr>
					<td id="galleries_nav_Internship">
						<a href="../galleries/galleries_Internship.do">Internship</a>
					</td>
				</tr>
				<tr>
					<td id="galleries_nav_Contact">
						<a href="../galleries/galleries_Contact.do">Contact</a>
					</td>
				</tr>
			</table>
		</div>
		
		<!-- About Content -->
		<div id="galleries_Content">
			<!-- Content쪽 상단 Title -->
			<div id="galleries_Content_Title">Internship</div>
			<!-- Content쪽 Title 하단 밑줄 -->
			<div id="galleries_UnderLine"></div>
			<!-- Content -->
			<div id="content">
				
				<!-- Content 내용 -->
				<textarea rows="35em" cols="96em" disabled>
					${internship_Content }
				</textarea>
				
				<div id="galleries_Btn">
				<c:if test="<%=session.getAttribute(\"memid\") != null%>">
					<input type="button" value="글 수정" id="button" onclick="location.href='../galleries/galleries_Internship_WriteForm.do'">
				</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>