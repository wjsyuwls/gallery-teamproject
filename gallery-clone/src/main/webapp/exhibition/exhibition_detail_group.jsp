<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../lightbox/css/lightbox.css?" rel="stylesheet">
<link href="../css/ex_group.css?v=1" rel="stylesheet">

<script type="text/javascript" src="../script/jquery-3.6.0.min.js"></script>
<script src="../lightbox/js/lightbox.js"></script>
<script type="text/javascript" src="../script/ex_detail.js"></script>
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
   <%--제일위 --%>
   <div id="ex_detail_group_wrapper">
      <div id="ex_detail_top">
            <div class="titleName">
               ${dto.titleName }
            </div>
            <div class="date">
               ${dto.ex_date }
            </div>
            <div class="artistAll">
               <div>${dto.artistName}</div>
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
            <div class="mySlideDiv fade">
               <img alt="메인" src="${img[4]}">
            </div>   
            <a class="prev" onclick="prevSlide()">&#10094;</a>
            <a class="next" onclick="nextSlide()">&#10095;</a>
         </div>
         <div id="inquiry">
            <div id="inquiry_border"></div>
            <div>Inquiry</div>
         </div>
   
   <%-- 중간 소개글 --%>
         <div id="ex_detail_intro">
            <div class="titleName">
               ${dto.titleName }
            </div>
            <div class="date">
               ${dto.ex_date }
            </div>
            <div class="side_wrapper">
               <div class="artistAll">
                  <div>${dto.artistName }</div>
               </div>
               <div class="menu1">
                  <a href="#ex_detail_intro">Introduction</a>
                  <a href="#ex_detail_works">Works</a>
                  <a href="#ex_detail_cv">CV</a>
               </div>
            </div>
         </div>
            <div id="intro_wrapper">
               <div id="intro_img">
                  <img alt="" src="${dto.intro_img}">
               </div>
               <div id="intro_content">
                  ${dto.intro_content }
               </div>
            </div>
      
      <%-- 작업사진들 --%>
         <div id="ex_detail_works">
               <div class="titleName">
                  ${dto.titleName }
               </div>
               <div class="date">
                  ${dto.ex_date }
               </div>
            <div class="side_wrapper">
               <div class="artistAll">
                  <div>${dto.artistName }</div>
               </div>
               <div class="menu2">
                  <a href="#ex_detail_intro">Introduction</a>
                  <a href="#ex_detail_works">Works</a>
                  <a href="#ex_detail_cv">CV</a>
               </div>
            </div>
         </div>
         <div id="work_img_wrapper">
            <c:forEach var="i" begin="0" end="${nameList.size()-1}" step="1">
               <div id="work_img">
                  <div id="artist">${nameList.get(i)}</div>
                  <div id="artist_img">
                  <c:forEach var="j" begin="0" end="${list.get(i).size()-1}" step="1">
                     <c:set var="src" value="${list.get(i).get(j).getGroup_img()}" />
                     <a href="${src}" data-lightbox="roadtrip"><img alt="${src}" src="${src}"></a>
                  </c:forEach>
                  </div>
                  
               </div>
            </c:forEach>
         </div>
      <%-- 경력 --%>   
      <div id="ex_detail_cv">
         
         <div class="titleDate">
            <div class="titleName">
               ${dto.titleName }
            </div>
            <div class="date">
               ${dto.ex_date }
            </div>
            <div class="side_wrapper">
               <div class="artistAll">
                  <div>${dto.artistName }</div>
               </div>
               <div class="menu3">
                  <a href="#ex_detail_intro">Introduction</a>
                  <a href="#ex_detail_works">Works</a>
                  <a href="#ex_detail_cv">CV</a>
               </div>
            </div>
         </div>
            <div id="cv_info_wrapper">
               <div>
                  <c:forEach var="i" begin="0" end="${list.size()-1}" step="1">
                     <a href="../artist/artist_info.do?artist=${nameList.get(i)}">
                        <div class="cv_info">
                           <img alt="" src="${list.get(i).get(0).getGroup_img()}" class="cv_info_img">
                           <div class="cv_info_name">${nameList.get(i)}</div>
                        </div>
                     </a>
                  </c:forEach>
               </div>
            </div>
         </div>
      </div>
      <%--테스트용 --%>
      
      <%--테스트용 --%>
</body>
</html>