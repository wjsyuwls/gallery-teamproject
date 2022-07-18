package artFairs.bean;

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
 * @description ArtFairsBeans, use lombok
 * 
 */

@Data
public class ArtFairsDTO {
	private String title;			//아트페어 이름
	private String afdate;			//아트페어 날짜
	private String mainimg_src;		//아트페어 메인로고
	private String info_date;		//아트페어 세부날짜
	private String info;			//진행지역
	private String detailimg_src;	//진행사진
	private String place;			//구역
	private String place_detail;	//부스
	private String artists;			//갤러리
	private String artist_name;		//아티스트
	private String img_src1;		//진행사진 추가이미지 1
	private String img_src2;		//진행사진 추가이미지 2
	private String img_src3;		//진행사진 추가이미지 3
}
