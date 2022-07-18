<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        div:nth-child(1) > div:nth-child(1) > div:nth-child(1) {
            display: inline-block;
            margin-left: 185px;
            font-size: 20px;
            font-weight: bold;
            font-family: barlow, barlow-medium, sans-serif;
        }

        .close {
            margin-left: 150px;
            font-size: 25px;
            font-weight: normal;
            background: none;
            border: none;
        }

        div > div:nth-child(2) {
            margin-top: 50px;
            margin-left: 40px;
            width: 390px;
            border-radius: 10px;
            background-color: #f6f8fa;
            font-family: barlow, barlow-medium, sans-serif;
            font-size: 15px;
        }

        div > div:nth-child(2) > label {
            display: inline-block;
            width: 100px;
            line-height: 20px;
            padding: 14px 0 14px 16px;
            color: #767678;
        }

        div > div:nth-child(2) > input {
            width: 200px;
            color: #929294;
            background-color: #f6f8fa;
            font-weight: 400;
            font-size: 15px;
            border: 0;
        }

        div > div:nth-child(3) {
            margin-top: 20px;
            margin-left: 40px;
            width: 390px;
            border: 1px solid #ddd;
            border-radius: 10px;
            font-family: barlow, barlow-medium, sans-serif;
            font-size: 15px;
        }

        div > div:nth-child(3) > label {
            display: inline-block;
            width: 100px;
            line-height: 20px;
            padding: 14px 0 14px 16px;
            color: #767678;
        }

        div > div:nth-child(3) > input {
            width: 200px;
            font-weight: 600;
            font-size: 15px;
            border: 0;
        }

        input:focus {
            outline: none
        }

        .modify_email_info {
            margin-top: 10px;
            margin-left: 40px;
            color: red;
            font-size: 14px;
        }

        .alter {
            width: 100%;
            height: 70px;
            margin-top: 285px;
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
        document.title = "이메일 수정";

        $(function () {
            $(".close").click(function () {
                window.close();
            });

            $(".modify_email").on("property-change change keyup paste input", function () {
                // 이메일 검사 정규표현식
                function email_check(email) {
                    var regex = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
                    return (email != '' && email != 'undefined' && regex.test(email));
                }

                var email = $(this).val();
                if (email == '' || email == 'undefined') return;
                if (!email_check(email)) {
                    $(".modify_email_info").text('이메일 형식을 다시 확인해주세요.');
                    $(this).focus();
                    return false;
                } else {
                    $(".modify_email_info").text('');
                    $(".alter").css({
                        "background-color": "black",
                        "color": "white",
                        "box-shadow": "3px 3px 3px rgba(0, 0, 0, 0.8)",
                        "border": "none",
                        "pointer-events": "auto"
                    });
                }
            });

            $(".alter").click(function () {
                if ($(".current_email").val() == $(".modify_email").val()) {
                    alert("현재 등록된 이메일과 동일한 이메일입니다. 다시 확인해주세요");
                } else {
                    opener.document.getElementById("email").textContent = $(".modify_email").val();
                    // 데이터 넘겨줄 hidden 태그도 수정
                    opener.document.getElementById("hidden_email").value = $(".modify_email").val();
                    window.close();
                }
            });
        });
    </script>
</head>
<body>
<div>
    <div>
        <div>이메일 변경</div>
        <input type="button" value="✕" class="close">
    </div>
    <div>
        <label>현재 이메일</label>
        <input type="email" value="${email}" class="current_email" readonly>
    </div>
    <div>
        <label>변경할 이메일</label>
        <input type="email" class="modify_email" placeholder="예) pay@naver.com">
    </div>
    <div class="modify_email_info">

    </div>
    <div>
        <input type="button" value="변경하기" class="alter">
    </div>
</div>
</body>
</html>
