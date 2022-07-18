package selenium.crwaling;

import artFairs.bean.ArtFairsDTO;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import java.util.List;

public class artFairsMainCrwaling {
	public static void selenium() {

		// 드라이버 설치 경로
		String WEB_DRIVER_ID = "webdriver.chrome.driver";
		String WEB_DRIVER_PATH = "D:/Ezen/spring/chromedriver.exe";

		// WedDriver 경로 설정
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

		// 웹 드라이버 설정?
		WebDriver driver = new ChromeDriver();
		String base_url = "https://www.gallerybk.co.kr/art-fairs-2"; // url 설정

		// 브라우저 주소창에 url을 넣은후 request 한것과 같다
		driver.get(base_url);

		System.out.println(driver.getPageSource());

		List<WebElement> imageElements = driver.findElements(By.cssSelector("._1Bme7 wix-image")); // 전시이미지
		List<WebElement> allDataElements = driver.findElements(By.className("_1ozXL")); // 전체 데이터

		for (int i = 0; i < allDataElements.size(); i++) {
	        // list에 담겨져 있던 요소들을 꺼내서 출력
			final String ex_all = allDataElements.get(i).getText();
			final String ex_img = imageElements.get(i).findElement(By.tagName("img")).getAttribute("src");

			// image_src가 null 일경우 출력하지 않는다 // 여기서 기본이미지를 하나 만들어서 넣으면 좋을듯?
			if (ex_img == null) {
				continue;
			}

			/* 전체 데이터 나누기 */
			String idx1 = ex_all.substring(0, 23);
			System.out.println(idx1);
			String idx2 = ex_all.substring(24);
			System.out.println(idx2);
			System.out.println("이미지" + ex_img);

			System.out.println();
			
			ArtFairsDTO dto = new ArtFairsDTO();
			dto.setMainimg_src(ex_img);
			dto.setAfdate(idx1);
			dto.setTitle(idx2);
			
			crwalingDAO dao = new crwalingDAO();
			dao.insertArtFairsMain(dto);
		}
	}

	public static void main(String[] args) {
		selenium();
	}
}
