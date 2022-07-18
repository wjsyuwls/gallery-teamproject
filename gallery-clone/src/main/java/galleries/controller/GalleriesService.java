package galleries.controller;

/**
 * @project GalleryHompage_TeamProject
 *
 * @package galleries.controller
 * 
 * @file GalleriesService.java
 * 
 * @author Ezen_ac_Team_1
 * 
 * @date 2022. 4. 19.
 * 
 * @description galleries의 글 쓰기, 글 수정을 위한 GalleriesService Class
 * 
 */

public interface GalleriesService {
	public int updateAbout(String about_Content);
	public int updateInternship(String about_Content);
	public String selectAbout();
	public String selectInternship();
	
}
