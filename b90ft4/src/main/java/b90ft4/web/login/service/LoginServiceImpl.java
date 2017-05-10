package b90ft4.web.login.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import b90ft4.web.repository.mapper.LoginMapper;
import b90ft4.web.repository.vo.UserVO;

@Service
public class LoginServiceImpl implements LoginService {
	
	private LoginMapper mapper;

	private final Logger logger = LoggerFactory.getLogger(getClass());
	
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
		logger.debug("확인할 Id : "+user.getUserId());
		
		mapper.userCheck(user.getUserId());
		return true;
	}
	
	
	

}
