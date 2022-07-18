<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GalleryBK</title>
<link rel="stylesheet" type="text/css" href="../css/index_Frame.css?v=0.1">
<script type="text/javascript" src="../script/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../script/index_animation.js"></script>
<script type="text/javascript">

	// 우측 하단 top으로 가는 버튼
	$(function() {
	    $("#moveTop").click(function() {
	        $('html, body').animate({
	            scrollTop : 0
	           }, 400);
	        return false;
	    });
	});
	
	// 하단 로고를 연타해서 클릭할경우 로그인창 출력
	$(function() {
		var click = 0;		// 클릭횟수 저장
		$('#login_img').click(function() {
			login();
		});
		
		function login() {
			click++;				// 클릭을 했을경우 1씩 증가
			if(click / 5 >= 1) {	// 5번 이상 클릭을 했을경우
				if(<%=session.getAttribute("memid") == null%>){		// 세션값의 memid가 null일경우 로그인 창
					location.href="../login/logInForm.do";
				} 
				if(<%=session.getAttribute("memid") != null%>) {	// 세션값이 memid가 null이 아닐경우 로그아웃 창
					location.href="../login/logout.do";
				}
			}
		}
	});
</script>
</head>
<!-- 해당 페이지는 인덱스 페이지로  -->
<body>
	<div id="frame" style="height: auto;">
		
		<!-- header : 로고 및 메뉴  -->
		<div id="header">
			<a href="../main/index.jsp"><img alt="메인" src="../image/logo.png" width="200" height="70"></a>
			<!-- nav역할 -->
			<div id="menu">
				<a href="../main/welcome.jsp" id="HOME">HOME</a>&emsp;
				<a href="../artist/artist.do" id="Artists">Artists</a>&emsp;
				<a href="../exhibition/exhibition.do" id="Exhibitions">Exhibitions</a>&emsp;
				<a href="../artFairs/artFairsMain.do" id="ArtFairs">Art Fairs</a>&emsp;
				<a href="../galleries/galleries_About.do" id="Galleries">Galleries</a>&emsp;
			</div>
		</div>
		
		<!-- Section : Content -->
		<div id="section">
			<c:if test="${ref==null}">
				<jsp:include page="../main/welcome.jsp"/>
			</c:if>
			<c:if test="${ref!=null}">
				<jsp:include page="${ref}"/>
			</c:if>
		</div>
		
		<!-- footer -->
		<div id="footer">
			<div id="f_image">
				<span><a><img id="login_img" alt="main" src="../image/logo.png" width="150px;"></a></span>
			</div>
			
			<div id="f_info">
				<table>
					<tr>
						<td>BK Hannam : 25, Daesagwan-ro, Yongsan-gu, Seoul, Korea</td>
						<td>02 790 7079</td>
						<td>
							<a href="https://www.facebook.com/gallerybk">
								<img alt="페북" src="../image/f.png">
							</a>
							<a href="https://www.instagram.com/accounts/login/?next=/gallerybk/">
								<img alt="인스타" src="../image/insta.png">
							</a>
						</td>
					</tr>
					
					<tr>
						<td>BK Itaewon : 56, Itaewon-ro 42-gil, Yongsan-gu, Seoul, Korea</td>
						<td>info@gallerybk.co.kr</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- 클릭시 최상단으로 올라가는 버튼 -->
		 <a href="#" id="moveTop">
		 	<img alt="top button" src="../image/topBtn.png" id="MOVE_TOP_BTN">
		 </a>
		
	</div>
</body>
</html>