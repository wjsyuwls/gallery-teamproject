package login.controller;

import login.bean.LoginDTO;

public interface LoginService {
	public LoginDTO login(String id);
	public int join(LoginDTO dto);
	public boolean isExistId(String id);
	public int delete(String id);
}
