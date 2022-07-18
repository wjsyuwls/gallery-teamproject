package artFairs.controller;

import artFairs.bean.ArtFairsDTO;

import java.util.List;

/**
 * @project GalleryHompage_TeamProject
 *
 * @package artFairs.controller
 * 
 * @file ArtFairsService.java
 * 
 * @author Ezen_ac_Team_1
 * 
 * @date 2022. 4. 19.
 * 
 * @description ArtFairs의 글 쓰기, 글 수정, view를 위한 ArtFairService Class, use lombok
 * 
 */

public interface ArtFairsService {
	public List<ArtFairsDTO> getAtrFairsMain();
	public ArtFairsDTO getAtrFairsView(String title);
	public int insertArtFairs(ArtFairsDTO dto);
	public int updateArtFairs(ArtFairsDTO dto);
	public int deleteArtFairs(String title);
}
