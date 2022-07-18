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
 * @description 그룹전시회의 정보를 저장하는 Bean Class, use lombok
 * 				DB Table : group_ex
 * 
 */

@Data
public class GroupInfoDTO {
	private int seq;
	private String titleName;
	private String ex_date;
	private String artistName;
	private String main_img;
	private String intro_img;
	private String intro_content;
}
