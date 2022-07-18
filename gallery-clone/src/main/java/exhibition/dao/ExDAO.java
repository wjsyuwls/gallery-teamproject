package exhibition.dao;

import exhibition.bean.ExDTO;
import exhibition.bean.GroupImgDTO;
import exhibition.bean.GroupInfoDTO;
import exhibition.bean.SoloDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
 * @description exhibitions의 DB연동을 담당하는 DAO Class
 * 				mapper : exhibition-mapping.xml
 * 
 */

@Repository
@RequiredArgsConstructor
public class ExDAO {
	
	/*exhibition.jsp*/
	private final SqlSessionTemplate sqlSession;
	
	public List<ExDTO> exList_2220(){
		return sqlSession.selectList("mybatis.exMapper.exList_2220");
	}
	public List<ExDTO> exList_1917(){
		return sqlSession.selectList("mybatis.exMapper.exList_1917");
	}
	public List<ExDTO> exList_1614(){
		return sqlSession.selectList("mybatis.exMapper.exList_1614");
	}
	public List<ExDTO> exList_1311(){
		return sqlSession.selectList("mybatis.exMapper.exList_1311");
	}
	
	/* 그룹전시 정보 */
	public GroupInfoDTO getInfo(int seq) {
		return sqlSession.selectOne("mybatis.exMapper.getInfo", seq);
	}
	/* 그룹전시 이미지 */
	public List<GroupImgDTO> getImg(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);

		return sqlSession.selectList("mybatis.exMapper.getImg", map);
	}
	/* 개인전 */
	public SoloDTO getSoloInfo(int seq) {
		return sqlSession.selectOne("mybatis.exMapper.getSoloInfo", seq);
	}
}
