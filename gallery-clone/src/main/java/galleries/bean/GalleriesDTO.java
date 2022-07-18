package galleries.bean;

import lombok.Data;

/**
 * 
 * @project GalleryHompage_TeamProject
 *
 * @package galleries.bean
 * 
 * @file GalleriesDTO.java
 * 
 * @author Ezen_ac_Team_1
 * 
 * @date 2022. 4. 19.
 * 
 * @description GalleriesBean, use lombok
 *		 		Galleries의 About, Internship에 Text를 수정 및 저장을 하기 위한 DTO
 */

@Data
public class GalleriesDTO {
	private String about;		// about의 Text
	private String internship;	// internship의 Text
}
