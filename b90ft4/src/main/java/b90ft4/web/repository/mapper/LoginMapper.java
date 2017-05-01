package b90ft4.web.repository.mapper;

import org.springframework.stereotype.Repository;

import b90ft4.web.repository.vo.UserVO;

@Repository
public interface LoginMapper {
	
	public UserVO nLogin(UserVO user) throws Exception;

}
