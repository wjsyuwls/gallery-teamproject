<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<title>Title</title>
<link rel="stylesheet" type="text/css" href="../css/login_button.css">
<link rel="stylesheet" type="text/css" href="../css/login.css?v=0.1">
<script type="text/javascript" src="../script/loginScript.js"></script>
<script type="text/javascript">
    /* 해당페이지에 들어오게 되면 메뉴 클릭이 비활성화되게 설정 */
    $(document).ready(function () {
        $("#ArtFairs").css("color", "lightgray").on("click", function (event) {
            event.preventDefault();
        });
    });


    // 아이디 입력창 띄우기
    function checkId() {
        var memid = document.frm.memid.value;

        if (memid == "") {
            alert("먼저 아이디를 입력하세요.");
            document.frm.memid.focus();
        } else {
            // 브라우저창 열기
            window.open("checkId.do?memid=" + memid, "", "width=450 height=130 left=1000 top=600")
            cnt++;
        }
    }
</script>
</head>
<body>
<div class="div">
    <form action="join.do" method="post" name="frm" id="form" onsubmit="check(); return false;">
        <table align="center" id="table">
            <tr>
                <td class="td" width="25%">이름</td>
                <td class="td">
                    <input type="text" class="input" name="memname" id="memname" placeholder="* 필수 입력">
                </td>
            </tr>
            <tr>
                <td class="td">ID</td>
                <td class="td">
                    <input type="text" class="input_id" name="memid" id="memid" placeholder="* 필수 입력"
                           style="width: 66.5%;">
                    <button type="button" id="button" onclick="checkId()" style="margin-bottom: 10px;">중복체크</button>
                </td>
            </tr>
            <tr>
                <td class="td">P/W</td>
                <td class="td">
                    <input type="password" class="input" name="pw" id="pw" placeholder="* 비밀번호 입력">
                </td>
            </tr>
            <tr>
                <td class="td">P/W 확인</td>
                <td class="td">
                    <input type="password" class="input" name="repw" id="repw" placeholder="* 비밀번호 재확인">
                </td>
            </tr>
            <tr>
                <td class="td">성별</td>
                <td class="td">
                    <input type="radio" name="gender" value="남"><label class="gender"
                                                                       style="display:inline-block; width:10px;">남</label>
                    <input type="radio" name="gender" value="여"><label class="gender"
                                                                       style="display:inline-block; width:10px;">여</label>
                </td>
            </tr>
            <tr>
                <td class="td">E-mail</td>
                <td class="td">
                    <input type="text" name="email1" class="mail" style="width: 39.5%;">&nbsp;@&nbsp;
                    <select name="email2" class="select1">
                        <option value="naver.com">naver.com</option>
                        <option value="daum.net">daum.net</option>
                        <option value="gmail.com">gmail.com</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="td">핸드폰</td>
                <td class="td">
                    <select name="phone1" class="select2">
                        <option value="010">010</option>
                        <option value="016">016</option>
                        <option value="018">018</option>
                    </select>
                    &nbsp;-&nbsp;
                    <!-- 숫자만 입력받도록 설정 -->
                    <input type="text" name="phone2" maxlength="4" size="10" class="phone" style="text-align: center;"
                           oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                    &nbsp;-&nbsp;
                    <input type="text" name="phone3" maxlength="4" size="10" class="phone" style="text-align: center;"
                           oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                </td>
            </tr>
            <tr>
                <td class="td">주소</td>
                <td class="td">
                    <input type="text" name="addr" class="input">
                </td>
            </tr>
        </table>
        <div class="button">
            <button type="submit" id="button">회원 가입</button>&nbsp;
            <button type="reset" id="button">다시 작성</button>
        </div>
    </form>
</div>
</body>
</html>