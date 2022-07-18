package artist.dao;

import artist.dto.*;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
//@Primary
public class ArtistDAO {

//    @Autowired
//    SqlSessionTemplate sqlSession;

    private final SqlSessionTemplate sqlSession;

    public List<ArtistDTO> getArtistAll() {
        return sqlSession.selectList("mybatis.artistMapper.getArtistAll");
    }

    public Artist_InfoDTO getArtist_info(String eng_name) {
        return sqlSession.selectOne("mybatis.artistMapper.getArtist_info", eng_name);
    }

    public List<Artist_Featured_WorksDTO> getArtist_featured_works(String eng_name) {
        return sqlSession.selectList("mybatis.artistMapper.getArtist_featured_works", eng_name);
    }

    public List<Artist_ExhibitionsDTO> getArtist_exhibitions_titles(String eng_name) {
        return sqlSession.selectList("mybatis.artistMapper.getArtist_exhibitions_titles", eng_name);
    }

    public List<Artist_Exhibitions_InfoDTO> getArtist_exhibitions_info(String eng_name, String exhibition_title) {
        Map<String, String> map = new HashMap<String, String>();
        map.put("eng_name", eng_name);
        map.put("exhibition_title", exhibition_title);
        return sqlSession.selectList("mybatis.artistMapper.getArtist_exhibitions_info", map);
    }

    public List<Artist_NewsDTO> getArtist_news(String exhibition_title) {
        return sqlSession.selectList("mybatis.artistMapper.getArtist_news", exhibition_title);
    }
}
