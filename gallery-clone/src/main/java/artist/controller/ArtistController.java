package artist.controller;

import artist.dto.*;
import lombok.RequiredArgsConstructor;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class ArtistController {

//    @Autowired
//    ArtistService artistService;

    private final ArtistService artistService;

    @RequestMapping(value = "/artist/artist.do")
    public ModelAndView artistList(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        List<ArtistDTO> list = artistService.getArtistAll();
        modelAndView.addObject("list", list);
        modelAndView.addObject("ref", "../artist/artist.jsp");
        modelAndView.setViewName("/main/index.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "/artist/artist_Json.do")
    public ModelAndView artistListJson(HttpServletRequest request) throws Exception {
        List<ArtistDTO> list = artistService.getArtistAll();

        JSONObject json = new JSONObject();

        JSONArray items = new JSONArray();

        for (int i = 0; i < list.size(); i++) {
            ArtistDTO dto = list.get(i);
            JSONObject item = new JSONObject();
            item.put("eng_name", dto.getEng_name());
            item.put("kor_name", dto.getKor_name());
            item.put("head_img", dto.getHead_img());

            items.put(i, item);
        }
        json.put("items", items);
        System.out.println("json = " + json);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("json", json);
        modelAndView.setViewName("artist_Json.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "/artist/artist_info.do")
    public ModelAndView artist_info(HttpServletRequest request) throws Exception {
        String eng_name = request.getParameter("artist");

        Artist_InfoDTO artist_info = artistService.getArtist_info(eng_name);

        List<Artist_Featured_WorksDTO> artist_works = artistService.getArtist_featured_works(eng_name);

        ModelAndView modelAndView = new ModelAndView();

        modelAndView.addObject("artist_info", artist_info);
        modelAndView.addObject("artist_works", artist_works);

        if (artist_info != null) {
            modelAndView.addObject("ref", "../artist/artist_info.jsp");
        } else {
            modelAndView.addObject("ref", "../main/home.jsp");
        }
        modelAndView.setViewName("/main/index.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "/artist/artist_info_featured_works_Json.do")
    public ModelAndView artist_info_featured_works_Json(HttpServletRequest request) throws Exception {
        String eng_name = request.getParameter("eng_name");

        List<Artist_Featured_WorksDTO> list = artistService.getArtist_featured_works(eng_name);

        JSONObject json = new JSONObject();

        JSONArray items = new JSONArray();

        for (int i = 0; i < list.size(); i++) {
            Artist_Featured_WorksDTO dto = list.get(i);
            JSONObject item = new JSONObject();
            item.put("artist_works", dto.getFeatured_works());

            items.put(i, item);
        }
        json.put("items", items);
        System.out.println("json = " + json);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("json", json);
        modelAndView.setViewName("artist_info_featured_works_Json.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "/artist/artist_info_exhibitions_Json.do")
    public ModelAndView artist_info_exhibitions_Json(HttpServletRequest request) throws Exception {
        String eng_name = request.getParameter("eng_name");

        // 전시회 제목 가져오기
        List<Artist_ExhibitionsDTO> artist_exhibitions_getTitle = artistService.getArtist_exhibitions_titles(eng_name);

        ModelAndView modelAndView = new ModelAndView();

        JSONObject json = new JSONObject();
        JSONArray json_arr = new JSONArray();

        for (int i = 0; i < artist_exhibitions_getTitle.size(); i++) {
            // 전시회 제목 가져오기
            String exhibition_title = artist_exhibitions_getTitle.get(i).getExhibitions_title();
            // 전시회 제목 -> 작품들
            List<Artist_Exhibitions_InfoDTO> artist_exhibitions_info = artistService.getArtist_exhibitions_info(eng_name, exhibition_title);

            JSONArray items = new JSONArray();

            for (int j = 0; j < artist_exhibitions_info.size(); j++) {
                Artist_Exhibitions_InfoDTO dto = artist_exhibitions_info.get(j);
                JSONObject item = new JSONObject();
                item.put("title", dto.getTitle());
                item.put("term", dto.getTerm());
                item.put("works", dto.getWorks());

                items.put(j, item);
            }
            json_arr.put(i, items);
            json.put("json_arr", json_arr);
            System.out.println("json = " + json);
            modelAndView.addObject("json", json);
        }
        modelAndView.setViewName("artist_info_exhibitions_Json.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "/artist/artist_info_news_Json.do")
    public ModelAndView artist_info_news_Json(HttpServletRequest request) throws Exception {
        String eng_name = request.getParameter("eng_name");

        // 전시회 제목들 가져오기
        List<Artist_ExhibitionsDTO> artist_exhibitions_getTitle = artistService.getArtist_exhibitions_titles(eng_name);

        ModelAndView modelAndView = new ModelAndView();

        JSONObject json = new JSONObject();
        JSONArray json_arr = new JSONArray();

        for (int i = 0; i < artist_exhibitions_getTitle.size(); i++) {
            // i번째 전시회 제목
            String exhibition_title = artist_exhibitions_getTitle.get(i).getExhibitions_title();
            // i번째 전시회 제목 -> i번째 전시회 뉴스들
            List<Artist_NewsDTO> artist_news = artistService.getArtist_news(exhibition_title);

            if (artist_news.get(i).getNews_title() != null) {
                JSONArray items = new JSONArray();

                for (int j = 0; j < artist_news.size(); j++) {
                    Artist_NewsDTO dto = artist_news.get(j);
                    JSONObject item = new JSONObject();
                    item.put("title", dto.getExhibitions_title());
                    item.put("term", dto.getExhibitions_term());
                    item.put("news_date", dto.getNews_date());
                    item.put("news_title", dto.getNews_title());
                    item.put("news_img", dto.getNews_img());
                    item.put("news_href", dto.getNews_href());

                    items.put(j, item);
                }
                json_arr.put(i, items);
                json.put("json_arr", json_arr);
                System.out.println("json = " + json);
                modelAndView.addObject("json", json);
            } else {
                continue;
            }
        }

        modelAndView.setViewName("artist_news_Json.jsp");
        return modelAndView;
    }
}

