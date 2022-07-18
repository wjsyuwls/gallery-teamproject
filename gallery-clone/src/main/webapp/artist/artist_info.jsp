<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="../css/artist_info_Frame.css">
    <script type="text/javascript" src="../script/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(function () {
            document.title = "${artist_info.eng_name} | GalleryBK";

            $(document).ready(function () {
                // artist_featured_works section json 데이터
                $.ajax({
                    url: "artist_info_featured_works_Json.do",
                    data: {"eng_name": "${artist_info.eng_name}"},
                    dataType: "json",
                    success: function (json) {

                        // artist featured works  이미지

                        let item = json.items;

                        // artist featured works 갯수만큼 꺼내서 <ul>에 넣기
                        for (let i = 0; i < json.items.length; i++) {
                            // artist featured works i번째 이미지
                            let src = item[i].artist_works;

                            let li = $("<li>").css("display", "inline-block");

                            let img = $("<img>").attr("src", src);
                            img.css({
                                "width": "580px",
                                "height": "500px",
                                "z-index": i * -1
                            });

                            li.append(img);
                            $("#artist_featured_works_imgs").append(li);
                        }

                        if (json.items.length == 1) {
                            $("#artist_featured_works_next").hide();
                        }

                        // artist featured works 버튼
                        let img_count = $("#artist_featured_works_imgs").children().length;
                        let img_position = 1;

                        $("#artist_featured_works_prev").click(function () {
                            artist_featured_works_prev();
                        });

                        $("#artist_featured_works_next").click(function () {
                            artist_featured_works_next();
                        });

                        $("#artist_featured_works_prev").css({
                            "opacity": "0",
                            "pointer-events": "none"
                        });

                        function artist_featured_works_prev() {
                            if (img_position == 2) {
                                $("#artist_featured_works_prev").css({
                                    "opacity": "0",
                                    "pointer-events": "none"
                                });
                            }

                            $("#artist_featured_works_next").show();

                            if (1 < img_position) {
                                $("#artist_featured_works_imgs").animate({
                                    left: '+=580px'
                                });
                                img_position--;
                            }
                        }

                        function artist_featured_works_next() {
                            $("#artist_featured_works_prev").css({
                                "opacity": "1",
                                "pointer-events": "auto"
                            });

                            if (img_position == img_count - 1) {
                                $("#artist_featured_works_next").hide();
                            }

                            if (img_count > img_position) {
                                $("#artist_featured_works_imgs").animate({
                                    left: '-=580px'
                                });
                                img_position++;
                            }
                        }

                        // prev, next 버튼
                        $(".prev").hover(function () {
                            $(this).css("cursor", "pointer");
                            $(this).css({
                                "border-top": "2px solid darkgray",
                                "border-right": "2px solid darkgray"
                            });
                        }, function () {
                            $(this).css({
                                "border-top": "2px solid white",
                                "border-right": "2px solid white"
                            });
                        });

                        $(".next").hover(function () {
                            $(this).css("cursor", "pointer");
                            $(this).css({
                                "border-top": "2px solid darkgray",
                                "border-right": "2px solid darkgray"
                            });
                        }, function () {
                            $(this).css({
                                "border-top": "2px solid white",
                                "border-right": "2px solid white"
                            });
                        });
                    },
                    error: function (xhr, textStatus, errorThrown) {
                        alert("[ERROR] " + xhr, status);
                    }
                });

                // artist_exhibitions section json 데이터
                $.ajax({
                    url: "artist_info_exhibitions_Json.do",
                    data: {"eng_name": "${artist_info.eng_name}"},
                    dataType: "json",
                    success: function (json) {
                        // alert(json.json_arr[1][0].works);
                        // alert(json.json_arr[1][1].works);
                        // alert(json.json_arr[1][2].works);
                        // alert(json.json_arr[1][3].works);
                        let json_arr = json.json_arr;

                        for (let i = 0; i < json_arr.length; i++) {

                            let length = json_arr[i].length;

                            // 전시회 이미지 section
                            let div_imgs = $("<div>").attr("id", "artist_exhibitions_imgs_section");
                            div_imgs.css({
                                "overflow": "hidden",
                                "position": "relative",
                                "width": "600px",
                                "height": "350px",
                            });

                            // 두번째 전시회부터
                            if (i > 0) {
                                div_imgs.css("margin-top", "100px");
                            }

                            //  i번째 전시회 제목
                            let title = json.json_arr[i][0].title;
                            let div_title = $("<div>").html(title);
                            div_title.css({
                                "margin-top": "20px",
                                "font-size": "22px",
                                "font-family": "barlow-extralight,barlow ,sans-serif"
                            });

                            //  i번째 전시회 전시회 기간
                            let term = json.json_arr[i][0].term;
                            let div_term = $("<div>").html(term);
                            div_term.css({
                                "margin-top": "8px",
                                "font": "15px sans-serif"
                            });

                            // 전시회 이미지
                            let ul = $("<ul>").attr("id", "artist_exhibitions_imgs" + (i));
                            ul.css({
                                "position": "absolute",
                                "margin-top": "0",
                                "padding": "0",
                                "top": "0",
                                "left": "0",
                                "list-style": "none"
                            });

                            // 전시회 버튼
                            let div_btn = $("<div>")
                            let div_prev_btn = $("<button>").attr("id", "artist_exhibitions_prev" + (i)).attr("class", "prev");
                            div_prev_btn.css({
                                "transform": "rotate(225deg)", /* 각도 */
                                "top": "155px",
                                "left": "20px"
                            });

                            let div_next_btn = $("<button>").attr("id", "artist_exhibitions_next" + (i)).attr("class", "next");
                            div_next_btn.css({
                                "transform": "rotate(45deg)", /* 각도 */
                                "top": "155px",
                                "left": "530px"
                            });

                            div_btn.append(div_prev_btn).append(div_next_btn);

                            for (let j = 0; j < length; j++) {
                                let li = $("<li>").css("display", "inline-block");

                                // i번째 전시회에 j의 전시회 이미지
                                let src = json.json_arr[i][j].works;
                                let img = $("<img>").attr("src", src)
                                img.css({
                                    "width": "600px",
                                    "height": "350px",
                                    "z-index": i * -1   // 처음 사진부터 보이기
                                });

                                li.append(img);
                                ul.append(li);
                            }

                            // 전시회 이미지 section에 전시회 이미지 넣기
                            div_imgs.append(ul).append(div_btn);

                            // 전시회 section에 전시회 이미지 section, 전시회 title, 전시회 기간 넣기
                            $("#artist_exhibitions").append(div_imgs).append(div_title).append(div_term);
                        }

                        // artist exhibitions 1번째 버튼
                        let img_count_first = $("#artist_exhibitions_imgs0").children().length;
                        let img_position_first = 1;

                        let prev_btn0 = $("#artist_exhibitions_prev0");
                        let next_btn0 = $("#artist_exhibitions_next0");
                        let imgs0 = $("#artist_exhibitions_imgs0");

                        if (img_count_first == 1) {
                            next_btn0.hide();
                        }

                        prev_btn0.click(function () {
                            artist_exhibitions_first_prev();
                        });

                        next_btn0.click(function () {
                            artist_exhibitions_first_next();
                        });

                        prev_btn0.css({
                            "opacity": "0",
                            "pointer-events": "none"
                        });

                        function artist_exhibitions_first_prev() {
                            if (img_position_first == 2) {
                                prev_btn0.css({
                                    "opacity": "0",
                                    "pointer-events": "none"
                                });
                            }
                            next_btn0.show();
                            if (1 < img_position_first) {
                                imgs0.animate({
                                    left: '+=600px'
                                });
                            }
                            img_position_first--;
                        }

                        function artist_exhibitions_first_next() {
                            prev_btn0.css({
                                "opacity": "1",
                                "pointer-events": "auto"
                            });
                            if (img_position_first == img_count_first - 1) {
                                next_btn0.hide();
                            }
                            if (img_count_first > img_position_first) {
                                imgs0.animate({
                                    left: '-=600px'
                                });
                            }
                            img_position_first++;
                        }

                        // artist exhibitions 두번째 버튼
                        let img_count_second = $("#artist_exhibitions_imgs1").children().length;
                        let img_position_second = 1;

                        let prev_btn1 = $("#artist_exhibitions_prev1");
                        let next_btn1 = $("#artist_exhibitions_next1");
                        let imgs1 = $("#artist_exhibitions_imgs1");

                        prev_btn1.click(function () {
                            artist_exhibitions_second_prev();
                        });

                        next_btn1.click(function () {
                            artist_exhibitions_second_next();
                        });

                        if (img_count_second == 1) {
                            next_btn1.hide();
                        }

                        prev_btn1.css({
                            "opacity": "0",
                            "pointer-events": "none"
                        });

                        function artist_exhibitions_second_prev() {
                            if (img_position_second == 2) {
                                prev_btn1.css({
                                    "opacity": "0",
                                    "pointer-events": "none"
                                });
                            }
                            next_btn1.show();
                            if (1 < img_position_second) {
                                imgs1.animate({
                                    left: '+=600px'
                                });
                            }
                            img_position_second--;
                        }

                        function artist_exhibitions_second_next() {
                            prev_btn1.css({
                                "opacity": "1",
                                "pointer-events": "auto"
                            });
                            if (img_position_second == img_count_second - 1) {
                                next_btn1.hide();
                            }
                            if (img_count_second > img_position_second) {
                                imgs1.animate({
                                    left: '-=600px'
                                });
                            }
                            img_position_second++;
                        }

                        // artist exhibitions 세번째 버튼
                        let img_count_third = $("#artist_exhibitions_imgs2").children().length;
                        let img_position_third = 1;

                        let prev_btn2 = $("#artist_exhibitions_prev2");
                        let next_btn2 = $("#artist_exhibitions_next2");
                        let imgs2 = $("#artist_exhibitions_imgs2");

                        prev_btn2.click(function () {
                            artist_exhibitions_third_prev();
                        });

                        next_btn2.click(function () {
                            artist_exhibitions_third_next();
                        });

                        if (img_count_third == 1) {
                            next_btn2.hide();
                        }

                        prev_btn2.css({
                            "opacity": "0",
                            "pointer-events": "none"
                        });

                        function artist_exhibitions_third_prev() {
                            if (img_position_third == 2) {
                                prev_btn2.css({
                                    "opacity": "0",
                                    "pointer-events": "none"
                                });
                            }
                            next_btn2.show();
                            if (1 < img_position_third) {
                                imgs2.animate({
                                    left: '+=600px'
                                });
                            }
                            img_position_third--;
                        }

                        function artist_exhibitions_third_next() {
                            prev_btn2.css({
                                "opacity": "1",
                                "pointer-events": "auto"
                            });
                            if (img_position_third == img_count_third - 1) {
                                next_btn2.hide();
                            }
                            if (img_count_third > img_position_third) {
                                imgs2.animate({
                                    left: '-=600px'
                                });
                            }
                            img_position_third++;
                        }

                        // 공통 prev, next 버튼
                        $(".prev").hover(function () {
                            $(this).css("cursor", "pointer");
                            $(this).css({
                                "border-top": "2px solid darkgray",
                                "border-right": "2px solid darkgray"
                            });
                        }, function () {
                            $(this).css({
                                "border-top": "2px solid white",
                                "border-right": "2px solid white"
                            });
                        });

                        $(".next").hover(function () {
                            $(this).css("cursor", "pointer");
                            $(this).css({
                                "border-top": "2px solid darkgray",
                                "border-right": "2px solid darkgray"
                            });
                        }, function () {
                            $(this).css({
                                "border-top": "2px solid white",
                                "border-right": "2px solid white"
                            });
                        });
                    },
                    error: function (xhr, textStatus, errorThrown) {
                        alert("[ERROR] " + xhr, status);
                    }
                });

                // artist_news section json 데이터
                $.ajax({
                    url: "artist_info_news_Json.do",
                    data: {"eng_name": "${artist_info.eng_name}"},
                    dataType: "json",
                    success: function (json) {
                        let json_arr = json.json_arr;

                        for (let i = 0; i < json_arr.length; i++) {

                            if (json.json_arr[i] != null) {
                                let div_news_section = $("<div>");
                                div_news_section.css({
                                    "width": "800px"
                                });

                                if (i > 0) {
                                    div_news_section.css({
                                        "margin-top": "100px"
                                    });
                                }

                                if (json.json_arr[i - 1] == null) {
                                    div_news_section.css({
                                        "margin-top": "0"
                                    });
                                }

                                let div_news_exhibition_title = $("<div>");
                                // i번째 전시회 제목
                                let title = $("<div>").html("《" + json.json_arr[i][0].title + "》" + "<br>");
                                title.css({
                                    "font-size": "21px",
                                    "font-family": "barlow-extralight, barlow, sans-serif"
                                });
                                // i번째 전시회 기간
                                let term = $("<div>").html(json.json_arr[i][0].term);
                                term.css({
                                    "font-size": "17px",
                                    "font-family": "barlow-extralight, barlow, sans-serif",
                                    "color": "gray",
                                    "margin-top": "5px"
                                });
                                div_news_exhibition_title.append(title).append(term);
                                div_news_exhibition_title.css("float", "left");
                                div_news_section.append(div_news_exhibition_title);

                                // i번째 전시회 뉴스 갯수
                                let length = json_arr[i].length;

                                let div_news_info = $("<div>");
                                div_news_info.css({
                                    "width": "800px",
                                    "display": "inline-block",
                                    "clear": "both",
                                });

                                for (let j = 0; j < length; j++) {
                                    let div_news_info_1 = $("<div>");
                                    div_news_info_1.css({
                                        "width": "200",
                                        "display": "inline-block",
                                        "vertical-align": "top"
                                    });

                                    if (j > 0) {
                                        div_news_info_1.css("margin-left", "60px");
                                    }

                                    if (j % 3 == 0) {
                                        div_news_info_1.css("margin-left", "0");
                                    }

                                    let href = json.json_arr[i][j].news_href;
                                    let news_href = $("<a>").attr("href", href).attr("target", "_blank");

                                    let src = json.json_arr[i][j].news_img;
                                    let news_img = $("<img>").attr("src", src);
                                    news_img.css({
                                        "width": "200px",
                                        "height": "220px",
                                        "margin-top": "55px"
                                    });

                                    news_img.hover(function () {
                                        $(this).css({
                                            "opacity": "0.5",
                                            "transition-duration": "0.3s"
                                        });
                                    }, function () {
                                        $(this).css("opacity", "1");
                                    });

                                    news_href.append(news_img);

                                    let news_date = $("<div>").html(json.json_arr[i][j].news_date);
                                    news_date.css({
                                        "margin-top": "20px",
                                        "font-size": "barlow-extralight, 18px",
                                        "color": "rgb(84, 84, 84)"
                                    });

                                    let news_title = $("<div>").html(json.json_arr[i][j].news_title);
                                    news_title.css({
                                        "margin-top": "10px",
                                        "color": "rgb(44, 45, 52)",
                                        "font-size": "13px",
                                        "font-weight": "bold",
                                        "font-family": "barlow-medium,barlow,sans-serif"
                                    });

                                    div_news_info_1.append(news_href).append(news_date).append(news_title);
                                    div_news_info.append(div_news_info_1);
                                }
                                div_news_section.append(div_news_info);
                                $("#artist_news").append(div_news_section);
                            }
                        }
                    },
                    error: function (xhr, textStatus, errorThrown) {
                        // 뉴스 정보 없으면 숨기기
                        $("#artist_news_section").hide();
                        $("#news_btn1").css("pointer-events", "none");
                        $("#news_btn2").css("pointer-events", "none");
                        $("#news_btn3").css("pointer-events", "none");
                    }
                });

                $(".category_btn").click(function () {
                    let category = $(this).val();
                    if (category == "Featured Works") {
                        //height 라는 변수에 #artist_featured_works_section 이라는 아이디를 가진 위치값을 받아오기
                        var height = $("#artist_featured_works_section").offset();
                        //animate의안에 들어가는 매개 변수는 1번째는 움직일 위치 2번째는 속도이다.
                        //heigh의 top - 80 위치로 이동 시킨다.
                        $("html, body").animate({scrollTop: height.top - 80}, 1000);
                    } else if (category == "Exhibitions") {
                        var height = $("#artist_exhibitions_section").offset();
                        $("html, body").animate({scrollTop: height.top - 80}, 1000);
                    } else if (category == "News") {
                        var height = $("#artist_news_section").offset();
                        $("html, body").animate({scrollTop: height.top - 80}, 1000);
                    } else if (category == "CV") {
                        var height = $("#artist_cv_section").offset();
                        $("html, body").animate({scrollTop: height.top - 80}, 1000);
                    }
                });
            });
        });
    </script>
</head>
<body>
<div id="artist_info_main">
    <div id="artist_info_header">

    </div>

    <div id="artist_featured_works_section">
        <div id="artist_info_category">
            <div id="artist_eng_name" style="margin-left: 4px">${artist_info.eng_name}</div>
            <div id="artist_featured_works_category">
                <input type="button" value="Featured Works" class="category_btn" style="color: darkgray"> <br>
                <input type="button" value="Exhibitions" class="category_btn"> <br>
                <input type="button" value="News" class="category_btn" id="news_btn1"> <br>
                <input type="button" value="CV" class="category_btn">
            </div>
        </div>

        <div id="artist_featured_works">
            <ul id="artist_featured_works_imgs">

            </ul>
            <div><input type="button" id="artist_featured_works_prev" class="prev"/></div>
            <div><input type="button" id="artist_featured_works_next" class="next"/></div>
        </div>
    </div>
    <div id="inquiry"><a href="../main/index.jsp">Inquiry</a></div>

    <div id="artist_exhibitions_section">
        <div id="artist_exhibitions_category">
            <input type="button" value="Featured Works" class="category_btn"> <br>
            <input type="button" value="Exhibitions" class="category_btn" style="color: darkgray"> <br>
            <input type="button" value="News" class="category_btn" id="news_btn2"> <br>
            <input type="button" value="CV" class="category_btn">
        </div>
        <div id="artist_exhibitions">

        </div>
    </div>

    <div id="artist_news_section">
        <div id="artist_news_category">
            <input type="button" value="Featured Works" class="category_btn"> <br>
            <input type="button" value="Exhibitions" class="category_btn"> <br>
            <input type="button" value="News" class="category_btn" style="color: darkgray"> <br>
            <input type="button" value="CV" class="category_btn">
        </div>

        <div id="artist_news">

        </div>
    </div>

    <div id="artist_cv_section">
        <div id="artist_cv_category">
            <input type="button" value="Featured Works" class="category_btn"> <br>
            <input type="button" value="Exhibitions" class="category_btn"> <br>
            <input type="button" value="News" class="category_btn" id="news_btn3"> <br>
            <input type="button" value="CV" class="category_btn" style="color: darkgray">
        </div>

        <div id="artist_cv">
            <pre>${artist_info.info}</pre>
        </div>
    </div>

    <div id="artist_info_footer">

    </div>
</div>
</body>
</html>
