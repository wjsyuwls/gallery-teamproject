package exhibition.controller;

import exhibition.bean.ExDTO;
import exhibition.bean.GroupImgDTO;
import exhibition.bean.GroupInfoDTO;
import exhibition.bean.SoloDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @project GalleryHompage_TeamProject
 *
 * @package artFairs.bean
 * 
 * @file ArtFairsDTO.java
 * 
 * @author Ezen_ac_Team_1
 * 
 * @date 2022. 4. 19.
 * 
 * @description exhibitions의 data 처리를 담당하는 Controller Class
 * 
 */

@Controller
@RequiredArgsConstructor
public class ExController {
	
   private final ExService exService;
   
   @RequestMapping("/main/home.do")
	public ModelAndView home(HttpServletRequest request) {
		List<ExDTO> list_2220 = exService.exList_2220();
		
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("list_2220", list_2220);
		modelAndView.addObject("ref", "../main/home.jsp");
		modelAndView.setViewName("../main/index.jsp");
		return modelAndView;
	}
   
   @RequestMapping("/exhibition/exhibition.do")
   public ModelAndView exList(HttpServletRequest request) {
      
      List<ExDTO> list_2220 = exService.exList_2220();
      List<ExDTO> list_1917 = exService.exList_1917();
      List<ExDTO> list_1614 = exService.exList_1614();
      List<ExDTO> list_1311 = exService.exList_1311();
      
      ModelAndView modelAndView = new ModelAndView();
      modelAndView.addObject("list_2220", list_2220);
      modelAndView.addObject("list_1917", list_1917);
      modelAndView.addObject("list_1614", list_1614);
      modelAndView.addObject("list_1311", list_1311);
      modelAndView.addObject("ref", "../exhibition/exhibition.jsp");
      modelAndView.setViewName("../main/index.jsp");
      return modelAndView;
   }

   @RequestMapping("/exhibition/exhibitionDetail.do")
   public ModelAndView getSingle(HttpServletRequest request) {
      int seq = Integer.parseInt(request.getParameter("seq"));
      
      /* 필요한 변수들 선언 */
      ModelAndView modelAndView = new ModelAndView();

      /* 그룹전 */
      GroupInfoDTO g_info_dto = new GroupInfoDTO();
      // 작가별로 이미지를 담을 리스트
      List<GroupImgDTO> art = null;
      // 이미지가 담겨있는 리스트를 담을 리스트
      List<List<GroupImgDTO>> list = new ArrayList<List<GroupImgDTO>>();   
      //이름 나눠서 이름을 리스트에 담기
      String artistName = null;
      String[] nameElements = null;
      List<String> nameList = null;      
      
      /*그룹전끝*/
      
      /*개인전*/
      SoloDTO s_dto = null;
      //작업사진
      String works_imgString = null;
      String[] works_imgElement = null;
      List<String> works_img = null;
      /*개인전끝*/
      
      //메인사진 나눌때
      String main_img = null;
      String[] img = null;
      
      
      //《The Hidden Masterpice》
      if(seq==1) {
         /* 작품 사진을 제외한 정보들 불러오기 */
         g_info_dto = exService.getInfo(seq);   
   
         /* 작가 사진불러서 리스트에 담기 */
         art = exService.getImg(1, 4);
         list.add(art);      
         art = exService.getImg(5, 8);
         list.add(art);
         art = exService.getImg(9, 10);
         list.add(art);         
         art = exService.getImg(11, 14);
         list.add(art);            
         art = exService.getImg(15, 18);
         list.add(art);            
         art = exService.getImg(19, 23);
         list.add(art);
         art = exService.getImg(24, 27);
         list.add(art);
         art = exService.getImg(28, 35);
         list.add(art);
         art = exService.getImg(36, 39);
         list.add(art);
         art = exService.getImg(40, 45);
         list.add(art);
         art = exService.getImg(46, 48);
         list.add(art);
         art = exService.getImg(49, 52);
         list.add(art);
         art = exService.getImg(53, 56);
         list.add(art);
         art = exService.getImg(57, 58);
         list.add(art);
         
         // 작가이름 각각 나눠 배열에 저장 후 리스트 담기
         artistName = g_info_dto.getArtistName();
         nameElements = artistName.split(", ");
         nameList = Arrays.asList(nameElements); 
         
         //메인 사진 나눠서 배열에 저장
         main_img = g_info_dto.getMain_img().replace("      ", "");
         img = main_img.split("#");

         //전체 데이터 전송
         modelAndView.addObject("dto", g_info_dto);
         
         // 작가이름이 담겨있는 리스트 전달
         modelAndView.addObject("nameList",nameList); 
         
         // 메인 이미지 쪼개서 전달
         modelAndView.addObject("img", img);
         
         // 작가사진 담겨있는 리스트
         modelAndView.addObject("list",list);
         modelAndView.addObject("ref", "../exhibition/exhibition_detail_group.jsp");
      
      //《Utopia : now here》
      } else if(seq==2) {
         g_info_dto = exService.getInfo(seq);
         
         art = exService.getImg(59, 62);
         list.add(art);
         art = exService.getImg(63, 67);
         list.add(art);
         art = exService.getImg(68, 74);
         list.add(art);
         
         // 작가이름 각각 나눠 배열에 저장
         artistName = g_info_dto.getArtistName();
         nameElements = artistName.split(", ");
         nameList = Arrays.asList(nameElements);

         //메인 사진 나눠서 배열에 저장
         main_img = g_info_dto.getMain_img().replace("      ", "");
         img = main_img.split("#");

         //전체 데이터 전송
         modelAndView.addObject("dto", g_info_dto);
         //System.out.println(g_info_dto.getIntro_content());
         // 작가 이름만 쪼개서 전달
         modelAndView.addObject("nameList",nameList);
         // 메인 이미지 쪼개서 전달
         modelAndView.addObject("img", img);
         //작품사진리스트
         modelAndView.addObject("list",list);            
         modelAndView.addObject("ref", "../exhibition/exhibition_detail_group.jsp");
      
      //《Painting and Thereafter》
      } else if(seq==3) {
         g_info_dto = exService.getInfo(seq);

         art = exService.getImg(75, 82);
         list.add(art);
         art = exService.getImg(83, 89);
         list.add(art);
         art = exService.getImg(90, 96);
         list.add(art);

         // 작가이름 각각 나눠 배열에 저장
         artistName = g_info_dto.getArtistName();
         nameElements = artistName.split(", ");
         nameList = Arrays.asList(nameElements);

         // 메인 사진 나눠서 배열에 저장
         main_img = g_info_dto.getMain_img().replace("      ", "");
         img = main_img.split("#");

         // 전체 데이터 전송
         modelAndView.addObject("dto", g_info_dto);
         // System.out.println(g_info_dto.getIntro_content());
         // 작가 이름만 쪼개서 전달
         modelAndView.addObject("nameList", nameList);
         // 메인 이미지 쪼개서 전달
         modelAndView.addObject("img", img);
         // 작품사진리스트
         modelAndView.addObject("list", list);
         modelAndView.addObject("ref", "../exhibition/exhibition_detail_group.jsp");
      
      //《DECONSTRUCTIVISM》
      } else if(seq==11) {
         g_info_dto = exService.getInfo(seq);
         
         art = exService.getImg(97, 100);
         list.add(art);
         art = exService.getImg(101, 104);
         list.add(art);
         art = exService.getImg(105, 109);
         list.add(art);
         art = exService.getImg(110, 112);
         list.add(art);
         art = exService.getImg(113, 120);
         list.add(art);
         art = exService.getImg(121, 125);
         list.add(art);
         art = exService.getImg(126, 126);
         list.add(art);
   
         // 작가이름 각각 나눠 배열에 저장
         artistName = g_info_dto.getArtistName();
         nameElements = artistName.split(", ");
         nameList = Arrays.asList(nameElements);
   
         //메인 사진 나눠서 배열에 저장
         main_img = g_info_dto.getMain_img().replace("      ", "");
         img = main_img.split("#");
   
         //전체 데이터 전송
         modelAndView.addObject("dto", g_info_dto);
         //System.out.println(g_info_dto.getIntro_content());
         // 작가 이름만 쪼개서 전달
         modelAndView.addObject("nameList",nameList);
         // 메인 이미지 쪼개서 전달
         modelAndView.addObject("img", img);
         //작품사진리스트
         modelAndView.addObject("list",list);            
         modelAndView.addObject("ref", "../exhibition/exhibition_detail_group.jsp");
      
      //《북경춘신》
      } else if(seq==14) {
         g_info_dto = exService.getInfo(seq);
         
         art = exService.getImg(134, 144);
         list.add(art);
         art = exService.getImg(145, 150);
         list.add(art);
         art = exService.getImg(151, 160);
         list.add(art);
         // 작가이름 각각 나눠 배열에 저장
         artistName = g_info_dto.getArtistName();
         nameElements = artistName.split(", ");
         nameList = Arrays.asList(nameElements);
   
         //메인 사진 나눠서 배열에 저장
         main_img = g_info_dto.getMain_img().replace("      ", "");
         img = main_img.split("#");
   
         //전체 데이터 전송
         modelAndView.addObject("dto", g_info_dto);
         // 작가 이름만 쪼개서 전달
         modelAndView.addObject("nameList",nameList);
         // 메인 이미지 쪼개서 전달
         modelAndView.addObject("img", img);
         //작품사진리스트
         modelAndView.addObject("list",list);            
         modelAndView.addObject("ref", "../exhibition/exhibition_detail_group.jsp");
      } else {
         s_dto = exService.getSoloInfo(seq);
         
         if(s_dto == null) {	// 데이터 값이 없을경우 index.jsp로 돌아간다
        	 modelAndView.addObject("ref", "../main/welcome.jsp");
         }
        
         else {					// 데이터가 있을경우 페이지 이동
	         main_img = s_dto.getMain_img();
	         img = main_img.split("#");
	         works_imgString = s_dto.getWorks_img();
	         works_imgElement = works_imgString.split("#");
	         works_img = Arrays.asList(works_imgElement);
	         
	         
	         modelAndView.addObject("dto",s_dto);
		     modelAndView.addObject("img",img);
		     modelAndView.addObject("works_img",works_img);
		     modelAndView.addObject("ref","../exhibition/exhibition_detail_solo.jsp");
         }
      }   
      /*인덱스 화면으로 리턴*/
      modelAndView.setViewName("../main/index.jsp");
      return modelAndView;
   }
   
}