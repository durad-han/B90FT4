package b90ft4.web.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import b90ft4.web.main.service.MainService;

@RequestMapping
@Controller
public class MainController {
	@Autowired
	private MainService ms;
	
	@RequestMapping("/main/main.do")
	public void mainPage (){
		System.out.println("hello world");
	}
	

}
