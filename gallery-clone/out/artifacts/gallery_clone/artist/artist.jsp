<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="../css/artist_Frame.css"/>
    <script type="text/javascript" src="../script/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        document.title = "Artist | GalleryBK";

        $(function () {
            $(document).ready(function () {
                $("#Artists").css("color", "lightgray").on("click", function (event) {
                    event.preventDefault();
                });

                $("#artist_group_gallery").on("click", function (event) {
                    event.preventDefault();
                });

                // 32개 데이터만 보여주기
                $(".artist_info_content:gt(31)").hide();
            });

            // 첫번째 인덱스는 gt에 적용이 안되므로 따로
            $(".artist_info_content:eq(0)").hover(function () {
                $(this).children().css("visibility", "visible").fadeIn(300);
                $(this).children("div").css("color", "white");
            }, function () {
                $(this).children(".artist_info_image").fadeOut(300);
                $(this).children("div").css("color", "black");
            });

            $(".artist_info_content:gt(0)").hover(function () {
                $(this).children().css("visibility", "visible").fadeIn(300);
                $(this).children("div").css("color", "white");
            }, function () {
                $(this).children(".artist_info_image").fadeOut(300);
                $(this).children("div").css("color", "black");
            });

            $("#artist_group_gallery").hover(function () {
                $(this).css("cursor", "pointer");
            });

            $("#artist_group_project").hover(function () {
                $(this).css("cursor", "pointer");
            });

            $("#show_more_btn").hover(function () {
                $(this).css("cursor", "pointer");
            });

            // show more 누를때 마다 artist_info 8개씩 보이기
            // artist_info 전부 출력 시 show more 숨김
            $.ajax({
                url: "artist_Json.do",
                dataType: "json",
                success: function (json) {
                    let start = 32;
                    let end = 40;
                    $("#show_more_btn").click(function () {
                        $(".artist_info_content").slice(start, end).show();
                        start += 8;
                        end += 8;
                        if (end > json.items.length + 8) {
                            $("#show_more_btn").hide();
                        }
                    });
                },
                error: function (xhr, textStatus, errorThrown) {
                    alert("[ERROR] " + xhr, status);
                }
            });
        });
    </script>
</head>
<body>
<div id="artist_main">
    <div id="artist_header">
        <div id="artist_group">
            <div><input type="button" id="artist_group_gallery" value="BK Artist"></div>
            <div><input type="button" id="artist_group_project" value="Project Artist"></div>
        </div>
    </div>

    <div id="artist_section">
        <div>
            <c:forEach var="dto" items="${list }">
                <a href="artist_info.do?artist=${dto.eng_name}" id="artist_info" class="artist_info">
                    <div class="artist_info_content">
                        <img src="${dto.head_img }" width="200px" height="217px"
                             class="artist_info_image"
                             style="visibility: hidden"/>
                        <div>
                            <div id="artist_info_name">
                                <div id="artist_info_name_title">${dto.eng_name}</div>
                                <div id="artist_info_name_description">${dto.kor_name}</div>
                            </div>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>
        <div id="show_more">
            <input type="button" id="show_more_btn" value="Show More">
        </div>
    </div>

    <div id="artist_footer">

    </div>
</div>
</body>
</html>
