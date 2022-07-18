<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="../script/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        document.title = "예약취소";

        if (${result > 0}) {
            alert("예약이 취소되었습니다.");
            location.href = "../main/index.jsp";
        } else {
            alert("예약 취소 실패");
            history.back();
        }
    </script>
</head>
<body>

</body>
</html>
