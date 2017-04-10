package b90ft4.web.diary.service;

import java.util.Map;

import b90ft4.web.repository.vo.DiarySearchVO;
import b90ft4.web.repository.vo.DiaryVO;

public interface DiaryService {

	public void write(Map<String, Object> param) throws Exception;
	public DiaryVO updateForm(int no) throws Exception;
	public void update(DiaryVO diary) throws Exception;
	public Map<String, Object> detail(int no) throws Exception;
	public Map<String, Object> list(DiarySearchVO search) throws Exception;
	public void delete(int no) throws Exception;
}
