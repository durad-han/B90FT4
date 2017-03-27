package b90ft4.web.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import b90ft4.web.main.service.MainService;

@Controller
@RequestMapping("/main")
public class MainController {
	@Autowired
	private MainService ms;
	
<<<<<<< HEAD
	@RequestMapping("/main/main.do")
	public void mainPage (){
=======
	@RequestMapping("/main.do")
	public void retrieveScheduleList (){
>>>>>>> a9704669a257954c240aae976bc95f9239f816b2
		System.out.println("hello world");
	}
	

}
