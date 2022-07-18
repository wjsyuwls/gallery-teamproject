package login.controller;

import login.bean.LoginDTO;
import login.dao.LoginDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class LoginServiceImpl implements LoginService {

    private final LoginDAO dao;

    @Override
    public LoginDTO login(String id) {
        return dao.login(id);
    }

    @Override
    public int join(LoginDTO dto) {
        return dao.join(dto);
    }

    @Override
    public boolean isExistId(String id) {
        boolean result = false;
        LoginDTO dto = dao.isExistId(id);
        if (dto == null) {
            result = false;
        } else {
            result = true;
        }
        return result;
    }

    @Override
    public int delete(String id) {
        return dao.delete(id);
    }
}
