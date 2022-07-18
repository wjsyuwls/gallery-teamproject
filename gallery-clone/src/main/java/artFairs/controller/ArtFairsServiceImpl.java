package artFairs.controller;

import artFairs.bean.ArtFairsDTO;
import artFairs.dao.ArtFairsDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @project GalleryHompage_TeamProject
 *
 * @package artFairs.controller
 * 
 * @file ArtFairsServiceImpl.java
 * 
 * @author Ezen_ac_Team_1
 * 
 * @date 2022. 4. 19.
 * 
 * @description ArtFairs의 글 쓰기, 글 수정, view를 위한 ArtFairServiceImpl Class, use lombok
 * 
 */

@Service
@RequiredArgsConstructor
public class ArtFairsServiceImpl implements ArtFairsService{
	
	private final ArtFairsDAO dao;

	//페어목록가져오기
	@Override
	public List<ArtFairsDTO> getAtrFairsMain() {
		return dao.getAtrFairsMain();
	}

	//페어정보 가져오기
	@Override
	public ArtFairsDTO getAtrFairsView(String title) {
		return dao.getAtrFairsView(title);
	}

	@Override
	public int insertArtFairs(ArtFairsDTO dto) {
		return dao.insertArtFairs(dto);
	}

	@Override
	public int updateArtFairs(ArtFairsDTO dto) {
		return dao.updateArtFairs(dto);
	}

	@Override
	public int deleteArtFairs(String title) {
		return dao.deleteArtFairs(title);
	}
}
