package galleries.controller;

import galleries.bean.ContactDTO;
import galleries.dao.ContactDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * @project GalleryHompage_TeamProject
 *
 * @package galleries.controller
 * 
 * @file ContactServiceImpl.java
 * 
 * @author Ezen_ac_Team_1
 * 
 * @date 2022. 4. 19.
 * 
 * @description 이메일을 보내고 DB에 저장하기 위한 ContackServiceImpl Class, use lombok
 * 		 		DB Table : contact
 * 		 		mapping  : contact-mapping.xml
 */

@Service
@RequiredArgsConstructor
public class ContactServiceImpl implements ContactService {

	private final ContactDAO dao;
	
	@Override
	public int insertContact(ContactDTO dto) {
		return dao.insertContact(dto);
	}

}
