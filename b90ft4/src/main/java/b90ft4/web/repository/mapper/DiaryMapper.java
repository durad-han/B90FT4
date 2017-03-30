package b90ft4.web.repository.mapper;

import java.util.List;

import b90ft4.web.repository.vo.DiaryFileVO;
import b90ft4.web.repository.vo.DiarySearchVO;
import b90ft4.web.repository.vo.DiaryVO;

public interface DiaryMapper {


	public List<DiaryVO> selectDiary(DiarySearchVO search);
	public int selectDiaryCount(DiarySearchVO search);
	public void insertDiary(DiaryVO diary);
	public DiaryVO selectOneDiary(int no);
	public void updateDiary(DiaryVO diary);
	public void deleteDiary(int no);

	public void insertDiaryFile(DiaryFileVO diaryFile);
	public DiaryFileVO selectDiaryFileByNo(int no);







}
