package b90ft4.web.repository.mapper;

import java.util.List;

import b90ft4.web.repository.vo.DiaryFileVO;
import b90ft4.web.repository.vo.DiarySearchVO;
import b90ft4.web.repository.vo.DiaryVO;

public interface DiaryMapper {


	public List<DiaryVO> selectDiaryList(DiarySearchVO search) throws Exception;
	public int selectDiaryCount(DiarySearchVO search) throws Exception;
	public void insertDiary(DiaryVO diary) throws Exception;
	public DiaryVO selectOneDiary(int no) throws Exception;
	public void updateDiary(DiaryVO diary) throws Exception;
	public void deleteDiary(int no) throws Exception;

	public void insertDiaryFile(DiaryFileVO diaryFile) throws Exception;
	public DiaryFileVO selectDiaryFileByNo(int no) throws Exception;


}
