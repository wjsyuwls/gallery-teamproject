package artFairs.controller;

import artFairs.bean.ArtFairsDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

/**
 * @project GalleryHompage_TeamProject
 *
 * @package artFairs.controller
 * 
 * @file ArtFairsController.java
 * 
 * @author Ezen_ac_Team_1
 * 
 * @date 2022. 4. 19.
 * 
 * @description ArtFairsController, use lombok
 * 
 */

@Controller
@RequiredArgsConstructor
public class ArtFairsController {

	private final ArtFairsService artFairsService;

	@RequestMapping("/artFairs/artFairsMain.do")
	public ModelAndView atrFairsMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<ArtFairsDTO> list = artFairsService.getAtrFairsMain();
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", list);
		modelAndView.addObject("ref", "../artFairs/artFairsMain.jsp");
	    modelAndView.setViewName("../main/index.jsp");
		return modelAndView;
	}
	
	@RequestMapping("/artFairs/artFairsView.do")
	public ModelAndView atrFairsView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String title = request.getParameter("title");

		// 페어정보 가져오기
		ArtFairsDTO dto = artFairsService.getAtrFairsView(title);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("dto", dto);

		// 추가사진 개수에 따라 cnt값 다르게 넘김
		if(dto.getImg_src1().equals("../storage/") || dto.getImg_src1() == null) {
			modelAndView.addObject("cnt", 0);
		} else if (dto.getImg_src2().equals("../storage/") || dto.getImg_src2() == null) {
			modelAndView.addObject("cnt", 1);
		} else if (dto.getImg_src3().equals("../storage/") || dto.getImg_src3() == null) {
			modelAndView.addObject("cnt", 2);
		} else {
			modelAndView.addObject("cnt", 3);
		}
		modelAndView.addObject("ref", "../artFairs/artFairsView.jsp");
		modelAndView.setViewName("../main/index.jsp");
		return modelAndView;
	}
	
	@RequestMapping("/artFairs/artFairsWriteForm.do")
	public ModelAndView artFairsWriteForm(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("ref", "../artFairs/artFairsWriteForm.jsp");
	    modelAndView.setViewName("../main/index.jsp");
		return modelAndView;
	}

	@RequestMapping("/artFairs/artFairsWrite.do")
	public ModelAndView artFairsWrite(MultipartHttpServletRequest request, MultipartFile mainimg_src, MultipartFile detailimg_src,
															MultipartFile img_src1, MultipartFile img_src2, MultipartFile img_src3){
	      String filePath = request.getSession().getServletContext().getRealPath("/storage");      
	      System.out.println(filePath);
	      
	      String filesName1 = mainimg_src.getOriginalFilename();
	      String filesName2 = detailimg_src.getOriginalFilename();
	      String filesName3 = img_src1.getOriginalFilename();
	      String filesName4 = img_src2.getOriginalFilename();
	      String filesName5 = img_src3.getOriginalFilename();
	      
	      File file1 = new File(filePath, filesName1);
	      File file2 = new File(filePath, filesName2);
	      File file3 = new File(filePath, filesName3);
	      File file4 = new File(filePath, filesName4);
	      File file5 = new File(filePath, filesName5);
	      
	      try {
	         FileCopyUtils.copy(mainimg_src.getInputStream(), new FileOutputStream(file1));
	         FileCopyUtils.copy(detailimg_src.getInputStream(), new FileOutputStream(file2));
	         FileCopyUtils.copy(img_src1.getInputStream(), new FileOutputStream(file3));
	         FileCopyUtils.copy(img_src2.getInputStream(), new FileOutputStream(file4));
	         FileCopyUtils.copy(img_src3.getInputStream(), new FileOutputStream(file5));
	      } catch (FileNotFoundException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	    
	      ArtFairsDTO dto = new ArtFairsDTO();
	      dto.setTitle(request.getParameter("title"));
	      dto.setAfdate(request.getParameter("afdate"));
	      dto.setInfo_date(request.getParameter("info_date"));
	      dto.setInfo(request.getParameter("info"));
	      dto.setPlace(request.getParameter("place"));
	      dto.setPlace_detail(request.getParameter("place_detail"));
	      dto.setArtists(request.getParameter("artists"));
	      dto.setArtist_name(request.getParameter("artist_name"));
	      
	      dto.setMainimg_src(("../storage/" + filesName1));
	      dto.setDetailimg_src(("../storage/" + filesName2));
	      dto.setImg_src1(("../storage/" + filesName3));
	      dto.setImg_src2(("../storage/" + filesName4));
	      dto.setImg_src3(("../storage/" + filesName5));
	      
	      int result = artFairsService.insertArtFairs(dto);
	      
	      ModelAndView modelAndView = new ModelAndView();
	      modelAndView.addObject("result", result);
	      modelAndView.addObject("ref", "../artFairs/artFairsWrite.jsp");
	      modelAndView.setViewName("../main/index.jsp");
	      return modelAndView;
	   }
	
	@RequestMapping("/artFairs/artFairsModifyForm.do")
	public ModelAndView artFairsModifyForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String title = request.getParameter("title");

		ArtFairsDTO dto = artFairsService.getAtrFairsView(title);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("dto", dto);
		modelAndView.addObject("ref", "../artFairs/artFairsModifyForm.jsp");
		modelAndView.setViewName("../main/index.jsp");
		return modelAndView;
	}
	
	@RequestMapping("/artFairs/artFairsModify.do")
	public ModelAndView artFairsModify(MultipartHttpServletRequest request, MultipartFile mainimg_src,
			MultipartFile detailimg_src, MultipartFile img_src1, MultipartFile img_src2, MultipartFile img_src3) {
		/*
		 * 전체수정
		 */
		String filePath = request.getSession().getServletContext().getRealPath("/storage");      
       
        String filesName1 = mainimg_src.getOriginalFilename();
        String filesName2 = detailimg_src.getOriginalFilename();
        String filesName3 = img_src1.getOriginalFilename();
        String filesName4 = img_src2.getOriginalFilename();
        String filesName5 = img_src3.getOriginalFilename();

        File file1 = new File(filePath, filesName1);
        File file2 = new File(filePath, filesName2);
        File file3 = new File(filePath, filesName3);
        File file4 = new File(filePath, filesName4);
        File file5 = new File(filePath, filesName5);
       
        try {
           FileCopyUtils.copy(mainimg_src.getInputStream(), new FileOutputStream(file1));
           FileCopyUtils.copy(detailimg_src.getInputStream(), new FileOutputStream(file2));
           FileCopyUtils.copy(img_src1.getInputStream(), new FileOutputStream(file3));
           FileCopyUtils.copy(img_src2.getInputStream(), new FileOutputStream(file4));
           FileCopyUtils.copy(img_src3.getInputStream(), new FileOutputStream(file5));
        } catch (FileNotFoundException e) {
           e.printStackTrace();
        } catch (IOException e) {
           e.printStackTrace();
        }
     
        ArtFairsDTO dto = new ArtFairsDTO();
        dto.setTitle(request.getParameter("title"));
        dto.setAfdate(request.getParameter("afdate"));
        dto.setInfo_date(request.getParameter("info_date"));
        dto.setInfo(request.getParameter("info"));
        dto.setPlace(request.getParameter("place"));
        dto.setPlace_detail(request.getParameter("place_detail"));
        dto.setArtists(request.getParameter("artists"));
        dto.setArtist_name(request.getParameter("artist_name"));
        dto.setMainimg_src(("../storage/" + filesName1));
        dto.setDetailimg_src(("../storage/" + filesName2));
        dto.setImg_src1(("../storage/" + filesName3));
        dto.setImg_src2(("../storage/" + filesName4));
        dto.setImg_src3(("../storage/" + filesName5));
           
        int result = artFairsService.updateArtFairs(dto);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("title", dto.getTitle());
		modelAndView.addObject("result", result);
		modelAndView.addObject("ref", "../artFairs/artFairsModify.jsp");
		modelAndView.setViewName("../main/index.jsp");
		return modelAndView;
	}
	/*
	 * delete 추가되었어요!
	 */
	@RequestMapping(value = "/artFairs/artFairsDeleteForm.do")
	public ModelAndView artFairsDeleteForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String title = request.getParameter("title");

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("title", title);
		modelAndView.addObject("ref", "../artFairs/artFairsDeleteForm.jsp");
		modelAndView.setViewName("../main/index.jsp");
		return modelAndView;
	}

	@RequestMapping(value = "/artFairs/artFairsDelete.do")
	public ModelAndView artFairsDelete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String title = request.getParameter("title");

		int result = artFairsService.deleteArtFairs(title);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.addObject("title", title);
		modelAndView.addObject("ref", "../artFairs/artFairsDelete.jsp");
		modelAndView.setViewName("../main/index.jsp");
		return modelAndView;
	}
}
