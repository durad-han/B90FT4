package b90ft4.web.login.service;

import b90ft4.web.repository.vo.UserVO;

public interface LoginService {

	UserVO login(UserVO user) throws Exception;
	
	UserVO nLogin(UserVO user) throws Exception;

	boolean userCheck(UserVO user) throws Exception;

	void regist(UserVO user) throws Exception;
}
