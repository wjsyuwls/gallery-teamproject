package booking.controller;

import booking.dto.BookingDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;

@Controller
@RequiredArgsConstructor
public class BookingController {

    private final BookingService bookingService;

    @RequestMapping(value = "/booking/booking_1.do")
    public ModelAndView booking_1() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("ref", "../booking/booking_1.jsp");
        modelAndView.setViewName("/main/index.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "/booking/booking_2.do")
    public ModelAndView booking_2() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("ref", "../booking/booking_2.jsp");
        modelAndView.setViewName("/main/index.jsp");
        return modelAndView;
    }

    // 전화번호 인증
    @RequestMapping(value = "/booking/phoneCheck.do")
    @ResponseBody
    public String sendSMS(@RequestParam("tel") String userPhoneNumber) {    // 휴대폰 문자보내기
        int randomNumber = (int) ((Math.random() * (9999 - 1000 + 1)) + 1000);  //난수 생성
        bookingService.certifiedPhoneNumber(userPhoneNumber, randomNumber);
        return Integer.toString(randomNumber);
    }

    @RequestMapping(value = "/booking/booking_3.do")
    public ModelAndView booking_3(HttpServletRequest request) {
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        int price = Integer.parseInt(request.getParameter("price"));    // 총 가격
        int tot = Integer.parseInt(request.getParameter("tot"));        // 총 티켓
        int adult = Integer.parseInt(request.getParameter("adult"));    // 성인 티켓
        int teen = Integer.parseInt(request.getParameter("teen"));      // 아동청소년 티켓
        String date = request.getParameter("date");                     // 선택 날짜
        String name = request.getParameter("name");                     // 예매자
        int tel = Integer.parseInt(request.getParameter("tel"));        // 연락처
        String email = request.getParameter("email");                   // 이메일

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("price", price);
        modelAndView.addObject("tot", tot);
        modelAndView.addObject("adult", adult);
        modelAndView.addObject("teen", teen);
        modelAndView.addObject("date", date);
        modelAndView.addObject("name", name);
        modelAndView.addObject("tel", tel);
        modelAndView.addObject("email", email);

        modelAndView.addObject("ref", "../booking/booking_3.jsp");
        modelAndView.setViewName("/main/index.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "/booking/booking_modify_tel.do")
    public ModelAndView booking_modify_tel(HttpServletRequest request) {
        int tel = Integer.parseInt(request.getParameter("tel"));

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("tel", tel);
        modelAndView.setViewName("booking_modify_tel.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "/booking/booking_modify_email.do")
    public ModelAndView booking_modify_email(HttpServletRequest request) {
        String email = request.getParameter("email");

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("email", email);
        modelAndView.setViewName("booking_modify_email.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "/booking/booking_ok.do")
    public ModelAndView booking_OK(HttpServletRequest request) {
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        int price = Integer.parseInt(request.getParameter("price"));
        int tot = Integer.parseInt(request.getParameter("tot"));
        int adult = Integer.parseInt(request.getParameter("adult"));
        int teen = Integer.parseInt(request.getParameter("teen"));
        String date = request.getParameter("date");
        String name = request.getParameter("name");
        int tel = Integer.parseInt(request.getParameter("tel"));
        String email = request.getParameter("email");

        BookingDTO dto = new BookingDTO();
        dto.setPrice(price);
        dto.setTot(tot);
        dto.setAdult(adult);
        dto.setTeen(teen);
        dto.setSchedule(date);
        dto.setName(name);
        dto.setTel(tel);
        dto.setEmail(email);

        int result = bookingService.insert_booking(dto);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("price", price);
        modelAndView.addObject("tot", tot);
        modelAndView.addObject("adult", adult);
        modelAndView.addObject("teen", teen);
        modelAndView.addObject("date", date);
        modelAndView.addObject("name", name);
        modelAndView.addObject("tel", tel);
        modelAndView.addObject("email", email);
        modelAndView.addObject("result", result);

        modelAndView.addObject("ref", "../booking/booking_ok.jsp");
        modelAndView.setViewName("/main/index.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "/booking/booking_cancel.do")
    public ModelAndView booking_cancel(HttpServletRequest request) {
        String name = request.getParameter("name");

        int result = bookingService.cancel_booking(name);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("result", result);
        modelAndView.setViewName("booking_cancel.jsp");
        return modelAndView;
    }
}
