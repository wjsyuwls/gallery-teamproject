package galleries.dao;

import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

/**
 * @project GalleryHompage_TeamProject
 *
 * @package galleries.dao
 * 
 * @file GalleriesDAO.java
 * 
 * @author Ezen_ac_Team_1
 * 
 * @date 2022. 4. 19.
 * 
 * @description Galleries의 글 쓰기, 글 수정을 위한 GalleriesDAO Class
 * 
 */

@Repository
@RequiredArgsConstructor
public class GalleriesDAO {
	
	private final SqlSessionTemplate sqlSession;
	
	public  int updateAbout(String about_Content) {
		return sqlSession.update("mybatis.galleriesMapper.updateAbout", about_Content);
	}
	
	public  int updateInternship(String about_Content) {
		return sqlSession.update("mybatis.galleriesMapper.updateInternship", about_Content);
	}
	
	public  String selectAbout() {
		return sqlSession.selectOne("mybatis.galleriesMapper.selectAbout");
	}
	
	public  String selectInternship() {
		return sqlSession.selectOne("mybatis.galleriesMapper.selectInternship");
	}
}
