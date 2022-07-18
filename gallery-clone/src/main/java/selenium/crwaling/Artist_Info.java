package selenium.crwaling;

import selenium.dao.DAO;
import selenium.dto.DTO;

public class Artist_Info {
    public static void main(String[] args) {
//        String WEB_DRIVER_ID = "webdriver.chrome.driver";
//        String WEB_DRIVER_PATH = "D:/Ezen/spring/chromedriver";
//
//        System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
//        // 크롬 창 닫기
//        ChromeOptions option = new ChromeOptions();
//        option.addArguments("headless");
//        WebDriver driver = new ChromeDriver(option);
//        String base_url = "https://www.gallerybk.co.kr/%EB%B3%B5%EC%A0%9C-%EC%A0%95%EC%84%B8%EB%9D%BC-1";
//        driver.get(base_url);
//        System.out.println(driver.getPageSource());

        String eng_name = "KANG Hyung Koo";

        String info = "KANG Hyung Koo\n" +
                "\n" +
                " \n" +
                "\n" +
                "1980  Choong-Ang University, Painting, BFA, Seoul, Korea\n" +
                "\n" +
                " \n" +
                "Solo Exhibitions \n" +
                "\n" +
                "2020  Look Into, Gallery BK, Seoul, Korea\n" +
                "\n" +
                "2019  Intimate Strangers, Arario Museum, Jeju, Korea\n" +
                "\n" +
                "2018  CLOSE UP, Choice Art Company, Seoul, Korea\n" +
                "\n" +
                "2014  Hyun koo Kang and his Muse, OH! Marylin, ARARIO GALLERY Cheonan, Korea\n" +
                "\n" +
                "2013  I SEE YOU, Young Eun Museum, Gwangju, Korea\n" +
                "\n" +
                "2012  Crossing Gazes, Mizuma Gallery, Singapore\n" +
                "\n" +
                "\u200B2011  Hyung Koo KANG’S Solo Exhibition, Singapore Art Museum, Singapore\n" +
                "\n" +
                "2010  Hyung Koo KANG’S Solo Exhibition, Young Eun Museum, Gwangju, Korea\n" +
                "\n" +
                "          Hyung Koo KANG’S Solo Exhibition, Arario Gallery, New York, USA\n" +
                "\n" +
                "          Beyond the Blue, Gallery Hyundai, Seoul, Korea\n" +
                "\n" +
                "2009  Hyung Koo KANG’S Solo Exhibition, Arario Gallery, New York, USA\n" +
                "\n" +
                "           Hyung Koo KANG’S Solo Exhibition, Arario Gallery, Seoul, Korea         \n" +
                "\n" +
                "2007  Hyung Koo KANG’S Solo Exhibition, Arario Gallery, Cheonan, Korea\n" +
                "\n" +
                "2006  Hyung Koo KANG’S Solo Exhibition, Lotte Art Gallery, Busan, Korea\n" +
                "\n" +
                "2005  Hyung Koo KANG’S Solo Exhibition, Gwangju Museum of Art, Gwangju, Korea\n" +
                "\n" +
                " \n" +
                "\n" +
                "Group Exhibitions (Selected)\n" +
                "\n" +
                "2018  Contemporary Art Dictionary 7 Keywords, Jeonnuk Museum of Art, Wanju, Korea\n" +
                "\n" +
                "2013  Look East!2 : Arian Perspectives, Mizuma Gallery, Singapore\n" +
                "\n" +
                "          Banana and I , Arario Gallery, Cheonan, Korea\n" +
                "\n" +
                "2012  Korean Eye, Saatchi Gallery, London, England\n" +
                "\n" +
                "2011  Artists with Arario 2011/Part 1, Arario Gallery Seoul cheongdam, Seoul, Korea\n" +
                "\n" +
                "         靑-Beyond the Blue, Gallery Hyundai, Seoul, Korea\n" +
                "\n" +
                "         The Seoul Art Festival 2011, Seoul Museum of Art, Seoul, Korea\n" +
                "\n" +
                "2010  Artist with Arario, Arario Gallery, Cheonan, Korea\n" +
                "\n" +
                "2009  Art In Super Star, Hangaram Art Museum, Seoul, Korea\n" +
                "\n" +
                "           hinsegae Centum city Grand Opening, Shinsegae Centum city, Busan, Korea\n" +
                "\n" +
                "           Korean Eye : Moon Generation, Saatchi Gallery, London, England\n" +
                "\n" +
                "2008  Youngeun 2008 Residency, Youngeun Museum of Contemporary Art, Gwangju, Korea\n" +
                "\n" +
                "2006  Picture like Photograph, Photograph like Picture, Gallery Zandari, Seoul, Korea\n" +
                "\n" +
                "           Draw, Seoul Museum of Art, Seoul, Korea\n" +
                "\n" +
                "2005  Face, Youngeum Museum of Contemporary Art, Seoul, Korea\n" +
                "\n" +
                "           Father, Gail Art Museum of Contemporary Art, Seoul, Korea\n" +
                "\n" +
                "           Memory of Nature, Seoul Museum of Art, Seoul, Korea\n" +
                "\n" +
                " \n" +
                "\n" +
                "Main Collections\n" +
                "\n" +
                "Jimmy Carter Center, Atlanta\n" +
                "\n" +
                "Gwangju Art Museum, Gwangju\n" +
                "\n" +
                "The Republic of Korea National Red Cross, Seoul\n" +
                "\n" +
                "Pohang University of Science and Technology, Pohang\n" +
                "\n" +
                "The Amore Museum, Yongin\n" +
                "\n" +
                "Federation of Korean Trade Union, Seoul\n" +
                "\n" +
                "Gamsil Olympic Main Stadium, Seoul\n" +
                "\n" +
                "Son Ki-Jeong Memorial Foundation\n" +
                "\n" +
                "ARARIO Gallerym Cheonan";

        DTO dto = new DTO();
        dto.setEng_name(eng_name);
        dto.setInfo(info);
        DAO dao = new DAO();
        int result = dao.insert_info(dto);

        System.out.println("result = " + result);

//        driver.close();
    }
}
