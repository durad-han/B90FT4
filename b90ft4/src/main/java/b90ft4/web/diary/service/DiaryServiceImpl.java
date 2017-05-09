package b90ft4.web.diary.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import b90ft4.web.repository.mapper.DiaryMapper;
import b90ft4.web.repository.vo.DiarySearchVO;
import b90ft4.web.repository.vo.DiaryVO;
import b90ft4.web.repository.vo.PageResultVO;

@Service
public class DiaryServiceImpl implements DiaryService {

	@Autowired
	private DiaryMapper dao;
	private final Logger logger = LoggerFactory.getLogger(getClass());
	//글쓰기
	
	@Override
	public void write(DiaryVO diary) throws Exception{
		dao.insertDiary(diary);
//		DiaryFileVO diaryFile = (DiaryFileVO)param.get("diaryFile");
//		if(diaryFile != null){
//			diaryFile.setNo(diary.getDiaryNo());
////			dao.insertDiaryFile(diaryFile);
//		}
	}
	
	// 글 수정폼
	@Override
	public DiaryVO updateForm(int no) throws Exception{
		return dao.selectOneDiary(no);
	}
	// 글수정
	@Override
	public void update(DiaryVO diary) throws Exception{
		dao.updateDiary(diary);
	}
	
	// 글 목록
	@Override
	public Map<String, Object> list(DiarySearchVO search) throws Exception{
	
		Map<String, Object> result = new HashMap<>();
		
		List<DiaryVO> list = dao.selectDiaryList(search);
		
		for(DiaryVO diary : list){
			
			String title = diary.getTitle();
			
			if (title.length() >= 17) {
				diary.setTitle(title.substring(0,17) + "...");
			}
			
			String temp = diary.getContent();
			
			if(temp!=null && temp.indexOf("<img") != -1){
		
				int sIx = temp.indexOf("<img");
				int eIx = temp.indexOf(">",sIx);
				temp = temp.substring(sIx, eIx+1);
				System.out.println(temp);
				int ix = temp.lastIndexOf(">");
				temp = temp.substring(0,ix) + "width='350' height='215' />";
				temp = temp.replace("style", "");
				System.out.println("테스트 : " + temp);
				diary.setContent(temp);
				
			}else{
				
				diary.setContent("x");
				
			}
			
		}
		
		
		
		result.put("list",  list);
		result.put("pageResult", new PageResultVO(search.getPageNo(), dao.selectDiaryCount(search)));
		return result;

		
		
	}
	
	
	
	//상세글
	@Override
	public Map<String, Object> detail(int no) throws Exception{
		Map<String, Object> result = new HashMap<>();
		result.put("diaryVO", dao.selectOneDiary(no));
//		result.put("file", dao.selectDiaryFileByNo(no));
		return result;
	}
	//글삭제
	@Override
	public void delete(int no) throws Exception{
		dao.deleteDiary(no);
	}
}

















