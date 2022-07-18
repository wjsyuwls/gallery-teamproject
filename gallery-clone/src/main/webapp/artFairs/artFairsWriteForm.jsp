<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="../css/artFairs.css?v=0.2">
    <link rel="stylesheet" type="text/css" href="../css/login_button.css">
    <script type="text/javascript">
        /* 해당페이지에 들어오게 되면 메뉴 클릭이 비활성화되게 설정 */
        $(document).ready(function () {
            $("#ArtFairs").css("color", "lightgray").on("click", function (event) {
                event.preventDefault();
            });
        });
    </script>
    <style type="text/css">
        #textA {
            width: 98%;
            border: none;
        }
    </style>
</head>
<body>
<div class="div" style="text-align: center; margin-top: 3em;">
    <form action="artFairsWrite.do" method="post" enctype="multipart/form-data">
        <table align="center" id="table">
            <tr>
                <td class="td" width="20%">Fair Title</td>
                <td class="td"><input class="input" type="text" name="title" placeholder="Fair 이름" required="required">
                </td>
            </tr>
            <tr>
                <td class="td">Fair Date</td>
                <td class="td"><input class="input" type="text" name="afdate" placeholder="MainPage 표기날짜"
                                      required="required"></td>
            </tr>
            <tr>
                <td class="td">Fair Detail Date</td>
                <td class="td"><input class="input" type="text" name="info_date" placeholder="세부Page 표기날짜"
                                      required="required"></td>
            </tr>
            <tr>
                <td class="td">Fair Info</td>
                <td class="td"><input class="input" type="text" name="info" placeholder="Fair 전시지역" required="required">
                </td>
            </tr>
            <tr>
                <td class="td">Fair Place</td>
                <td class="td"><input class="input" type="text" name="place" placeholder="Fair 전시구역"
                                      required="required"></td>
            </tr>
            <tr>
                <td class="td">Fair BoothNumber</td>
                <td class="td"><input class="input" type="text" name="place_detail" required="required"></td>
            </tr>
            <tr>
                <td class="td">Gallery</td>
                <td class="td"><input class="input" type="text" name="artists" value="GALLERY BK" readonly/></td>
            </tr>
            <tr>
                <td class="td">Artists</td>
                <td class="td"><textarea id="textA" name="artist_name" rows="14" required="required"></textarea></td>
            </tr>
            <tr>
                <td class="td">Fairs Logo&emsp;*필수입력</td>
                <td class="td"><input class="input" type="file" name="mainimg_src" required="required"></td>
            </tr>
            <tr>
                <td class="td">images1&emsp;*필수입력</td>
                <td class="td"><input class="input" type="file" name="detailimg_src" required="required"></td>
            </tr>
            <tr>
                <td class="td">images2</td>
                <td class="td"><input class="input" type="file" name="img_src1"></td>
            </tr>
            <tr>
                <td class="td">images3</td>
                <td class="td"><input class="input" type="file" name="img_src2"></td>
            </tr>
            <tr>
                <td class="td">images4</td>
                <td class="td"><input class="input" type="file" name="img_src3"></td>
            </tr>
        </table>
        <div class="button" style="margin-top: 2em;  margin-bottom: 2em;">
            <button type="submit" id="button">등록</button>
            <button type="reset" id="button">다시작성</button>
        </div>
    </form>
</div>
</body>
</html>