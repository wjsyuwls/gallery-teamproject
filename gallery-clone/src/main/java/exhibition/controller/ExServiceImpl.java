package exhibition.controller;

import exhibition.bean.ExDTO;
import exhibition.bean.GroupImgDTO;
import exhibition.bean.GroupInfoDTO;
import exhibition.bean.SoloDTO;
import exhibition.dao.ExDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

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
 * @description exhibitions의 ServiceImpl Class
 * 
 */

@Service
@RequiredArgsConstructor
public class ExServiceImpl implements ExService{

	private final ExDAO dao;

	@Override
	public List<ExDTO> exList_2220() {
		return dao.exList_2220();
	}

	@Override
	public List<ExDTO> exList_1917() {
		return dao.exList_1917();
	}

	@Override
	public List<ExDTO> exList_1614() {
		return dao.exList_1614();
	}

	@Override
	public List<ExDTO> exList_1311() {
		return dao.exList_1311();
	}


	/* 그룹전시 정보 */
	@Override
	public GroupInfoDTO getInfo(int seq) {
		return dao.getInfo(seq);
	}
	/* 그룹전시 이미지 */
	@Override
	public List<GroupImgDTO> getImg(int startNum, int endNum) {
		return dao.getImg(startNum, endNum);  
	}
	
	/* 개인전 */
	@Override
	public SoloDTO getSoloInfo(int seq) {
		return dao.getSoloInfo(seq);
	}
	
}
