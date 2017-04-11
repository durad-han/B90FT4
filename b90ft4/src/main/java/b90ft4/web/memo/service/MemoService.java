package b90ft4.web.memo.service;

import java.util.List;

import b90ft4.web.repository.vo.MemoVO;
import b90ft4.web.repository.vo.UserVO;

public interface MemoService {

	public List<MemoVO> list(UserVO user) throws Exception;
	public void edit(MemoVO memo) throws Exception;
	public void save(MemoVO memo) throws Exception;
	public void delete(int memoNo) throws Exception;
	
}
