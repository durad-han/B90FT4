package b90ft4.web.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import b90ft4.web.schedule.service.ScheduleService;

@RequestMapping
@Controller
public class MainController {
	@Autowired
	private ScheduleService ss;
	
	@RequestMapping("/main/main.do")
	public void retrieveScheduleList (){
		System.out.println("hello world");
	}
	

}
