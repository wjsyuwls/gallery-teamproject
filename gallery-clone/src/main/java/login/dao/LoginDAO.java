package login.dao;

import login.bean.LoginDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class LoginDAO {

    private final SqlSessionTemplate sqlSession;

    public LoginDTO login(String id) {
        return sqlSession.selectOne("mybatis.loginMapper.login", id);
    }

    public int join(LoginDTO dto) {
        return sqlSession.insert("mybatis.loginMapper.join", dto);
    }

    public LoginDTO isExistId(String id) {
        return sqlSession.selectOne("mybatis.loginMapper.isExistId", id);
    }

    public int delete(String id) {
        return sqlSession.delete("mybatis.loginMapper.delete", id);
    }
}
