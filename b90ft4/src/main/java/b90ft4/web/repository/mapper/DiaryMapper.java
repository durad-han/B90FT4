package b90ft4.web.repository.mapper;

import java.util.List;

import b90ft4.web.repository.vo.DiaryFileVO;
import b90ft4.web.repository.vo.DiarySearchVO;
import b90ft4.web.repository.vo.DiaryVO;

public interface DiaryMapper {

	/* =================================================== */
	/* 기본 게시판                                            */
	/* =================================================== */
	public List<DiaryVO> selectDiaryList(DiarySearchVO search) throws Exception;
	public int selectDiaryCount(DiarySearchVO search) throws Exception;
	public void insertDiary(DiaryVO diary) throws Exception;
	public DiaryVO selectOneDiary(int no) throws Exception;
	public void updateDiary(DiaryVO diary) throws Exception;
	public void deleteDiary(int no) throws Exception;

	/* =================================================== */
	/* 파일 관련                                             */
	/* =================================================== */
//	public void insertDiaryFile(DiaryFileVO diaryFile) throws Exception;
//	public DiaryFileVO selectDiaryFileByNo(int no) throws Exception;


}
