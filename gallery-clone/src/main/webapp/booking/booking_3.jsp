<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../css/booking_3.css">
    <script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.1.min.js" type="application/javascript"></script>
    <script type="text/javascript" src="../script/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        document.title = "주문/결제";

        $(function () {
            // 전화번호 데이터 맨 앞 0이 빠져서 옴
            let tel = "0" + ${tel};

            $(document).ready(function () {
                // 주문자 정보 전화번호
                $("#tel").text(tel);
                // 데이터 넘겨줄 hidden 태그
                $("#hidden_tel").attr("value", tel);
            });

            // 주문 수정
            $(".modify_opt").click(function () {
                history.back();
            });

            // 전화번호 수정
            $(".modify_tel").click(function () {
                let popup;
                popup = window.open("booking_modify_tel.do?tel=" + tel, "", "width=480px height=600px");

                // 자식 창 닫힐때 이벤트
                popup.addEventListener('beforeunload', function () {
                    // 전화번호 바뀌면 재수정 못함
                    if ($("#tel").text() != $("#hidden_tel").val()) {
                        $(".modify_tel").css("pointer-events", "none");
                    }
                    // 데이터 넘겨줄 hidden 태그도 수정
                    $("#hidden_tel").val($("#tel").text());
                });
            });

            // 이메일 수정
            $(".modify_email").click(function () {
                let popup;
                popup = window.open("booking_modify_email.do?email=${email}", "", "width=480px height=600px");

                // 자식 창 닫힐때 이벤트
                popup.addEventListener('beforeunload', function () {
                    // 이메일 바뀌면 재수정 못함
                    if ($("#email").text() == $("#hidden_email").val()) {
                        $(".modify_email").css("pointer-events", "none");
                    }
                });
            });

            // toss 결제창 pg 비우면 페이부트에서 kg inocis toss nice 3가지 선택 가능
            $("#pay_btn").click(function () {
                BootPay.request({

                    price: '${price}', //실제 결제되는 가격

                    // 관리자로그인 -> 결제설치 -> 인증키 및 보안 -> WEB Application ID
                    application_id: "62663dd52701800021f696e7",

                    name: 'Restoration of Relationships',  //결제창에서 보여질 이름
                    pg: 'toss',
                    method: 'card',                        //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작
                    show_agree_window: 0,                  // 부트페이 정보 동의 창 보이기 여부

                    // // 부트페이에서 확인 가능 items 제외 확인 가능
                    items: [
                        {
                            item_name: '성인',              //상품명
                            qty: ${adult},                 //수량
                            unique: 'a123',                //해당 상품을 구분짓는 primary key
                            price: 15000,                  //상품 단가
                        },
                        {
                            item_name: '아동청소년',          //상품명
                            qty: ${teen},                  //수량
                            unique: 't123',                //해당 상품을 구분짓는 primary key
                            price: 12000,
                        }
                    ],

                    user_info: {
                        username: '${name}',                 // 사용자 이름
                        email: $("#hidden_email").val(),   // 사용자 이메일
                        addr: '',                          // 사용자 주소
                        phone: $("#hidden_tel").val()      // 사용자 전화번호
                    },

                    order_id: 'order_id_1234',             //고유 주문번호로, 생성하신 값을 보내주어야함
                }).error(function (data) {
                    //결제 진행시 에러가 발생하면 수행
                    console.log(data);
                }).cancel(function (data) {
                    //결제가 취소되면 수행
                    console.log(data);
                }).close(function (data) {
                    // 결제창이 닫힐때 수행 (성공,실패,취소에 상관없이 모두 수행됨)
                    console.log(data);
                }).done(function (data) {
                    //결제가 정상적으로 완료되면 수행
                    document.form.submit();
                    console.log(data);
                });
            });
        });
    </script>
</head>
<body>
<div id="booking_3_wrap">
    <div id="booking_3_header">
        <div>주문/결제</div>
    </div>

    <div id="booking_3_section">
        <div id="pay_opt">
            <table>
                <tr>
                    <td width="20%"></td>
                    <td width="30%">상품정보</td>
                    <td width="15%">판매자</td>
                    <td width="15%">수량</td>
                    <td width="20%">상품금액</td>
                </tr>
                <tr>
                    <td><img src="https://static.wixstatic.com/media/520ee6_f976fc2a823947148ecc1a5b552ff064~mv2.jpg">
                    </td>
                    <td>
                        <c:if test="${adult ne null}">
                            <c:if test="${adult eq 0}">

                            </c:if>
                            <c:if test="${adult ne 0}">
                                <c:if test="${teen eq 0}">
                                    성인 ${adult}매
                                </c:if>
                                <c:if test="${teen ne 0}">
                                    성인 ${adult}매,&nbsp;
                                </c:if>
                            </c:if>
                        </c:if>

                        <c:if test="${teen ne null}">
                            <c:if test="${teen eq 0}">

                            </c:if>
                            <c:if test="${teen ne 0}">
                                아동청소년 ${teen}매
                            </c:if>
                        </c:if>
                    </td>
                    <td>bk gallery</td>
                    <td>${tot}</td>
                    <td>${price}</td>
                </tr>
            </table>
            <div>
                <input type="button" value="주문상품수정" class="modify_opt">
            </div>
        </div>

        <form action="../booking/booking_ok.do" method="post" name="form">
            <div id="order_info">
                <div>
                    <table>
                        <tr>
                            <td>주문자 정보</td>
                            <td></td>
                        </tr>

                        <tr>
                            <td>
                                ${name}
                                <input type="hidden" name="name" value="${name}">
                            </td>
                            <td></td>
                        </tr>

                        <tr>
                            <td id="tel">
                            </td>
                            <td>
                                <input type="button" value="수정" class="modify_tel">
                            </td>
                            <%-- td 안에 있으면 인식 못함--%>
                            <input type="hidden" name="tel" id="hidden_tel">
                        </tr>

                        <tr>
                            <td id="email">
                                ${email}
                            </td>
                            <td><input type="button" value="수정" class="modify_email"></td>
                            <input type="hidden" name="email" value="${email}" id="hidden_email">
                        </tr>

                        <tr>
                            <td colspan="2">
                                ℹ︎ 입력하신 주문자 정보로 결제관련 정보가 제공됩니다.
                            </td>
                        </tr>
                    </table>
                    <div id="order_content">
                        <p>예약 서비스 안내</p>
                        입력하신 주문자 정보로 결제관련 정보가 제<br>공됩니다. 정확한 정보로 등록되어있는지 확<br>인해주세요.
                    </div>
                </div>

                <div>
                    <input type="button" value="결제하기" id="pay_btn">
                </div>

                <%--hidden 으로 값 넘겨주기--%>
                <input type="hidden" name="price" value="${price}">
                <input type="hidden" name="tot" value="${tot}">
                <input type="hidden" name="adult" value="${adult}">
                <input type="hidden" name="teen" value="${teen}">
                <input type="hidden" name="date" value="${date}">
            </div>
        </form>
    </div>

    <div id="booking_3_footer">

    </div>
</div>
</body>
</html>
