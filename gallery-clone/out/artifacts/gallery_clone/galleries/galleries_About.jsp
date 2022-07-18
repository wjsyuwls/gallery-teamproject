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
			<div id="galleries_Content_Title">About</div>
			<!-- Content쪽 Title 하단 밑줄 -->
			<div id="galleries_UnderLine"></div>
			<!-- Content -->
			<div id="content">
				<div>
					<!-- About Content 내용 -->
					<pre>
						${about_Content }
					</pre>
					<div id="galleries_Btn">
					<!-- 세션의 memid값이 null이 아니면 "글수정" 버튼이 보이게 되고 클릭시 글수정 화면으로 이동 -->
					<c:if test="<%=session.getAttribute(\"memid\") != null%>">
						<input type="button" value="글 수정"  id="button" onclick="location.href='../galleries/galleries_About_WriteForm.do'">
					</c:if>
					</div>
				</div>
				
				<!-- Contact Form : 정보 입력시 contact_write를 통해 메일로 전송됨 -->
				<form action="../galleries/contact_write.do" id="table_Frame" name="contact_Form">
					<table id="contact_Table">
						<tr>
							<td colspan="2" id="table_label">
								<label>CONTACT</label>
							</td>
						</tr>
						
						<tr>
							<td id="table_input">
								<!-- required : 해당 속성으로 입력검사를 해줄수 있음 -->
								<!-- 이름 입력 -->
								<input type="text" id="name" name="contact_Name" placeholder="Name" required="required">
							</td>
							<td>
								<!-- 이메일 입력 -->
								<input type="email" id="email" name="contact_Email" placeholder="Email" required="required">
							</td>
						</tr>
						<tr>
							<td colspan="2" id="table_textarea">
								<!-- 메시지 입력 -->
								<textarea rows="8em" cols="100em" id="message" name="contact_Message" placeholder="Message" required="required"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" id="table_submit">
								<input type="submit" value="submit" id="submit_Btn">
							</td>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>