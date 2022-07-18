package artist.controller;

import artist.dto.*;

import java.util.List;

public interface ArtistService {
    public List<ArtistDTO> getArtistAll();

    public Artist_InfoDTO getArtist_info(String eng_name);

    public List<Artist_Featured_WorksDTO> getArtist_featured_works(String eng_name);

    public List<Artist_ExhibitionsDTO> getArtist_exhibitions_titles(String eng_name);

    public List<Artist_Exhibitions_InfoDTO> getArtist_exhibitions_info(String eng_name, String exhibition_title);

    public List<Artist_NewsDTO> getArtist_news(String exhibition_title);
}
