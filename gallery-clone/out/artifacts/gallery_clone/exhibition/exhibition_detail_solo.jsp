<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/ex_solo.css?v=1.0" rel="stylesheet">
<link href="../lightbox/css/lightbox.css" rel="stylesheet">

<script type="text/javascript" src="../script/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../script/ex_detail.js"></script>
<script src="../lightbox/js/lightbox.js"></script>
<script type="text/javascript">
/* 해당페이지에 들어오게 되면 메뉴 클릭이 비활성화되게 설정 */
	$(document).ready(function () {
	    $("#Exhibitions").css("color", "lightgray").on("click", function (event) {
	        event.preventDefault();
	    });
	});
</script>
</head>
<body>
	<div id="ex_detail_solo_wrapper">
		<div class="artistName">
			<div>${dto.artistName }</div>
		</div>
		<div class="titleDate">
			<div>
				${dto.titleName }
				<br>
				${dto.ex_date }
			</div>
			<div class="menu">
				<a href="#ex_detail_intro">Introduction</a>
				<a href="#ex_detail_works">Works</a>
				<a href="#ex_detail_cv">CV</a>
			</div>
		</div>
		<%--슬라이드 --%>
			<div class="slideshow-container">	
				<div class="mySlideDiv fade active">
					<img alt="메인" src="${img[0]}">
				</div>
				<div class="mySlideDiv fade">
					<img alt="메인" src="${img[1]}">
				</div>
				<div  class="mySlideDiv fade">
					<img alt="메인" src="${img[2]}">
				</div>
				<div class="mySlideDiv fade">
					<img alt="메인" src="${img[3]}">
				</div>	
				<a class="prev" onclick="prevSlide()">&#10094;</a>
				<a class="next" onclick="nextSlide()">&#10095;</a>
			</div>
		<%--슬라이드끝 --%>
		
		<div id="inquiry">
			<div id="inquiry_border"></div>
			<div>Inquiry</div>
		</div>
		
		<%-- Introduction --%>
		<div id="ex_detail_intro">
			<div class="artistName">
				<div>${dto.artistName }</div>
			</div>
			<div class="titleDate">
				<div>
					${dto.titleName }
					<br>
					${dto.ex_date }
				</div>
				<div class="menu1">
					<a href="#ex_detail_intro">Introduction</a>
					<a href="#ex_detail_works">Works</a>
					<a href="#ex_detail_cv">CV</a>
				</div>
			</div>
			<div id="intro_section">
				<div id="intro_img">
					<img alt="" src="${dto.intro_img}">
				</div>
				<div id="intro_content">
					${dto.intro_content }
				</div>
			</div>
		</div>
		
		<%-- Works --%>
		<div id="ex_detail_works">
			<div class="artistName">
				<div>${dto.artistName }</div>
			</div>
			<div class="titleDate">
				<div>
					${dto.titleName }
					<br>
					${dto.ex_date }
				</div>
				<div class="menu2">
					<a href="#ex_detail_intro">Introduction</a>
					<a href="#ex_detail_works">Works</a>
					<a href="#ex_detail_cv">CV</a>
				</div>
			</div>
			<div id="works_img">
				<c:forEach var="i" begin="0" end="${works_img.size()-1}" step="1">
					<!-- light box 플러그인 사용해서 클릭시 부드럽게 새로운창 열리는 기능 -->
					<a href="${works_img[i]}" data-lightbox="roadtrip">
						<img alt="" src="${works_img[i]}">
					</a>	
				</c:forEach>
			</div>
		</div>
		
		<%-- CV --%>
		<div id="ex_detail_cv">
			<div class="artistName">
				<div>${dto.artistName }</div>
			</div>
			<div class="titleDate">
				<div>
					${dto.titleName }
					<br>
					${dto.ex_date }
				</div>
				<div class="menu3">
					<a href="#ex_detail_intro">Introduction</a>
					<a href="#ex_detail_works">Works</a>
					<a href="#ex_detail_cv">CV</a>
				</div>
			</div>
			<div id="cv_section_wrapper">
				<div class="cv_section">
					<div class="cv_title">
						${dto.artistName}​
					</div>
					<div id="cv_section_school">
						${dto.cv_school}
					</div>
				</div>
				<div class="cv_section">
					<div class="cv_title">
						Selected Solo Exhibitions
					</div>
					<div id="cv_section_solo">
					${dto.cv_solo}
					</div>
				</div>
				<div class="cv_section">
					<div class="cv_title">
						Selected Group Exhibitions
					</div>
					<div id="cv_section_group">
						${dto.cv_group}
					</div>
				</div>
				<div class="cv_section">
					<div class="cv_title">
						Award
					</div>
						<div id="cv_section4_award">
							${dto.cv_award}
						</div>
				</div>
				<div class="cv_section">
					<div class="cv_title">
						Collection
					</div>
					<div id="cv_section_collection">
						${dto.cv_collection }
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>