package b90ft4.web.memo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import b90ft4.web.repository.mapper.MemoMapper;
import b90ft4.web.repository.vo.MemoVO;
import b90ft4.web.repository.vo.UserVO;

@Service
public class MemoServiceImpl implements MemoService{

	@Autowired
	private MemoMapper dao;
	
	public List<MemoVO> list(UserVO user) throws Exception{
		return dao.selectMemo(user);
	}
	public void edit(MemoVO memo) throws Exception{
		dao.updateMemo(memo);
	}
	public void save(MemoVO memo) throws Exception{
		dao.insertMemo(memo);
	}
	public void delete(int memoNo) throws Exception{
		dao.deleteMemo(memoNo);
	}
	
}
