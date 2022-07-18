package galleries.controller;

import galleries.bean.ContactDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * @project GalleryHompage_TeamProject
 *
 * @package galleries.controller
 * 
 * @file ContactController.java
 * 
 * @author Ezen_ac_Team_1
 * 
 * @date 2022. 4. 19.
 * 
 * @description ContactController, use lombok
 * 
 */

@Controller("contactController")
@RequiredArgsConstructor
public class ContactController {
	
	private final ContactService contactService;
	
	@RequestMapping("/galleries/contact_write.do")
	public ModelAndView contact_write(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		ContactDTO dto = new ContactDTO();
		dto.setName(request.getParameter("contact_Name"));
		dto.setEmail(request.getParameter("contact_Email"));
		dto.setMessage(request.getParameter("contact_Message"));
		
		int result = contactService.insertContact(dto);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("result", result);
		modelAndView.addObject("dto", dto);
		modelAndView.addObject("ref", "../galleries/contect_write.jsp");
		
		modelAndView.setViewName("../main/index.jsp");
		
		return modelAndView;
	}
}
