package b90ft4.web.repository.mapper;

import org.springframework.stereotype.Repository;

import b90ft4.web.repository.vo.UserVO;

@Repository
public interface LoginMapper {
	
	public UserVO selectUser(UserVO user) throws Exception;
	
	public UserVO nLogin(UserVO user) throws Exception;

	public int userCheck(String name) throws Exception;
	
	public void insertUser(UserVO user) throws Exception;
}
