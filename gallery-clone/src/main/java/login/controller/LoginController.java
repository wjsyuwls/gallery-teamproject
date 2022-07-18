package login.controller;

import login.bean.LoginDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequiredArgsConstructor
public class LoginController {

    private final LoginService loginService;

    @RequestMapping(value = "/login/logInForm.do")
    public ModelAndView logInForm(HttpServletRequest request, HttpServletResponse response) throws Exception {

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("ref", "../login/logInForm.jsp");
        modelAndView.setViewName("../main/index.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "/login/logIn.do")
    public ModelAndView logIn(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        String memid = request.getParameter("memid");
        String pw = request.getParameter("pw");

//		System.out.println("memid = " + memid);
//		System.out.println("pw = " + pw);

        LoginDTO dto = loginService.login(memid);

        String message = "";

        if (dto == null) {
            message = "회원정보가 없습니다";
        } else if (!dto.getPw().equals(pw)) {
            message = "비밀번호가 틀렸습니다";
        } else {
            message = "로그인 성공";

            HttpSession session = request.getSession();
            session.setAttribute("memid", memid);
        }

//		System.out.println("dtoPW = " + dto.getPw());

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("message", message);
        modelAndView.addObject("ref", "../login/logIn.jsp");
        modelAndView.setViewName("../main/index.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "/login/logout.do")
    public ModelAndView logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        System.out.println(session.getAttribute("memid"));
        session.removeAttribute("memid");
        session.removeAttribute("Adminid");

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("ref", "../login/logout.jsp");
        modelAndView.setViewName("../main/index.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "/login/joinForm.do")
    public ModelAndView joinForm() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("ref", "../login/joinForm.jsp");
        modelAndView.setViewName("../main/index.jsp");

        return modelAndView;
    }

    @RequestMapping(value = "/login/join.do")
    public ModelAndView join(HttpServletRequest request) throws IOException {
        request.setCharacterEncoding("utf-8");
        String memname = request.getParameter("memname");
        String memid = request.getParameter("memid");
        String pw = request.getParameter("pw");
        String gender = request.getParameter("gender");
        String email1 = request.getParameter("email1");
        String email2 = request.getParameter("email2");
        String phone1 = request.getParameter("phone1");
        String phone2 = request.getParameter("phone2");
        String phone3 = request.getParameter("phone3");
        String addr = request.getParameter("addr");

        LoginDTO dto = new LoginDTO();
        dto.setMemname(memname);
        dto.setMemid(memid);
        dto.setPw(pw);
        dto.setGender(gender);
        dto.setEmail1(email1);
        dto.setEmail2(email2);
        dto.setPhone1(phone1);
        dto.setPhone2(phone2);
        dto.setPhone3(phone3);
        dto.setAddr(addr);

        int result = loginService.join(dto);

        ModelAndView modelAndView = new ModelAndView();

        modelAndView.addObject("result", result);
        modelAndView.addObject("ref", "../login/join.jsp");
        modelAndView.setViewName("../main/index.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "/login/checkId.do")
    public ModelAndView checkId(HttpServletRequest request) {
        String memid = request.getParameter("memid");

        boolean exist = loginService.isExistId(memid);

        ModelAndView modelAndView = new ModelAndView();

        modelAndView.addObject("memid", memid);
        modelAndView.addObject("exist", exist);
        modelAndView.setViewName("../login/checkId.jsp");

        return modelAndView;
    }

    @RequestMapping(value = "/login/deleteForm.do")
    public ModelAndView deleteForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        String memid = request.getParameter("memid");
        String pw = request.getParameter("pw");

        LoginDTO dto = loginService.login(memid);

        String message = "";

        if (dto == null) {
            message = "회원정보가 없습니다";
        } else if (!dto.getPw().equals(pw)) {
            message = "비밀번호가 틀렸습니다";
        } else {
            message = "탈퇴하시겠습니까?";
        }

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("memid", memid);
        modelAndView.addObject("message", message);
        modelAndView.addObject("ref", "../login/deleteForm.jsp");
        modelAndView.setViewName("../main/index.jsp");

        return modelAndView;
    }

    @RequestMapping(value = "/login/delete.do")
    public ModelAndView delete(HttpServletRequest request) {
        String memid = request.getParameter("memid");

        int result = loginService.delete(memid);

        ModelAndView modelAndView = new ModelAndView();

        modelAndView.addObject("result", result);
        modelAndView.addObject("ref", "../login/delete.jsp");
        modelAndView.setViewName("../main/index.jsp");
        return modelAndView;
    }
}
