<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="../css/booking_2.css">
    <script type="text/javascript" src="../script/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        document.title = "예매하기";

        $(document).ready(function () {
            calendarInit();
        });

        /*
            달력 렌더링 할 때 필요한 정보 목록

            현재 월(초기값 : 현재 시간)
            금월 마지막일 날짜와 요일
            전월 마지막일 날짜와 요일
        */

        function calendarInit() {

            // 날짜 정보 가져오기
            // let date = new Date(); // 현재 날짜(로컬 기준) 가져오기
            // let utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
            // let kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
            //let today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)

            let today = new Date();

            // 달력에서 표기하는 날짜 객체
            let thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());

            let currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
            let currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월
            let currentDate = thisMonth.getDate(); // 달력에서 표기하는 일

            // kst 기준 현재시간
            // console.log(thisMonth);

            // 캘린더 렌더링
            renderCalender(thisMonth);

            function renderCalender(thisMonth) {

                // 렌더링을 위한 데이터 정리
                currentYear = thisMonth.getFullYear();
                currentMonth = thisMonth.getMonth();
                currentDate = thisMonth.getDate();

                // 이전 달의 마지막 날 날짜와 요일 구하기
                let startDay = new Date(currentYear, currentMonth, 0);
                let prevDate = startDay.getDate();
                let prevDay = startDay.getDay();

                // 이번 달의 마지막날 날짜와 요일 구하기
                let endDay = new Date(currentYear, currentMonth + 1, 0);
                let nextDate = endDay.getDate();
                let nextDay = endDay.getDay();

                // console.log(prevDate, prevDay, nextDate, nextDay);

                // 현재 월 표기
                $('.year-month').text(currentYear + '.' + (currentMonth + 1));

                // 렌더링 html 요소 생성
                let calendar = document.querySelector('.dates');
                calendar.innerHTML = '';

                // 지난달
                for (let i = prevDate - prevDay + 1; i <= prevDate; i++) {
                    calendar.innerHTML = calendar.innerHTML + '<button class="day prev disable">' + i + '</button>'
                }
                // 이번달
                for (let i = 1; i <= nextDate; i++) {
                    calendar.innerHTML = calendar.innerHTML + '<button class="day current">' + i + '</button>'
                }
                // 다음달
                for (let i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
                    calendar.innerHTML = calendar.innerHTML + '<button class="day next disable">' + i + '</button>'
                }

                // 오늘 날짜 표기
                if (today.getMonth() == currentMonth) {
                    let todayDate = today.getDate();
                    let currentMonthDate = document.querySelectorAll('.dates .current');
                    currentMonthDate[todayDate - 1].classList.add('today');
                }
            }

            // 요일 구하기
            function get_week(date) {
                var week = ['일', '월', '화', '수', '목', '금', '토'];
                var dayOfWeek = week[new Date(date).getDay()];
                return dayOfWeek;
            }

            // 오늘 날짜 예매내용 div 에 추가
            let todayDate = today.getDate();
            // 요일 구하기
            let dayOfWeek = get_week(currentYear + "-" + (currentMonth + 1) + "-" + todayDate);
            let day_info = currentMonth + 1 + ". " + todayDate + ". " + "(" + dayOfWeek + ")";
            $(".day_info").append(day_info);

            // 예매내용에 기본으로 총 0장 추가
            $(".ticket_info").html(", 총 0매");

            // 날짜 선택 시
            $(".day.current").click(function () {
                $(".day_info").empty();
                // 선택한 날짜 가져오기
                let day = $(this).text();
                // 요일 구하기
                let dayOfWeek = get_week(currentYear + "-" + (currentMonth + 1) + "-" + day);
                // 이번달 + 날짜 + 요일
                let opt = currentMonth + 1 + ". " + day + ". " + "(" + dayOfWeek + ")";

                // 다른 날짜들 배경색 변경
                $(".day").css("background", "white");
                // 선택한 날짜 배경색 변경
                $(this).css("background", "rgb(242 242 242)");

                // 선택내역, 예매내용 초기화
                $(".ticket_1").html("");
                $(".ticket_a").html("");
                $(".ticket_t").html("총 0매");
                $(".basic").html("0원");
                $(".total").html("0원");
                $(".ticket_info").html(", 총 0매");
                $(".ticket_info_adult").html("");
                $(".ticket_info_teen").html("");
                $(".input_certifyKey").attr("disabled", "true");
                $(".send_certifyKey").val("인증번호 전송");
                $(".input_certifyKey_info").text("");

                // 예매내용 div 에 날짜 추가
                $(".day_info").append(opt);
            });

            $(document).ready(function () {
                $(".name").val("");
                $(".tel").val("");
                $(".email").val("");
                $(".input_certifyKey").val("");
            });

            // 이전달로 이동
            $('.go-prev').on('click', function () {
                thisMonth = new Date(currentYear, currentMonth - 1, 1);
                renderCalender(thisMonth);
            });

            // 다음달로 이동
            $('.go-next').on('click', function () {
                thisMonth = new Date(currentYear, currentMonth + 1, 1);
                renderCalender(thisMonth);
            });
        }

        $(function () {
            let price = 0;
            let adult = 0;
            let teen = 0;
            let tot = 0;
            let opt_date = $(".day_info").text();

            // 결제하기 입력검사
            $(".pay_btn").click(function () {
                    if (price == 0) {
                        alert("예매할 가격/수량을 선택해 주세요.");
                    } else if ($(".name").val() == "") {
                        alert("예매자 성함을 입력해주세요.");
                        $(".name").focus();
                    } else if ($(".tel").val() == "") {
                        alert("연락처를 입력해주세요.");
                        $(".tel").focus();
                    } else if ($(".email").val() == "") {
                        alert("이메일을 입력해주세요.");
                        $(".email").focus();
                    } else if ($(".doubleChk").val() == "false") {
                        alert("휴대폰 인증을 해주세요.");
                    } else {
                        // input[type='hidden']으로 값 넘겨주기
                        $(".pay_price").val(price); // 총 가격
                        $(".pay_tot").val(tot);     // 총 티켓
                        $(".pay_adult").val(adult); // 성인 티켓
                        $(".pay_teen").val(teen);   // 아동청소년 티켓
                        $(".pay_date").val(opt_date);   // 선택 날짜

                        document.form.submit();
                    }
                }
            );

            // 날짜 변경 시 값 초기화
            $(".day.current").click(function () {
                $(".cnt_adult").html(0);
                $(".cnt_teen").html(0);
                price = 0;
                adult = 0;
                teen = 0;
                tot = 0;
            });


            // 성인
            $(".adult .sub").click(function () {
                // 성인 티켓 1장 이상일때만 빼기
                if (adult > 0) {
                    // 콤마 제거 후 더하기
                    price -= Number($(".adult .price").text().replace(",", ""));
                    // 콤마 추가 후 넣어주기
                    let price_c = price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
                    $(".basic").html(price_c + "원");
                    $(".total").html(price_c + "원");

                    adult -= 1; // 성인 티켓 -1
                    tot -= 1;   // 총 티켓 -1

                    $(".cnt_adult").html(adult);

                    // div 에 티켓 -
                    $(".ticket_1").html("총 " + tot + "매");
                    $(".ticket_a").html("성인(" + adult + ")");

                    // 예매내용에 총 티켓 추가
                    $(".ticket_info").html(", 총 " + tot + "매");

                    // 예매내용에 성인티켓 내용 바꾸기
                    $(".ticket_info_adult").html('&nbsp;' + "-" + '&nbsp;' + "성인(" + adult + ")");

                    // 성인 티켓 0장이면 선택내역, 예매내용 div 비우기
                    if (adult == 0) {
                        $(".ticket_a").html("");
                        $(".ticket_info_adult").html("");

                        // 아동 청소년 티켓 있으면 내용 바꾸기
                        if ($(".ticket_info_teen").text().length) { // length -> 0보다 큰 경우 요소가 존재하므로 작업을 수행
                            $(".ticket_info_teen").html('&nbsp;' + "-" + '&nbsp;' + "아동청소년(" + teen + ")");
                        }
                    }
                }
            });

            $(".adult .add").click(function () {
                // 콤마 제거 후 더하기
                price += Number($(".adult .price").text().replace(",", ""));
                // 콤마 추가 후 넣어주기
                let price_c = price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
                $(".basic").html(price_c + "원");
                $(".total").html(price_c + "원");

                adult += 1; // 성인 티켓 +1
                tot += 1;   // 총 티켓 +1

                $(".cnt_adult").html(adult);

                // div 에 티켓 +
                $(".ticket_1").html("총 " + tot + "매");
                $(".ticket_a").html("성인(" + adult + ")");

                // 예매내용에 총 티켓 추가
                $(".ticket_info").html(", 총 " + tot + "매");

                // 아동청소년 티켓 있으면 내용 바꾸기
                if ($(".ticket_info_teen").text().length) {
                    $(".ticket_info_teen").html('&nbsp;' + "아동청소년(" + teen + ")");
                }
                // 예매내용에 성인 티켓 추가
                $(".ticket_info_adult").html('&nbsp;' + "-" + '&nbsp;' + "성인(" + adult + ")");
            });

            // 아동청소년    성인과 같음
            $(".teen .sub").click(function () {
                // 아동청소년 티켓 1장 이상일때만 빼기
                if (teen > 0) {
                    // 콤마 제거
                    price -= Number($(".teen .price").text().replace(",", ""));
                    // 콤마 추가
                    let price_c = price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
                    $(".basic").html(price_c + "원");
                    $(".total").html(price_c + "원");

                    teen -= 1;  // 아동청소년 티켓 -1
                    tot -= 1;   // 총 티켓 +1

                    $(".cnt_teen").html(teen);

                    $(".ticket_1").html("총 " + tot + "매");
                    $(".ticket_t").html("아동청소년(" + teen + ")");

                    $(".ticket_info").html(", 총 " + tot + "매");

                    // 예매내용에 아동청소년티켓 바꾸기
                    // 성인 티켓 있으면
                    if ($(".ticket_info_adult").text().length) {
                        $(".ticket_info_teen").html('&nbsp;' + "아동청소년(" + teen + ")");
                    } else {    // 성인 티켓 없으면
                        $(".ticket_info_teen").html('&nbsp;' + "-" + '&nbsp;' + "아동청소년(" + teen + ")");
                    }

                    // 티켓 0장이면 선택내역, 예매내용 div 비우기
                    if (teen == 0) {
                        $(".ticket_t").html("");
                        $(".ticket_info_teen").html("");
                    }
                }
            });

            $(".teen .add").click(function () {
                // 콤마 제거
                price += Number($(".teen .price").text().replace(",", ""));
                // 콤마 추가
                let price_c = price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
                $(".basic").html(price_c + "원");
                $(".total").html(price_c + "원");

                teen += 1;  // 아동청소년 티켓 +1
                tot += 1;   // 총 티켓 +1

                $(".cnt_teen").html(teen);

                $(".ticket_1").html("총 " + tot + "매");
                $(".ticket_t").html("아동청소년(" + teen + ")");

                $(".ticket_info").html(", 총 " + tot + "매");

                // 예매내용 아동청소년 티켓 추가
                // 성인 티켓 있으면
                if ($(".ticket_info_adult").text().length) {
                    $(".ticket_info_teen").html('&nbsp;' + "아동청소년(" + teen + ")");
                } else {    // 성인 티켓 없으면
                    $(".ticket_info_teen").html('&nbsp;' + "-" + '&nbsp;' + "아동청소년(" + teen + ")");
                }
            });

            // 휴대폰 인증 번호 전송
            var code2 = "";
            $(".send_certifyKey").click(function () {
                    var tel = $(".tel").val();

                    if (tel == "") {
                        $(".input_certifyKey_info").text("전화번호를 입력해주세요.");
                        $(".input_certifyKey_info").css("color", "red");
                        $(".tel").focus();
                    } else {
                        $.ajax({
                            type: "GET",
                            url: "phoneCheck.do",
                            data: {"tel": tel},
                            cache: false,
                            success: function (data) {
                                // 인증번호 전송 실패
                                if (data == "error") {
                                    alert("휴대폰 번호가 올바르지 않습니다.");
                                    $(".input_certifyKey_info").text("유효한 번호를 입력해주세요.");
                                    $(".input_certifyKey_info").css("color", "red");
                                    $(".tel").attr("autofocus", true);
                                } else {    // 인증번호 전송 성공
                                    // 인증번호 재전송시 input 비우기
                                    if ($(".input_certifyKey").val().length) {
                                        $(".input_certifyKey").val("");
                                    }

                                    alert("인증번호 전송 완료");

                                    $(".send_certifyKey").val("인증번호 재전송");

                                    $(".input_certifyKey").attr({
                                        "disabled": false,  // input disabled 풀어주기
                                    });

                                    $(".confirm").css("pointer-events", "auto");

                                    $(".input_certifyKey_info").text("인증번호를 입력한 뒤 확인을 눌러주세요.");
                                    $(".input_certifyKey_info").css("color", "green");

                                    code2 = data;
                                    //alert(data); /////////////////////////////Test
                                }
                            },
                        });
                    }
                }
            );

            //휴대폰 인증번호 대조
            $(".confirm").click(function () {
                if ($(".input_certifyKey").val() == code2) {    // 인증 성공시
                    $(".doubleChk").val("true");
                    $(".certify_tel > div:nth-child(1) > div:nth-child(1) > img:nth-child(1)").css("visibility", "visible");

                    // 휴대폰 인증 비활성화
                    $(".input_certifyKey").val("");
                    $(".input_certifyKey_info").text("");
                    $(".input_certifyKey").attr("disabled", true);
                    $(".send_certifyKey").val("인증번호 전송");
                    $(".send_certifyKey").css("pointer-events", "none");
                    $(".confirm").css("pointer-events", "none");
                } else {
                    $(".input_certifyKey_info").text("인증번호가 일치하지 않습니다.");
                    $(".input_certifyKey_info").css("color", "red");
                    $(".doubleChk").val("false");
                    $(this).attr("autofocus", true);
                }
            });

        });
    </script>
    <style type="text/css">
    	#booking_2_header {
    		width: 1100px;
    		margin: auto;
    	}
    </style>
</head>
<body>
<div id="booking_2_wrap">
    <div id="booking_2_header">
        <div>예매하기</div>
    </div>

    <div id="booking_2_section">
        <div id="booking_2_section_info">
            <div id="booking_2_section_info_img">
                <img src="https://static.wixstatic.com/media/520ee6_f976fc2a823947148ecc1a5b552ff064~mv2.jpg" width="400" height="500">
            </div>
        </div>

        <div id="booking_2_section_payment">
            <div class="sec_cal">
                <div class="cal_nav">
                    <a href="javascript:;" class="nav-btn go-prev">prev</a>
                    <div class="year-month"></div>
                    <a href="javascript:;" class="nav-btn go-next">next</a>
                </div>
                <div class="cal_wrap">
                    <div class="days">
                        <div class="day">MON</div>
                        <div class="day">TUE</div>
                        <div class="day">WED</div>
                        <div class="day">THU</div>
                        <div class="day">FRI</div>
                        <div class="day">SAT</div>
                        <div class="day">SUN</div>
                    </div>
                    <div class="dates"></div>
                </div>
            </div>

            <div class="pay">
                <div class="adult">
                    <div>
                        <div>
                            성인
                        </div>
                        <div class="price">
                            15,000
                        </div>
                        원
                    </div>
                    <div>
                        <button class="price_btn sub">-</button>
                        <div class="price_btn cnt_adult">0</div>
                        <button class="price_btn add">+</button>
                    </div>
                </div>
                <div class="teen">
                    <div>
                        <div>
                            아동청소년
                        </div>
                        <div class="price">
                            12,000
                        </div>
                        원
                    </div>
                    <div>
                        <button class="price_btn sub">-</button>
                        <div class="price_btn cnt_teen">0</div>
                        <button class="price_btn add">+</button>
                    </div>
                </div>
            </div>

            <div id="pay_info">
                <div>
                    선택내역
                </div>
                <div>
                    <div>기본요금</div>
                    <div>
                        <div class="ticket_1">총 0매</div>
                        <div class="ticket_2">
                            <div class="ticket_a"></div>
                            <div class="ticket_t"></div>
                        </div>
                    </div>
                    <div class="basic">0원</div>
                </div>
                <div>
                    <div>합계</div>
                    <div class="total">0원</div>
                </div>
            </div>
            <form action="../booking/booking_3.do" name="form" method="post">
                <div class="reserve_info">
                    <div>

                    </div>
                    <div>
                    	<table style="width: 400px;">
                    		<tr>
                    			<td>예매자 정보</td>
                    			<td align="right" style="width: 25%;">
                    				<img src="image/check_r.png" style="width: 30px; height: 30px; float: left;">
                                	<span">필수입력</span>
                                </td>
                    		</tr>
                    	</table>
                        
                        
                        <!-- 
                        <div>예매자 정보</div>
                        <div>
                            <div>
                                <img src="image/check_r.png">
                                <div>필수입력</div>
                            </div>
                        </div>
                         -->
                    </div>
                    <div>
                        <div>예매자</div>
                        <div><input type="text" name="name" class="name"></div>
                    </div>
                    <div>
                        <div>연락처</div>
                        <div>
                        	<input type="tel" name="tel" class="tel" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                        </div>
                    </div>
                    <div>
                        <div>이메일</div>
                        <div><input type="email" name="email" class="email"></div>
                    </div>
                    <div>
                        <div>예매내용</div>
                        <div>
                            <div class="day_info"></div>
                            <div class="ticket_info"></div>
                            <div class="ticket_info_adult"></div>
                            <div class="ticket_info_teen"></div>
                        </div>
                    </div>
                </div>

                <div class="certify_tel">
                    
                    <div>
                        <div style="width: 35%;">
                            <img src="image/check_g.png">휴대폰 인증
                        </div>
                        <div style="width: 50%;">
                            <input type="button" value="인증번호 전송" class="send_certifyKey"  style="margin-left: 5px;">
                        </div>
                    </div>
                    <div>
                        <div>
                            <input type="text" class="input_certifyKey"
                                   oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" disabled>
                        </div>
                        <div class="input_certifyKey_info">
                        </div>
                        <div>
                            <input type="button" value="확인" class="confirm">
                        </div>
                        <input type="hidden" value="false" name="doubleChk" class="doubleChk"/>
                    </div>
                </div>

                <div>
                    <input type="button" value="결제하기" class="pay_btn">
                </div>

                <%-- 값 넘겨주기 --%>
                <input type="hidden" value="${exhibition}" name="exhibition">
                <input type="hidden" value="" name="price" class="pay_price">
                <input type="hidden" value="" name="tot" class="pay_tot">
                <input type="hidden" value="" name="adult" class="pay_adult">
                <input type="hidden" value="" name="teen" class="pay_teen">
                <input type="hidden" value="" name="date" class="pay_date">
            </form>
        </div>
    </div>

    <div id="booking_2_footer">

    </div>
</div>
</body>
</html>
