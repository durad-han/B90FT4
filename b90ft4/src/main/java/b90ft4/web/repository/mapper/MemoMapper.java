package b90ft4.web.repository.mapper;

import java.util.List;

import b90ft4.web.repository.vo.MemoVO;
import b90ft4.web.repository.vo.UserVO;

public interface MemoMapper {
	
	public List<MemoVO> selectMemo(UserVO user) throws Exception;
	public void insertMemo(MemoVO memo) throws Exception;
	public void updateMemo(MemoVO memo) throws Exception;
	public void deleteMemo(int memoNo) throws Exception;
	
}
