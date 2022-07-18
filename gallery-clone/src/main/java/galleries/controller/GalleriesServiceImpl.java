package galleries.controller;

import galleries.dao.GalleriesDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * @project GalleryHompage_TeamProject
 *
 * @package galleries.controller
 * 
 * @file GalleriesServiceImpl.java
 * 
 * @author Ezen_ac_Team_1
 * 
 * @date 2022. 4. 19.
 * 
 * @description galleries의 글 쓰기, 글 수정을 위한 GalleriesServiceImpl Class
 * 
 */

@Service
@RequiredArgsConstructor
public class GalleriesServiceImpl implements GalleriesService {
	
	private final GalleriesDAO dao;
	
	@Override
	public int updateAbout(String about_Content) {
		return dao.updateAbout(about_Content);
	}

	@Override
	public int updateInternship(String about_Content) {
		return dao.updateInternship(about_Content);
	}

	@Override
	public String selectAbout() {
		return dao.selectAbout();
	}

	@Override
	public String selectInternship() {
		return dao.selectInternship();
	}

}
