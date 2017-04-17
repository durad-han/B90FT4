package kr.co.mlec.datepicker.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.mlec.repository.mapper.BoardMapper;
import kr.co.mlec.repository.vo.BoardVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardMapper dao;
	
	// Logger 클래스의 인스턴스를 받아온다.
	static Logger logger = Logger.getLogger(BoardController.class);
	
	
//	public static void main(String[] args) {
//	    BasicConfigurator.configure();
//	       logger.debug("[DEBUG] Hello log4j.");
//	       logger.info ("[INFO]  Hello log4j.");
//	       logger.warn ("[WARN]  Hello log4j.");
//	       logger.error("[ERROR] Hello log4j.");
//	       logger.fatal("[FATAL] Hello log4j.");
//	       
//	     //logger.log( Level.DEBUG , "debug") 와 동일하다.
//	}
	
	@RequestMapping("/test.do")
	public void test() 
			throws Exception {
//		System.out.println(0/2);
//		System.out.println(2/0);
//		int[] arr = new int[1];
//		arr[0]=1;
//		try {
//			System.out.println(arr[-1]);
//		} catch (Exception e) {
//				logger.warn(e.toString());
//		}
//		System.out.println(dao.count());
		org.apache.ibatis.logging.LogFactory.useLog4JLogging();
//		System.out.println(dao.count());
	}
	
	@ResponseBody
	@RequestMapping("/img.do")
	public String img(MultipartHttpServletRequest res,
					  int CKEditorFuncNum
					  ) throws Exception{
		
		
		ServletContext context = res.getServletContext();
		String path = context.getRealPath("/upload");
		
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
		String datePath = sdf.format(new Date());
		
		String savePath = path + datePath;
		File f = new File(savePath);
		if (!f.exists()) f.mkdirs();
		
		MultipartFile file = res.getFile("upload");
		
		String systemName="";
		String url="";

		String oriName = file.getOriginalFilename();
		
		if (oriName != null && !oriName.equals("")) {
			// 확장자 처리
			String ext = "";
			// 뒤쪽에 있는 . 의 위치 
			int index = oriName.lastIndexOf(".");
			if (index != -1) {
				// 파일명에서 확장자명(.포함)을 추출
				ext = oriName.substring(index);
			}
			
			// 파일 사이즈
//			long fileSize = file.getSize();
//			System.out.println("파일 사이즈 : " + fileSize);
			
			// 고유한 파일명 만들기	
			systemName = "mlec-" + UUID.randomUUID().toString() + ext;
			System.out.println("저장할 파일명 : " + systemName);
		
			// 임시저장된 파일을 원하는 경로에 저장
			file.transferTo(new File(savePath + "/" + systemName));
			
			url = savePath + "/" + systemName;
		}
//		String url="../calendar.jpg";
		url = url.replace("C:\\java90\\tomcat-work\\wtpwebapps\\", "/");
		url = url.replace("\\", "/");
		
		System.out.println(CKEditorFuncNum);
		System.out.println("url : " + url);
		// http://localhost:9090/
		System.out.println("'"+url+"'");
		return "<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction('"+CKEditorFuncNum+"','"+url+"','전송에 성공했습니다.')</script>";
	}
	
	
	
	@RequestMapping("/write.do")
	public  String write(
			HttpServletRequest res,
			Model model
			) throws Exception{
		
		ServletContext context = res.getServletContext();
		String path = context.getRealPath("/upload");
		
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
		String datePath = sdf.format(new Date());
		
		String savePath = path + datePath;
		File f = new File(savePath);
		if (!f.exists()) f.mkdirs();
		
		String content = res.getParameter("editor1");
		System.out.println(content);
//		int i=0;
		
		// 이미지 path 파싱.
		int tail=0;
		int index=0;
		while(true){
			index = content.indexOf("<img alt=",tail);
			if(index==-1) break;
			index+=17;
			System.out.println("index :" + index);
			tail = content.indexOf("\"",index);
			System.out.println("tail :" + tail);
			System.out.println("파싱한 내용 : " + content.substring(index, tail));
		}
		
		
		// 게시판과 파일 테이블에 저장할 글번호를 조회
		BoardVO board = new BoardVO();
		board.setTitle("웹 에디터 실습");
		board.setWriter("김현영");
		board.setContent(res.getParameter("editor1"));
		
		dao.insertBoard(board);
		
		int no = board.getNo();
		System.out.println("no : " + no );
		
		model.addAttribute("board",board);
		
		return "board/detail";
		
	}
	 
}



