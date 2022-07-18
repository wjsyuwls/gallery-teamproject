package booking.controller;

import java.util.HashMap;

import booking.dao.BookingDAO;
import booking.dto.BookingDTO;
import lombok.RequiredArgsConstructor;
import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class BookingServiceImpl implements BookingService {

    private final BookingDAO dao;

    // 전화번호 인증번호 생성
    @Override
    public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
        String api_key = "NCSIMKCOX6L9PCIP";
        String api_secret = "PXPXNWJVJW4SNF2ZCMYTRAFTJ1DJBEC6";
        Message coolsms = new Message(api_key, api_secret);

        // 4 params(to, from, type, text) are mandatory. must be filled
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", userPhoneNumber);  // 수신전화번호
        params.put("from", "01071539072");  // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
        params.put("type", "SMS");
        params.put("text", "[TEST] 인증번호는" + "[" + randomNumber + "]" + "입니다."); // 문자 내용 입력
        params.put("app_version", "test app 1.2");  // application name and version
        try {
            JSONObject obj = (JSONObject) coolsms.send(params);
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }
    }

    @Override
    public int insert_booking(BookingDTO dto) {
        return dao.insert_booking(dto);
    }

    @Override
    public int cancel_booking(String name) {
        return dao.cancel_booking(name);
    }
}
