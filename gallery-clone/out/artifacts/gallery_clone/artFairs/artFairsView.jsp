<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../script/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/artFairs.css">
<link rel="stylesheet" type="text/css" href="../css/login_button.css">
<link rel="stylesheet" media="screen" href="../css/artFairsView.css">
<script type="text/javascript">

$(document).ready(function () {
	/* 해당페이지에 들어오게 되면 메뉴 클릭이 비활성화되게 설정 */
    $("#ArtFairs").css("color", "lightgray").on("click", function (event) {
        event.preventDefault();
    });
    
    var imgs;
	var img_count;			//이미지 갯수
	var img_position = 1;	//이미지 넘버링
	
	var pageNumber = 1;		//페이지 넘버링

	imgs = $(".slide ul");
	img_count = imgs.children().length;

	//버튼을 클릭했을 때 함수 실행
	$('#back').click(function() {
		back();
	});
	$('#next').click(function() {
		next();
	});

	function back() {
		if (1 < img_position) {
			imgs.animate({
				left : '+=600px'	//우로 밀기
			});				
			img_position--;			//이미지 넘버링 재설정
		}
		pageNumber--;				//페이지 넘버링 재설정
		if(pageNumber < 1) {		//페이지넘버가 이미지갯수보다 작지않게
			pageNumber = 1;
		}
		$('input[name=bar]').attr('value', pageNumber + "/" + img_count);
	}
	
	function next() {
		if (img_count > img_position) {
			imgs.animate({
				left : '-=600px'	//좌로 밀기
			});
			img_position++;			//이미지 넘버링 재설정
		}
		pageNumber++;				//페이지 넘버링 재설정
		if(pageNumber > img_count) {//페이지넘버가 이미지갯수보다 크지않게
			pageNumber = img_count;
		}
		$('input[name=bar]').attr('value', pageNumber + "/" + img_count);
	}
});
</script>
</head>
<body>
	<div id="view_all">
		<div id="view_nav">
			<div id="view_tb1">
				<div>
					<div>
						<span class="sp1">${dto.title}</span>
					</div>
					<div>
						<span class="sp2">${dto.info_date}</span><br> 
						<span class="sp2">${dto.info}</span>
					</div>
				</div>
			</div>
		</div>
		<div id="view_section">
			<div class="slide">
				<button class="button" id="back"></button>
				<ul>
					<!-- cnt 값에 따라 사진 갯수 조정 -->
					<c:if test="${cnt == 0 }">
						<li><img src="${dto.detailimg_src}" width="550px" height="340px"></li>
					</c:if>
					<c:if test="${cnt == 1 }">
						<li><img src="${dto.detailimg_src}" width="550px" height="340px"></li>
						<li><img src="${dto.img_src1}" width="600px" height="340px"></li>
					</c:if>
					<c:if test="${cnt == 2 }">
						<li><img src="${dto.detailimg_src}" width="550px" height="340px"></li>
						<li><img src="${dto.img_src1}" width="600px" height="340px"></li>
						<li><img src="${dto.img_src2}" width="600px" height="340px"></li>
					</c:if>
					<c:if test="${cnt == 3 }">
						<li><img src="${dto.detailimg_src}" width="550px" height="340px"></li>
						<li><img src="${dto.img_src1}" width="600px" height="340px"></li>
						<li><img src="${dto.img_src2}" width="600px" height="340px"></li>
						<li><img src="${dto.img_src3}" width="600px" height="340px"></li>
					</c:if>
				</ul>
				<button class="button" id="next"></button>
				<!-- 슬라이드 이미지 위에 페이징처리 하기 -->
				<div class="bar">
					<input type="text" name="bar" class="bar_num" value="1/${cnt+1 }" readonly/>
				</div>	
			</div>
		</div>
		<div id="view_aside">
			<div id="view_tb2">
				<div>
					<span class="sp3">${dto.place}</span>
				</div>
				<div>
					<span class="sp4">${dto.place_detail}</span>
				</div>
				<div class="sp3">&nbsp;</div>
				<div>
					<span class="sp3">${dto.artists }</span>
				</div>
				<div>
					<span class="sp4">${dto.artist_name}</span>
				</div>
			</div>
		</div>

		<div id="view_footer">
			<c:if test="${memid != null}">
				<button type="button" id="button" onclick="location.href='artFairsModifyForm.do?title=${dto.title}'">
					글 수정 
				</button>
				<button type="button" id="button" onclick="location.href='artFairsDeleteForm.do?title=${dto.title}'">
					글 삭제
				</button>
			</c:if>
		</div>
	</div>
</body>
</html>