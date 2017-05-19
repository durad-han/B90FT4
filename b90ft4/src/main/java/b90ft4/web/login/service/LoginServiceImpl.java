package b90ft4.web.login.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import b90ft4.web.repository.mapper.LoginMapper;
import b90ft4.web.repository.vo.UserVO;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	private LoginMapper mapper;

	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Override
	public UserVO nLogin(UserVO user) throws Exception {
		return mapper.selectUser(user);
	}

	@Override
	public UserVO login(UserVO user) throws Exception {
		return mapper.selectUser(user);
	}

	@Override
	public boolean userCheck(UserVO user) throws Exception {
		if(mapper.userCheck(user.getUserId()) == 0){
			return false;
		}else return true;
	}
	
	@Override
	public void regist(UserVO user) throws Exception {
		logger.debug(user.getUserId()+" 유저를 신규 등록합니다.");
		mapper.insertUser(user);
	}

	@Override
	public void updateUser(UserVO user) throws Exception {
		mapper.updateUser(user);
	}
	
	

}
