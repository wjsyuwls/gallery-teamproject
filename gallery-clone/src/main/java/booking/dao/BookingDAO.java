package booking.dao;

import booking.dto.BookingDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class BookingDAO {

    private final SqlSessionTemplate sqlSession;

    public int insert_booking(BookingDTO dto) {
        return sqlSession.insert("mybatis.bookingMapper.insert_booking", dto);
    }

    public int cancel_booking(String name) {
        return sqlSession.delete("mybatis.bookingMapper.cancel_booking", name);
    }
}


