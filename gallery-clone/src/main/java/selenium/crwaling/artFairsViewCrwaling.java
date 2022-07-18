package selenium.crwaling;

import artFairs.bean.ArtFairsDTO;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import java.util.List;

public class artFairsViewCrwaling {
	public static void selenium() {

		// 드라이버 설치 경로
		String WEB_DRIVER_ID = "webdriver.chrome.driver";
		String WEB_DRIVER_PATH = "D:/Ezen/spring/chromedriver.exe";

		// WedDriver 경로 설정
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

		// 웹 드라이버 설정?
		WebDriver driver = new ChromeDriver();
//		String base_url = "https://www.gallerybk.co.kr/%EB%B3%B5%EC%A0%9C-context-art-miami-2019"; // url 설정 
//		String base_url = "https://www.gallerybk.co.kr/context-art-miami"; // url 설정
//		String base_url = "https://www.gallerybk.co.kr/art-central-hk-2019"; // url 설정
//		String base_url = "https://www.gallerybk.co.kr/art-central-hk-2018"; // url 설정
//		String base_url = "https://www.gallerybk.co.kr/art-central-hk-2017"; // url 설정 
//		String base_url = "https://www.gallerybk.co.kr/g-seoul-international-art-fair-2015"; // url 설정
		String base_url = "https://www.gallerybk.co.kr/g-seoul-international-art-fair-2014"; // url 설정
		

		// 브라우저 주소창에 url을 넣은후 request 한것과 같다
		driver.get(base_url);

		//System.out.println(driver.getPageSource());

		List<WebElement> imageElements = driver.findElements(By.cssSelector("._1KV2M wix-image")); // 전시이미지
		List<WebElement> allDataElements = driver.findElements(By.className("_2YGAo")); // 전체 데이터

		for (int i = 0; i < allDataElements.size(); i++) {
			// list에 담겨져 있던 요소들을 꺼내서 출력
			final String ex_all = allDataElements.get(i).getText();
			final String ex_img = imageElements.get(i).findElement(By.tagName("img")).getAttribute("src");

			// image_src가 null 일경우 출력하지 않는다 // 여기서 기본이미지를 하나 만들어서 넣으면 좋을듯?
			if (ex_img == null) {
				continue;
			}

			System.out.println(ex_all);
			
			/* 전체 데이터 나누기 */
			String idx1 = ex_all.substring(0, 35);
			String idx2 = ex_all.substring(36, 56);
			String idx3 = ex_all.substring(57, 93);
			String idx4 = ex_all.substring(94, 104);
			String idx5 = ex_all.substring(105, 124);
			String idx6 = ex_all.substring(126, 149);
			String idx7 = ex_all.substring(150);

			System.out.println(idx1);
			System.out.println(idx2);
			System.out.println(idx3);
			System.out.println(idx4);
			System.out.println(idx5);
			System.out.println(idx6);
			System.out.println(idx7);
			System.out.println("이미지" + ex_img);

			System.out.println();
			
			ArtFairsDTO dto = new ArtFairsDTO();
			dto.setTitle(idx1);
			dto.setInfo_date(idx2);
			dto.setInfo(idx3);
			dto.setDetailimg_src(ex_img);
			dto.setPlace(idx4);
			dto.setPlace_detail(idx5);
			dto.setArtists(idx6);
			dto.setArtist_name(idx7);
			
			
			crwalingDAO dao = new crwalingDAO();
			dao.insertArtFairsView(dto);  
		}
	}

	public static void main(String[] args) {
		selenium();
	}
}
