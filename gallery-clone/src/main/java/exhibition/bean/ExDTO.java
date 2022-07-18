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
 * @description exhibitions의 연도별로 나열하기 위한 Bean Class, use lombok
 * 				DB Table : exhibitions
 * 
 */

@Data
public class ExDTO {
	private String seq;		//아티스트를 seq로 관리
	private String ex_img; // 전시이미지 src 주소
	private String ex_date; // 전시시작, 종료일
	private String ex_titleName; // 전시이름
	private String ex_artistName; // 작가이름
}