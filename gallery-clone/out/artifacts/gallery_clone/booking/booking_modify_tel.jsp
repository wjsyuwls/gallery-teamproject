<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        body > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) {
            display: inline-block;
            margin-left: 165px;
            font-size: 20px;
            font-weight: bold;
            font-family: barlow, barlow-medium, sans-serif;
        }

        .close {
            margin-left: 110px;
            font-size: 25px;
            font-weight: normal;
            background: none;
            border: none;
        }

        table:nth-child(1) {
            width: 400px;
            margin-top: 50px;
            margin-left: 35px;
            border: 1px solid #c8cacc;
            border-radius: 5px;
            font-family: barlow, barlow-medium, sans-serif;
        }

        table:nth-child(1) td {
            padding: 10px;
        }

        table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(1) {
            color: #767676;
            font-size: 14px;
        }

        table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(2) {
            font-size: 18px;
            font-weight: 500;
        }

        table:nth-child(2) {
            width: 400px;
            margin-top: 15px;
            margin-left: 35px;
            border: 1px solid #c8cacc;
            border-radius: 5px;
            font-family: barlow, barlow-medium, sans-serif;
        }

        table:nth-child(2) > tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(1),
        table:nth-child(2) > tbody:nth-child(1) > tr:nth-child(2) > td:nth-child(1) {
            color: #767676;
            font-size: 14px;
        }

        table:nth-child(2) > tbody:nth-child(1) > tr:nth-child(1) {
            border-bottom: 1px solid #ddd;
        }

        table:nth-child(2) td {
            padding: 10px;
        }

        table:nth-child(2) > tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(2) > input:nth-child(1),
        table:nth-child(2) > tbody:nth-child(1) > tr:nth-child(2) > td:nth-child(2) > input:nth-child(1) {
            border: none;
            width: 205px;
            height: 25px;
            font-size: 16px;
            font-weight: 500;
        }

        input:focus {
            outline: none
        }

        tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(2) > input:nth-child(2),
        table:nth-child(2) > tbody:nth-child(1) > tr:nth-child(2) > td:nth-child(2) > input:nth-child(2) {
            width: 60px;
            height: 32px;
            border: 1px solid #dcdee0;
            background-color: white;
            color: #303038;
            border-radius: 10px;
            font-weight: 600;
            line-height: 26px;
            pointer-events: none;
        }

        .alter {
            width: 100%;
            height: 70px;
            margin-top: 260px;
            border: 0;
            border-radius: 10px;
            outline: none;
            background-color: #a7acba;
            color: #fff;
            font-size: 19px;
            font-weight: 700;
            font-family: barlow, barlow-medium, sans-serif;
            pointer-events: none;
        }
    </style>
    <script type="text/javascript" src="../script/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        document.title = "???????????? ??????";

        $(function () {
            let tel = "0" + ${tel};

            $(document).ready(function () {
                $(".current_tel").text(tel);
            });

            $(".close").click(function () {
                window.close()
            });

            // ????????? ?????? ?????? 11??? -> ?????? ?????? ?????????
            $(".tel").on("property-change change keyup paste input", function () {
                if ($(this).val().length == 11) {
                    $(".send_certifyKey").css({
                        "border-radius": "10px",
                        "background-color": "black",
                        "color": "white",
                        "box-shadow": "3px 3px 3px rgba(0, 0, 0, 0.8)",
                        "border": "none",
                        "pointer-events": "auto"
                    });
                } else {
                    $(".send_certifyKey").css({
                        "border": "1px solid #dcdee0",
                        "background-color": "white",
                        "box-shadow": "none",
                        "color": "#303038",
                        "pointer-events": "none"
                    });
                }
            });

            //????????? ?????? ??????
            var code2 = "";
            $(".send_certifyKey").click(function () {
                let current_tel = $(".current_tel").text();
                if ($(".tel").val() == current_tel) {
                    alert("?????? ????????? ????????? ????????? ???????????? ?????? ???????????? ????????? ??????????????????.");
                } else {
                    var tel = $(".tel").val();
                    $.ajax({
                        type: "GET",
                        url: "phoneCheck.do",
                        data: {"tel": tel},
                        cache: false,
                        success: function (data) {
                            alert("???????????? ?????? ??????");
                            code2 = data;

                            //alert(data); /////////////////////////////Test
                        },
                        error: function (xhr, textStatus, errorThrown) {
                            alert("????????? ????????? ???????????? ????????????")
                        }
                    });
                }
            });

            // ???????????? ?????? 4??? -> ?????? ?????? ?????????
            $(".input_certifyKey").on("propertychange change keyup paste input", function () {
                if ($(this).val().length == 4) {
                    $(".confirm").css({
                        "border-radius": "10px",
                        "background-color": "black",
                        "color": "white",
                        "box-shadow": "3px 3px 3px rgba(0, 0, 0, 0.8)",
                        "border": "none",
                        "pointer-events": "auto"
                    });
                } else {
                    $(".confirm").css({
                        "border": "1px solid #dcdee0",
                        "background-color": "white",
                        "box-shadow": "none",
                        "color": "#303038",
                        "pointer-events": "none"
                    });
                }
            });

            // ????????? ???????????? ??????
            $(".confirm").click(function () {
                if ($(".input_certifyKey").val() == code2) {
                    $(".alter").css({
                        "background-color": "black",
                        "color": "white",
                        "box-shadow": "3px 3px 3px rgba(0, 0, 0, 0.8)",
                        "border": "none",
                        "pointer-events": "auto"
                    });
                } else {
                    alert("??????????????? ????????? ?????????");
                }
            });

            // ????????? ?????? ???????????? ??????
            $(".alter").click(function () {
                opener.document.getElementById("tel").textContent = $(".tel").val();
                window.close();
            });
        });
    </script>
</head>
<body>
<div>
    <div>
        <div>???????????? ?????? ??????</div>
        <input type="button" value="???" class="close">
    </div>
    <div>
        <table>
            <tr>
                <td width="25%">?????? ??????</td>
                <td width="75%" class="current_tel"></td>
            </tr>
        </table>

        <table>
            <tr>
                <td width="25%">????????? ??????</td>
                <td width="75%">
                    <input type="tel" placeholder="????????? ?????? ??????" class="tel"
                           oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                    <input type="button" value="??????" class="send_certifyKey">
                </td>
            </tr>

            <tr>
                <td width="25%">????????????</td>
                <td width="75%">
                    <input type="text" placeholder="???????????? ??????" class="input_certifyKey"
                           oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                    <input type="button" value="??????" class="confirm">
                </td>
            </tr>
        </table>
    </div>

    <div>
        <input type="button" value="????????????" class="alter">
    </div>
</div>
</body>
</html>
