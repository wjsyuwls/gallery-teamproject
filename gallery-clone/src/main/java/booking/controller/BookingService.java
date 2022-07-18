package booking.controller;

import booking.dto.BookingDTO;

public interface BookingService {
    public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber);

    public int insert_booking(BookingDTO dto);

    public int cancel_booking(String name);
}
