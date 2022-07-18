package selenium.crwaling;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import java.util.List;

public class Artist {
    public static void main(String[] args) {
        //Properties
        String WEB_DRIVER_ID = "webdriver.chrome.driver";
        String WEB_DRIVER_PATH = "D:/Ezen/spring/chromedriver.exe";
        System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
        WebDriver driver = new ChromeDriver();
        String base_url = "https://www.gallerybk.co.kr/artists-3";
        driver.get(base_url);
        System.out.println(driver.getPageSource());

        WebElement show_more = driver.findElement(By.className("_1gbg4"));
        for (int i = 0; i < 3; i++) {
            show_more.click();
        }

        List<WebElement> eng_name_EL = driver.findElements(By.className("_2GGjn"));
        List<WebElement> kor_name_EL = driver.findElements(By.className("_1dCto"));
        List<WebElement> head_img_EL = driver.findElements(By.cssSelector("wix-image._1-6YJ._2tHnQ"));

        for (int i = 0; i < eng_name_EL.size(); i++) {
            final String eng_name = eng_name_EL.get(i).getText();
            final String kor_name = kor_name_EL.get(i).getText();
            final String head_img = head_img_EL.get(i).findElement(By.tagName("img")).getAttribute("src");

            if (head_img == null) {
                continue;
            }

            System.out.println("eng_name: " + eng_name);
            System.out.println("kor_name: " + kor_name);
            System.out.println("head_img: " + head_img);

//            DTO dto = new DTO();
//            dto.setEng_name(eng_name);
//            dto.setKor_name(kor_name);
//            dto.setHead_img(head_img);
//            
//            DAO dao = new DAO();
//            int result = dao.insert(dto);
//            System.out.println(result);
        }
    }
}

