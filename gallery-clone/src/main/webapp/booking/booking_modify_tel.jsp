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
        document.title = "전화번호 수정";

        $(function () {
            let tel = "0" + ${tel};

            $(document).ready(function () {
                $(".current_tel").text(tel);
            });

            $(".close").click(function () {
                window.close()
            });

            // 휴대폰 번호 입력 11자 -> 인증 버튼 활성화
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

            //휴대폰 번호 인증
            var code2 = "";
            $(".send_certifyKey").click(function () {
                let current_tel = $(".current_tel").text();
                if ($(".tel").val() == current_tel) {
                    alert("현재 휴대폰 번호와 동일한 번호로의 변경 요청으로 인증이 불가능합니다.");
                } else {
                    var tel = $(".tel").val();
                    $.ajax({
                        type: "GET",
                        url: "phoneCheck.do",
                        data: {"tel": tel},
                        cache: false,
                        success: function (data) {
                            alert("인증번호 전송 완료");
                            code2 = data;

                            //alert(data); /////////////////////////////Test
                        },
                        error: function (xhr, textStatus, errorThrown) {
                            alert("휴대폰 번호가 올바르지 않습니다")
                        }
                    });
                }
            });

            // 인증번호 입력 4자 -> 확인 버튼 활성화
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

            // 휴대폰 인증번호 대조
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
                    alert("인증번호를 확인해 주세요");
                }
            });

            // 주문자 정보 전화번호 변경
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
        <div>휴대전화 번호 변경</div>
        <input type="button" value="✕" class="close">
    </div>
    <div>
        <table>
            <tr>
                <td width="25%">현재 번호</td>
                <td width="75%" class="current_tel"></td>
            </tr>
        </table>

        <table>
            <tr>
                <td width="25%">변경할 번호</td>
                <td width="75%">
                    <input type="tel" placeholder="휴대폰 번호 입력" class="tel"
                           oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                    <input type="button" value="인증" class="send_certifyKey">
                </td>
            </tr>

            <tr>
                <td width="25%">인증번호</td>
                <td width="75%">
                    <input type="text" placeholder="인증번호 입력" class="input_certifyKey"
                           oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                    <input type="button" value="확인" class="confirm">
                </td>
            </tr>
        </table>
    </div>

    <div>
        <input type="button" value="변경하기" class="alter">
    </div>
</div>
</body>
</html>
