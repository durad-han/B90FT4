package b90ft4.web.main.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import b90ft4.web.main.service.MainService;

@Controller
@RequestMapping("/main")
public class MainController {
	@Autowired
	private MainService ms;
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/main.do")
	public void mainPage (){
		logger.debug("hello world, main menu selector speaking.");
	}
	
	@RequestMapping("/testMain.do")
	public void testPage (){
		logger.debug("hello world, main menu selector speaking.");
	}
	
	@RequestMapping("/options.do")
	public void options (){
		logger.debug("options menu");
	}

	@RequestMapping("/news.do")
 	public String news() {
		return "news/news";
	}
	
	
	@RequestMapping("/leaderBoard.do")
	public void leaderBoard() {
	}
	
	
	@ResponseBody
	@RequestMapping("/newsImg.do")
	public String newsImg(String url) throws Exception {
		System.out.println(url);
		
		URL u = new URL(url);
		
		InputStream in = u.openStream();
		
		InputStreamReader isr = new InputStreamReader(in, "utf-8");
		
		// 속도 개선 
		BufferedReader br = new BufferedReader(isr);
	
		String result="";

		while (true) {
			// readLine 개행은 받아오지 않는다.
			String line = br.readLine();
			if(line == null) break;
			result+=(line+="\n");
		}
		br.close();
		
		int first = result.indexOf("<figure>");
		int head = result.indexOf("<img",first);
		int tail = result.indexOf(">",head);
		result = result.substring(head, tail+1);
		return result;
	}
	
	
	

}
