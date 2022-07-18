package artist.controller;

import artist.dao.ArtistDAO;
import artist.dto.*;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ArtistServiceImpl implements ArtistService {

//    @Autowired
//    ArtistDAO artistRepository;

    private final ArtistDAO artistRepository;

    @Override
    public List<ArtistDTO> getArtistAll() {
        return artistRepository.getArtistAll();
    }

    @Override
    public Artist_InfoDTO getArtist_info(String eng_name) {
        return artistRepository.getArtist_info(eng_name);
    }

    @Override
    public List<Artist_Featured_WorksDTO> getArtist_featured_works(String eng_name) {
        return artistRepository.getArtist_featured_works(eng_name);
    }

    @Override
    public List<Artist_ExhibitionsDTO> getArtist_exhibitions_titles(String eng_name) {
        return artistRepository.getArtist_exhibitions_titles(eng_name);
    }


    @Override
    public List<Artist_Exhibitions_InfoDTO> getArtist_exhibitions_info(String eng_name, String exhibition_title) {
        return artistRepository.getArtist_exhibitions_info(eng_name, exhibition_title);
    }

    @Override
    public List<Artist_NewsDTO> getArtist_news(String exhibition_title) {
        return artistRepository.getArtist_news(exhibition_title);
    }
}
