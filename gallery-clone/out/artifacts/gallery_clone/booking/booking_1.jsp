<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="../css/galleries_Frame.css">
    <link rel="stylesheet" type="text/css" href="../css/booking_1.css?v=0.4">
    <script type="text/javascript">
        document.title = "Restoration of Relationships";
    </script>
    <style type="text/css">
    	#booking_1_header {
    		width: 1100px;
    		margin: auto;
    	}
    </style>
</head>
<body>
<div id="booking_1_wrap">
    <div id="booking_1_header">
        <div>전시예매</div>
    </div>

    <div id="booking_1_section">
        <div id="booking_1_section_info">
            <div id="booking_1_section_info_img">
                <img src="https://static.wixstatic.com/media/520ee6_f976fc2a823947148ecc1a5b552ff064~mv2.jpg"
                     width="400"
                     height="500">
            </div>
            <div id="booking_1_section_info_text">
                <div>
                    Restoration of Relationships
                </div>
                <div>
                    Gallery BK Hannam에서 오는 3월 11일부터 4월 8일까지 국내작가 박윤경의
                    Restoration of Relationships 전을 개최한다. 박윤경은 지금 시대에 함께 호흡할 수 있는 회화를 연구하면서 회화 자체의 본질과 의미를 확장하는 실험을
                    진행하고 소통 불가능한 언어에 대하여 이야기 하고자 한다. 한 층 더 확장된 박윤경만의 다채로운 화면을 BK Hannam 1층에서 소개한다. <br><br>

                    박윤경의 작업에서 우리가 쉽게 떠올리는 불투명한 캔버스 천을 찾아볼 수 없지만, 쉬폰이나 실크, 샤워 커튼 등의 투명한 재질 위에 그리는 행위를 차곡차곡 기록하며 회화에는
                    시간에 따른 중첩된 색채가 감지된다. 캔버스 프레임은 그 자체로 화면에 드러나게 되고 그 위에서는 선, 붓질 등 다양한 작업이 이루어진다. 단순히 보조역할로 이루어졌던
                    프레임은 회화의 주체로 드러난다. 2차원의 회화를 ‘벽’이 아닌 ‘공간’에 설치 구성하여 3차원의 회화로 보여줌으로써 과거 평면 회화 전시가 가지고 있는 권위를 해체하는
                    동시에 모든 요소가 평등한 관계를 맺은 공간을 만들어낸다. 그렇게 드로잉과 페인팅은 화면에 반복되며 쌓여가고 3차원적으로 공간에 설치되며 회화의 객체와 주체가 사라진 평등한
                    회화를 선보인다.
                </div>
                <div>
                    <input type="button" value="예매하기" onclick="location.href='booking_2.do'" class="go_booking_2_btn">
                </div>
            </div>
        </div>
        <div id="booking_1_section_gallery_info">
            <div>
                <div>
                    <a href="https://map.naver.com/v5/directions/-/126.981707,37.5641952,%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C%20%EC%A4%91%EA%B5%AC%20%EB%82%A8%EB%8C%80%EB%AC%B8%EB%A1%9C2%EA%B0%80%20130%20%EC%97%90%EB%B9%84%EB%89%B4%EC%97%98%209%EC%B8%B5/-/transit?c=14135538.9633001,4518042.8281463,15,0,0,0,dh"
                       target="_blank">↯&emsp;&emsp;길찾기</a>
                </div>
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3163.899883973325!2d126.99899031563297!3d37.53385723375612!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca3f9ec7e1843%3A0xc3583205649aebb1!2sGallery%20BK!5e0!3m2!1sko!2skr!4v1649382002567!5m2!1sko!2skr"
                        width="450" height="450" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
                </iframe>
            </div>
            <div>
                <div>
                    <img alt="BK_Hannam" src="../image/bk_Hannam.jpg" width="450" height="350">
                </div>
                <div>
                    <table>
                        <tr>
                            <td class="fixed">ADDRESS</td>
                        </tr>
                        <tr>
                            <td>
                                25, Daesagwan-ro
                                Yongsan-gu, Seoul, Korea
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                        </tr>

                        <tr>
                            <td class="fixed">OPENING HOURS</td>
                        </tr>
                        <tr>
                            <td>
                                Tuesday to Sunday: 11am - 7pm
                                (Closed on Mondays)
                            </td>
                        </tr>
                        <tr>
                            <td>*Lunch Break: 1pm - 2pm</td>
                        </tr>
                        <tr>
                            <td style="padding-top: 15px">
                                For general inquires,
                            </td>
                        </tr>
                        <tr>
                            <td>
                                please email info@gallerybk.co.kr
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

        <form action="../galleries/contact_write.do" id="table_Frame" name="contact_Form">
            <table id="contact_Table">
                <tr>
                    <td colspan="2" id="table_label">
                        <label>CONTACT</label>
                    </td>
                </tr>

                <tr>
                    <td id="table_input">
                        <!-- required : 해당 속성으로 입력검사를 해줄수 있음 -->
                        <!-- 이름 입력 -->
                        <input type="text" id="name" name="contact_Name" placeholder="Name" required="required">
                    </td>
                    <td>
                        <!-- 이메일 입력 -->
                        <input type="email" id="email" name="contact_Email" placeholder="Email" required="required">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" id="table_textarea">
                        <!-- 메시지 입력 -->
                        <textarea rows="8em" cols="100em" id="message" name="contact_Message" placeholder="Message"
                                  required="required"></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" id="table_submit">
                        <input type="submit" value="submit" id="submit_Btn">
                    </td>
            </table>
        </form>
    </div>

    <div id="booking_1_footer">

    </div>
</div>
</body>
</html>
