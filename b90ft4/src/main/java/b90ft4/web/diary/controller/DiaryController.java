package b90ft4.web.diary.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import b90ft4.web.diary.service.DiaryService;
import b90ft4.web.repository.vo.DiaryFileVO;
import b90ft4.web.repository.vo.DiarySearchVO;
import b90ft4.web.repository.vo.DiaryVO;

@Controller
public class DiaryController {
	
	@Autowired
	private DiaryService service;
	
	@RequestMapping("/diary/write.do")
	public String write(MultipartHttpServletRequest mRequest, RedirectAttributes attr) throws Exception {
		
		Map<String, Object> param = new HashMap<>();
		//실제 업로드 경로
		ServletContext context = mRequest.getServletContext();
		String path = context.getRealPath("/upload");
		//날짜
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM//dd");
		String datePath = sdf.format(new Date());
		
		String savePath =  path + datePath;
		File f = new File(savePath);
		if(!f.exists()) f.mkdirs();//mkdirs() 만들고자 하는 디렉토리의 상위 디렉토리가 존재하지 않을 경우, 상위 디렉토리까지 생성
		
		//게시판 파일 테이블에 저장할 글번호를 조회
		DiaryVO diary = new DiaryVO();
		diary.setTitle(mRequest.getParameter("title"));
		diary.setContent(mRequest.getParameter("content"));
		
		//int no = dao.insertDiary(diary);
		param.put("diary", diary);
		
		//게시물 저장 처리 부탁..
		MultipartFile file = mRequest.getFile("attachFile");
		String oriName = file.getOriginalFilename();
		if (oriName != null && !oriName.equals("")){
			//확장자 처리
			String ext = "";
			//뒤쪽에 있는 . 의 위치
			int index = oriName.lastIndexOf(".");
			if (index != -1){
				//파일명에서 확장자 명(.포함)을 추출
				ext = oriName.substring(index);
			}
			//파일 사이즈
			long fileSize = file.getSize();
			System.out.println("파일 사이즈 : " + fileSize);
			
			//고유한 파일명 만들기
			String systemName = "mlec-" + UUID.randomUUID().toString() + ext;
			System.out.println("저장할 파일명 : " + systemName);
			
			//임시저장된 파일을 원하는 경로에 저장
			file.transferTo(new File(savePath + "/" + systemName));
			
			DiaryFileVO diaryFile = new DiaryFileVO();
			diaryFile.setOriName(oriName);
			diaryFile.setSystemName(systemName);
			diaryFile.setFilePath(datePath);
			diaryFile.setFileSize(fileSize);
			param.put("dairyFile", diaryFile);
			
		}
		service.write(param);
		
		attr.addFlashAttribute("msg", "게시물이 등록되었습니다.");
		return "redirect:list.do";
	}
	
	@RequestMapping("/dairy/updateForm.do")
	public void updateForm(int no, Model model) throws Exception{
		model.addAttribute("diary", service.updateForm(no));
	}
	
	@RequestMapping("/diary/update.do")
	public String update(DiaryVO diary, RedirectAttributes attr) throws Exception{
		
		service.update(diary);
		
		attr.addFlashAttribute("msg", "게시물이 수정되었습니다");
		return "redirect:list.do";
	}
	
	@RequestMapping("/diary/list.do")
	public void list(DiarySearchVO search, Model model) throws Exception{
		Map<String, Object> result = service.list(search);
		model.addAttribute("list", result.get("list"));
		model.addAttribute("pageResult", result.get("pageResult"));
	}
	
	@RequestMapping("/diary/detail.do")
	public void detail(@RequestParam(value="no") int no, Model model) throws Exception{
		Map<String, Object> result = service.detail(no);
		model.addAttribute("diaryVO", result.get("diaryVO"));
		model.addAttribute("file", result.get("file"));
	}
	
	@RequestMapping("/diary/delete.do")
	public String delete(int no, RedirectAttributes attr) throws Exception{
		service.delete(no);
		attr.addFlashAttribute("msg", "게시물이 삭제되었습니다");
		return "redirect:list.do";
	}
	
}
















