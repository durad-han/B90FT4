package b90ft4.web.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping("/options.do")
	public void options (){
		logger.debug("options menu");
	}


}
