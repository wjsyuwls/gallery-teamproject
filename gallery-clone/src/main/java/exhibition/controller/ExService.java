package exhibition.controller;

import exhibition.bean.ExDTO;
import exhibition.bean.GroupImgDTO;
import exhibition.bean.GroupInfoDTO;
import exhibition.bean.SoloDTO;

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
 * @description exhibitions의 Service interface
 * 
 */

public interface ExService {

	public List<ExDTO> exList_2220();
	public List<ExDTO> exList_1917();
	public List<ExDTO> exList_1614();
	public List<ExDTO> exList_1311();
	
	/*그룹전시 정보*/
	public GroupInfoDTO getInfo(int seq);
	/*그룹전시 이미지_src*/
	public List<GroupImgDTO> getImg(int startNum, int endNum);
	
	/*개인전*/
	public SoloDTO getSoloInfo(int seq);
}
