package galleries.bean;

import lombok.Data;

/**
 * @project GalleryHompage_TeamProject
 *
 * @package galleries.bean
 * 
 * @file ContactDTO.java
 * 
 * @author Ezen_ac_Team_1
 * 
 * @date 2022. 4. 19.
 * 
 * @description ContactBean, use lombok
 * 		 		이메일을 보내기 위한 정보저장하는 DTO
 * 
 */

@Data
public class ContactDTO {
	private String name;		// 이름
	private String email;		// 이메일
	private String message;		// 메시지
	private String logDate;		// 작성날짜
}
