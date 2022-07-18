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
 * @description exhivition의 개인전의 정보를 저장하는 Bean Class, use lombok
 * 				DB Table : solo_ex
 * 
 */

@Data
public class SoloDTO {
	private int seq;
	private String artistName;
	private String titleName;
	private String ex_date;
	private String main_img;
	private String intro_img;
	private String intro_content;
	private String works_img;
	private String cv_school;
	private String cv_solo;
	private String cv_group;
	private String cv_award;
	private String cv_collection;
}
