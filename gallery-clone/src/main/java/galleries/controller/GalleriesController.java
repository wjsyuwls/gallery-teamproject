package galleries.controller;

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
 * @file GalleriesController.java
 * 
 * @author Ezen_ac_Team_1
 * 
 * @date 2022. 4. 19.
 * 
 * @description GalleriesController Class, use lombok
 * 
 */

@Controller
@RequiredArgsConstructor
public class GalleriesController {
	
	private final GalleriesService galleriesService;
	
	// galleries의 About 클릭시 호출
	@RequestMapping("/galleries/galleries_About.do")
	public ModelAndView moveGalleries_About() {
		
		String about_Content = galleriesService.selectAbout();
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("ref", "../galleries/galleries_About.jsp");
		modelAndView.addObject("about_Content", about_Content);

		modelAndView.setViewName("../main/index.jsp");
		
		return modelAndView;
	}
	
	// galleries의 BK_Hannam 클릭시 호출 
	@RequestMapping("/galleries/galleries_BK_Hannam.do")
	public ModelAndView moveGalleries_BK_Hannam() {

		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("ref", "../galleries/galleries_BK_Hannam.jsp");
		
		modelAndView.setViewName("../main/index.jsp");
		
		return modelAndView;
	}
	
	// galleries의 BK_Iteawon 클릭시 호출
	@RequestMapping("/galleries/galleries_BK_Itaewon.do")
	public ModelAndView moveGalleries_BK_Itaewon() {
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("ref", "../galleries/galleries_BK_Itaewon.jsp");
		
		modelAndView.setViewName("../main/index.jsp");
		
		return modelAndView;
	}
	
	// galleries의 Internship 클릭시 호출
	@RequestMapping("/galleries/galleries_Internship.do")
	public ModelAndView moveGalleries_Internship() {
		
		String internship_Content = galleriesService.selectInternship();
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("ref", "../galleries/galleries_Internship.jsp");
		modelAndView.addObject("internship_Content", internship_Content);
		
		modelAndView.setViewName("../main/index.jsp");
		
		return modelAndView;
	}
	
	// galleries의 Contact 클릭시 호출
	@RequestMapping("/galleries/galleries_Contact.do")
	public ModelAndView moveGalleries_Contact() {
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("ref", "../galleries/galleries_Contact.jsp");
		
		modelAndView.setViewName("../main/index.jsp");
		
		return modelAndView;
	}
	
	// galleries의 About의 글 쓰기 클릭시 호출
	@RequestMapping("/galleries/galleries_About_WriteForm.do")
	public ModelAndView galleries_About_WriteForm() {
		
		String about_Content = galleriesService.selectAbout();
		
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("ref", "../galleries/galleries_About_WriteForm.jsp");
		modelAndView.addObject("about_Content", about_Content);
		
		modelAndView.setViewName("../main/index.jsp");
		
		return modelAndView;
	}
	
	// galleries의 About의 글 쓰기의 저장 버튼 클릭시 호출
	@RequestMapping("/galleries/galleries_About_Write.do")
	public ModelAndView galleries_About_Write(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		int result = galleriesService.updateAbout(request.getParameter("about_Content"));
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("ref", "../galleries/galleries_About_Write.jsp");
		modelAndView.addObject("result", result);
		
		modelAndView.setViewName("../main/index.jsp");
		
		return modelAndView;
	}
	
	// galleries의 Internship의 글 쓰기 버튼 클릭시 호출
	@RequestMapping("/galleries/galleries_Internship_WriteForm.do")
	public ModelAndView galleries_Internship_WriteForm() {
		
		String internship_Content = galleriesService.selectInternship();
		
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("ref", "../galleries/galleries_Internship_WriteForm.jsp");
		modelAndView.addObject("internship_Content", internship_Content);
		
		modelAndView.setViewName("../main/index.jsp");
		
		return modelAndView;
	}
	
	// galleries의 Internship의 글 쓰기의 저장 버튼 클릭시 호출
	@RequestMapping("/galleries/galleries_Internship_Write.do")
	public ModelAndView galleries_Internship_Write(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		int result = galleriesService.updateInternship(request.getParameter("internship_Content"));
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("ref", "../galleries/galleries_Internship_Write.jsp");
		modelAndView.addObject("result", result);
		
		modelAndView.setViewName("../main/index.jsp");
		
		return modelAndView;
	}
}
