package b90ft4.web.schedule.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import b90ft4.web.schedule.service.ScheduleService;

@RequestMapping
@Controller
public class ScheduleController {
	@Autowired
	private ScheduleService ss;
	
	@RequestMapping("/schedule/schedule.do")
	public void retrieveScheduleList (){
		System.out.println("hello world");
	}
	

}
