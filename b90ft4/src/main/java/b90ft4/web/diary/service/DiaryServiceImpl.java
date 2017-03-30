package b90ft4.web.diary.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import b90ft4.web.repository.mapper.DiaryMapper;
import b90ft4.web.repository.vo.DiaryFileVO;
import b90ft4.web.repository.vo.DiarySearchVO;
import b90ft4.web.repository.vo.DiaryVO;
import b90ft4.web.repository.vo.PageResultVO;

@Service
public class DiaryServiceImpl implements DiaryService {

	@Autowired
	private DiaryMapper dao;
	
	@Override
	public void write(Map<String, Object> param) throws Exception{
		DiaryVO diary = (DiaryVO)param.get("diary");
		dao.insertDiary(diary);
		DiaryFileVO diaryFile = (DiaryFileVO)param.get("diaryFile");
		if(diaryFile != null){
			diaryFile.setNo(diary.getNo());
			dao.insertDiaryFile(diaryFile);
		}
	}
	
	@Override
	public DiaryVO updateForm(int no) throws Exception{
		return dao.selectOneDiary(no);
	}
	
	@Override
	public void update(DiaryVO diary) throws Exception{
		dao.updateDiary(diary);
	}
	
	@Override
	public Map<String, Object> list(DiarySearchVO search) throws Exception{
		Map<String, Object> result = new HashMap<>();
		result.put("list",  dao.selectDiary(search));
		result.put("pageResult", new PageResultVO(search.getPageNo(), dao.selectDiaryCount(search)));
		return result;
	}
	
	@Override
	public Map<String, Object> detail(int no) throws Exception{
		Map<String, Object> result = new HashMap<>();
		result.put("diaryVO", dao.selectOneDiary(no));
		result.put("file", dao.selectDiaryFileByNo(no));
		return result;
	}
	
	@Override
	public void delete(int no) throws Exception{
		dao.deleteDiary(no);
	}
}

















