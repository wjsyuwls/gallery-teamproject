package booking.dto;

import lombok.Data;

@Data
public class BookingDTO {
    private int price;           //-- 총 가격
    private int tot;             //-- 총 티켓	성인 + 아동청소년
    private int adult;           //-- 성인 티켓
    private int teen;            //-- 아동청소년 티켓
    private String schedule;     //-- 예약 날짜
    private String name;         //-- 예약자
    private int tel;             //-- 전화번호
    private String email;        //	-- 이메일
}
