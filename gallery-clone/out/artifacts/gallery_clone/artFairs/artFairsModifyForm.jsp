<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/artFairs.css">
<link rel="stylesheet" type="text/css" href="../css/login_button.css">
<script type="text/javascript">
	/* 해당페이지에 들어오게 되면 메뉴 클릭이 비활성화되게 설정 */
	$(document).ready(function() {
		$("#ArtFairs").css("color", "lightgray").on("click", function(event) {
			event.preventDefault();
		});
	});
</script>
</head>
<body>
	<div class="div"  style="text-align: center; margin-top: 3em;">
		<form action="artFairsModify.do" method="post" enctype="multipart/form-data">
			<input type="hidden" value="${dto.title }" name="ori_title">
			<table align="center" id="table">
				<tr>
					<td class="td" width="20%">Fair Title</td>
					<td class="td">
						<input class="input" type="text" name="title" value="${dto.title }" required="required">
					</td>
				</tr>
				<tr>
					<td class="td">Fair Date</td>
					<td class="td">
						<input class="input" type="text" name="afdate" value="${dto.afdate }" required="required">
					</td>
				</tr>
				<tr>
					<td class="td">Fair Detail Date</td>
					<td class="td">
						<input class="input" type="text" name="info_date" value="${dto.info_date }" required="required">
					</td>
				</tr>
				<tr>
					<td class="td">Fair Info</td>
					<td class="td">
						<input class="input" type="text" name="info" value="${dto.info }" required="required">
					</td>
				</tr>
				<tr>
					<td class="td">Fair Place</td>
					<td class="td">
						<input class="input" type="text" name="place" value="${dto.place }" required="required">
					</td>
				</tr>
				<tr>
					<td class="td">Fair BoothNumber</td>
					<td class="td">
						<input class="input" type="text" name="place_detail" value="${dto.place_detail }" required="required">
					</td>
				</tr>
				<tr>
					<td class="td">Gallery</td>
					<td class="td">
						<input class="input" type="text" name="artists" value="GALLERY BK" readonly />
					</td>
				</tr>
				<tr>
					<td class="td">Artists</td>
					<td class="td">
						<pre><textarea id="textA" name="artist_name" rows="14" required="required">${dto.artist_name }</textarea></pre>
					</td>
				</tr>
				<tr>
					<td class="td">Fairs Logo</td>
					<td class="td">
						<input class="input" type="file" name="mainimg_src" value="${dto.mainimg_src }" required="required">
					</td>
				</tr>
				<tr>
					<td class="td">images</td>
					<td class="td">
						<input class="input" type="file" name="detailimg_src" value="${dto.detailimg_src }" required="required">
					</td>
				</tr>
				<tr>
					<td class="td">images</td>
					<td class="td">
						<input class="input" type="file" name="img_src1" value="${dto.img_src1 }">
					</td>
				</tr>
				<tr>
					<td class="td">images</td>
					<td class="td">
						<input class="input" type="file" name="img_src2" value="${dto.img_src2 }">
					</td>
				</tr>
				<tr>
					<td class="td">images</td>
					<td class="td">
						<input class="input" type="file" name="img_src3" value="${dto.img_src3 }">
					</td>
				</tr>
			</table>
			<div class="button" style="margin-top: 2em;  margin-bottom: 2em;">
				<button type="submit" id="button">수정</button> 
				<button type="reset" id="button">다시작성</button>
			</div>
		</form>
	</div>
</body>
</html>