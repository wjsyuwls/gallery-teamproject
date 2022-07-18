<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://smtpjs.com/v3/smtp.js"></script>
<script type="text/javascript">
	// 이메일을 보내기 위한 js코드
	window.onload = function() {
		
		Email.send({
			Host : "smtp.gmail.com",
			Username : "dogcat281@gmail.com",	// 해당 주소로 메일이 간다
			Password : "aqhbmasfcxrrhjvf",		// 본인의 gmail 비밀번호		// 본인의 email pwd
			To : "dogcat281@gmail.com",			// 해당 주소로 메일이 간다
			From : "jerry950208@naver.com",		// 보낼사람의 gmail주소
			Subject : "Contact",				// 제목
			Body : `
				이름 : ${dto.name}<br/><br/>
				이메일 : ${dto.email}<br/><br/>
				내용 : ${dto.message}<br/><br/>			
			`
		}).then(
			message => alert(message)
		);
		
		if(${result > 0}) {
			alert("성공");
		} else {
			alert("실패");
		}
		location.href="../galleries/galleries_About.do";
	}

</script>
</head>
<body>
	
</body>
</html>

