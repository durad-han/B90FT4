package b90ft4.web.login.service;

import b90ft4.web.repository.vo.UserVO;

public interface LoginService {

	UserVO nLogin(UserVO user) throws Exception;

}
