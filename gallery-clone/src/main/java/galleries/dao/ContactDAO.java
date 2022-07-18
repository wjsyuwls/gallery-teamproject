package galleries.dao;

import galleries.bean.ContactDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

/**
 * @project GalleryHompage_TeamProject
 *
 * @package galleries.dao
 * 
 * @file ContactDAO.java
 * 
 * @author Ezen_ac_Team_1
 * 
 * @date 2022. 4. 19.
 * 
 * @description 이메일 저장을 위한 ContactDAO Class
 * 
 */

@Repository
@RequiredArgsConstructor
public class ContactDAO {
	
	private final SqlSessionTemplate sqlSession;
	
	public int insertContact(ContactDTO dto) {
		return sqlSession.insert("mybatis.contactMapper.insertContact", dto);
	}
}
