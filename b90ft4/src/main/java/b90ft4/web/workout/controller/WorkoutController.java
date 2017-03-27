package b90ft4.web.workout.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import b90ft4.web.workout.service.WorkoutService;

@RequestMapping("/workout")
@Controller
public class WorkoutController {
	
	private WorkoutService ws;
	
	@RequestMapping("/camInit.do")
	public void camInit(){
		System.out.println("camInit started");
	}

}
