<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME | GalleryBK</title>
<link rel="stylesheet" type="text/css" href="../css/home_Frame.css?v=0.4">
<script type="text/javascript">
	/* 해당페이지에 들어오게 되면 메뉴 클릭이 비활성화되게 설정 */
	$(document).ready(function () {
	    $("#HOME").css("color", "lightgray").on("click", function (event) {	// id가 HOME인 태그의 색 : 밝은 갈색, 클릭 이벤트 비활성화
	        event.preventDefault();
	    });
	});
</script>
<style type="text/css">
.reservation_Sector {
   position: relative;
   animation: fadeInLeft 2s;
}
@keyframes fadeInLeft {
   0% {
       opacity: 0;
       transform: translate3d(-100%, 0, 0);
}
to {
       opacity: 1;
       transform: translateZ(0);
}
</style>
</head>
<body>

	<!-- 전체 프레임 -->
	<div id="home_Frame">
		<!-- 예약 구역 시작 -->
		<div id="reservation_Sector" class="reservation_Sector">
			<div id="reservation_float">
				<p>
					<a href="#"> <img alt="" src="../image/ex1.png" width="300px"
						height="410px">
					</a>
				</p>

				<p>
					<a id="exhibition_Title"> Re, Vitality </a>
				</p>

				<p id="exhibition_Artist">이길래 개인전</p>
				<p id="exhibition_Date">2022.03.10 - 04.07</p>
				<p id="exhibition_Floor">BK itaewon B1-3F</p>
				<br>
				<br> <input type="button" value="예약하기" id="reservation_Btn" onclick="location.href='../booking/booking_1.do'">
			</div>
			<div id="reservation_float">
				<p>
					<a href="#"> <img alt="" src="../image/ex2.png" width="300px"
						height="410px">
					</a>
				</p>

				<p>
					<a id="exhibition_Title"> Restoration of Relationships </a>
				</p>

				<p id="exhibition_Artist">박윤경 개인전</p>
				<p id="exhibition_Date">2022.03.11 - 04.08</p>
				<p id="exhibition_Floor">BK Hannam 1F</p>
				<br>
				<br> <input type="button" value="예약하기" id="reservation_Btn" onclick="location.href='../booking/booking_1.do'">
			</div>
			<div id="reservation_float">
				<p>
					<a href="#"> <img alt="" src="../image/ex3.png" width="300px"
						height="410px">
					</a>
				</p>

				<p>
					<a id="exhibition_Title"> Borderless Universe </a>
				</p>

				<p id="exhibition_Artist">강주리 김병주 박선기 정해윤</p>
				<p id="exhibition_Date">2022.03.17 - 04.14</p>
				<p id="exhibition_Floor">BK Hannam 2-3F</p>
				<br>
				<br> <input type="button" value="예약하기" id="reservation_Btn" onclick="location.href='../booking/booking_1.do'">
			</div>


			<div id="exhibition_location">
				<table>
					<tr>
						<td>BK Hannam: 서울 용산구 대사관로 25</td>
					</tr>
					<tr>
						<td>BK Itaewon: 서울 용산구 이태원로 42길 56</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- 예약 구역 종료 -->

		<!-- 지난 전시회 나열 시작 -->
		<div id="home_pastEx">
			<div id="pastEx_Frame" class="reservation_Sector">
				<p id="pastEx_Title">Past Exhibitions</p>
				<div class="pastEx_content">
				
					<c:forEach var="exhibition" begin="0" end="5" step="1" items="${list_2220}"><!-- 지난 전시회를 list로 가져와서 상위 6개만 보여줌 -->
						<div class="pastEx_incontent">
							<a href="../exhibition/exhibitionDetail.do?seq=${exhibition.seq}">	<!-- 사진 클릭시 해당 exhibition으로 이동 -->
								<img src="${exhibition.ex_img}" class="pastEx_img">				<!-- 지난 전시회 사진 -->
							</a>
							<div class="pastEx_titleName">${exhibition.ex_titleName }</div>		<!-- 지난 전시회 타이틀 이름 -->
							<div class="pastEx_artistName">${exhibition.ex_artistName }</div>	<!-- 지난 전시회 아티스트 이름 -->
							<div class="pastEx_artistName">${exhibition.ex_date}</div>			<!-- 지난 전시회 날짜 -->
						</div>
					</c:forEach>
				</div>
				<a href="../exhibition/exhibition.do">						<!-- see_more 클릭시 Exhibition으로 이동 -->
					<img alt="see more" src="../image/see_moreJPG.JPG">		<!-- see_more 이미지 -->
				</a>
			</div>
		</div>
		<!-- 지난 전시회 나열 종료 -->
		
		
	</div>
</body>
</html>