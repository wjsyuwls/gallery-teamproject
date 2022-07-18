package galleries.controller;

import galleries.bean.ContactDTO;

/**
 * @project GalleryHompage_TeamProject
 *
 * @package galleries.controller
 * 
 * @file ContactService.java
 * 
 * @author Ezen_ac_Team_1
 * 
 * @date 2022. 4. 19.
 * 
 * @description 이메일을 보내고 DB에 저장하기 위한 ContactService class
 * 
 */

public interface ContactService {
	public int insertContact(ContactDTO dto);
}
