package b90ft4.web.login.service;

import org.springframework.stereotype.Service;

import b90ft4.web.repository.mapper.LoginMapper;
import b90ft4.web.repository.vo.UserVO;

@Service
public class LoginServiceImpl implements LoginService {
	
	private LoginMapper mapper;

	@Override
	public UserVO nLogin(UserVO user) throws Exception {
		return mapper.selectUser(user);
	}

	@Override
	public UserVO login(UserVO user) throws Exception {
		return null;
	}

	@Override
	public boolean userCheck(UserVO user) throws Exception {
		int isNull = mapper.userCheck(user);
		if(isNull == 0)	return false;
		return true;
	}
	
	
	

}
