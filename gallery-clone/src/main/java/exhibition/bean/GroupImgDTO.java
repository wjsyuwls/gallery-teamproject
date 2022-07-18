package exhibition.bean;

import lombok.Data;

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
 * @description 그룹 전시회의 이미지를 저장하는 Bean Class, use lombok
 * 				DB Table : group_ex_img
 * 
 */

@Data
public class GroupImgDTO {
	private int seq;
	private String group_img;
}
