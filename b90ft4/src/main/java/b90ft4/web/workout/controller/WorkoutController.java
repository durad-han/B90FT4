package b90ft4.web.workout.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import b90ft4.web.repository.vo.WorkoutVO;
import b90ft4.web.workout.service.WorkoutService;
@RequestMapping("/workout")
@Controller
public class WorkoutController {
	
	@Autowired
	private WorkoutService ws;
	
//

//
	@RequestMapping("/workout.do")
	public String workout(Model model) throws Exception{
	//	System.out.println("workout controller");
		List<WorkoutVO> list = ws.workoutList();
	//	System.out.println("workoutList size: "+ list.size());
	//	System.out.println(list.get(0).getWorkoutNo());
	//	System.out.println("workout controller done");
		model.addAttribute("list",list);
		return "workout/workout";
	}
	
	@RequestMapping("/workoutTypeA.do")
	public String workoutList (WorkoutVO workoutVO) throws Exception{
		System.out.println("workoutTypeA");
		
		return "workout/workoutTypeA";
	}

}
