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
    	// 상단 menu에 Galleries를 클릭했을경우, 해당 글자 색 변경, 클릭 안되게 설정
        $("#Galleries").css("color", "lightgray").on("click", function (event) {
            event.preventDefault();
        });
     	// nav쪽에 BK_Itaewon을 클릭시에 해당 글자 색 변경, 클릭 안되게 설정
        $("#galleries_nav_BK_Itaewon > a").css("color", "lightgray").on("click", function (event) {
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
		
		<!-- BK_Itaewon  Content -->
		<div id="galleries_Content">
			<!-- Content쪽 상단 Title -->
			<div id="galleries_Content_Title">Gallery BK Hannam</div>
			<!-- Content쪽 Title 하단 밑줄 -->
			<div id="galleries_UnderLine"></div>
			
			<!-- Content -->
			<div>
				<!-- BK_Iteawon의 이미지 삽입 -->
				<img alt="BK_Itaewon" src="../image/bk_Itaewon.jpg" id="BK_img">
				&emsp;&emsp;
				<!-- BK_Itaewon 지도 가져오기 -->
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3163.7694829864167!2d126.99909981564653!3d37.53693087980354!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca3b3cbd300e3%3A0xec6d1acbde0d6081!2z7ISc7Jq47Yq567OE7IucIOyaqeyCsOq1rCDsnbTtg5zsm5DroZw0Muq4uCA1Ng!5e0!3m2!1sko!2skr!4v1649426930111!5m2!1sko!2skr" 
					width="250px" height="332px" style="border:0;" 
					allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
				</iframe>
			</div>
			
			<div>
				<table id="BK_Info">
					<tr>
						<td>OPENING HOURS</td>
						<td>ADDRESS</td>
						<td rowspan="3">
							For general inquires,<br>
							please email info@gallerybk.co.kr test
						</td>
					</tr>
					
					<tr>
						<td>
							Tuesday to Sunday: 11am - 7pm <br>(Closed on Mondays)
						</td>
						<td>
							56, Itaewon-ro 42-gil, <br>Yongsan-gu, Seoul, Korea
						</td>
					</tr>
					
					<tr>
						<td>
							*Lunch Break: 1pm - 2pm
						</td>
					</tr>
				</table>
				
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