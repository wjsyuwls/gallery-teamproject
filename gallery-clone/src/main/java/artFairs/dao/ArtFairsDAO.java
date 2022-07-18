package artFairs.dao;

import artFairs.bean.ArtFairsDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @project GalleryHompage_TeamProject
 *
 * @package artFairs.dao
 * 
 * @file ArtFairsDAO.java
 * 
 * @author Ezen_ac_Team_1
 * 
 * @date 2022. 4. 19.
 * 
 * @description ArtFairs의 글 쓰기, 글 수정, view를 위한 ArtFairDAO Class, use lombok
 * 
 */

@Repository
@RequiredArgsConstructor
public class ArtFairsDAO {
	
	private final SqlSessionTemplate sqlSession;
	
	public List<ArtFairsDTO> getAtrFairsMain() {
		return sqlSession.selectList("mybatis.artFairsMapper.getAtrFairsMain");
	}

	public ArtFairsDTO getAtrFairsView(String title) {
		return sqlSession.selectOne("mybatis.artFairsMapper.getAtrFairsView", title);
	}

	public int insertArtFairs(ArtFairsDTO dto) {
		return sqlSession.insert("mybatis.artFairsMapper.insertArtFairs", dto);
	}

	public int updateArtFairs(ArtFairsDTO dto) {
		return sqlSession.update("mybatis.artFairsMapper.updateArtFairs", dto);
	}
	
	public int deleteArtFairs(String title) {
		return sqlSession.delete("mybatis.artFairsMapper.deleteArtFairs", title);
	}
}
