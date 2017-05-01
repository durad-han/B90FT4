package b90ft4.web.workout.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import b90ft4.web.repository.vo.WorkoutDateTestVO;
import b90ft4.web.repository.vo.WorkoutSetVO;
import b90ft4.web.repository.vo.WorkoutStatisticsVO;
import b90ft4.web.repository.vo.WorkoutVO;
import b90ft4.web.workout.service.WorkoutService;
@RequestMapping("/workout")
@Controller
public class WorkoutController {
	
	@Autowired
	private WorkoutService ws;

	@RequestMapping("/workout.do")
	public String workout(Model model) throws Exception{//jsp에 뿌려줄 데이터를 모델 객체에 담는다
		
		List<WorkoutVO> list = ws.workoutList();

		model.addAttribute("list",list);
		
		return "workout/workout";
	}
	
	/*
	@RequestMapping("/workoutList.do")
	public String workoutList(Model model) throws Exception{

		List<WorkoutVO> list = ws.workoutList();
		model.addAttribute("list",list);
		
		
		return "workout/workoutList";
	}
	*/

	@ResponseBody
	@RequestMapping("/selectWorkoutStatisticsList.do")
	public List<WorkoutStatisticsVO> WorkoutStatisticsList(String today) throws Exception{	
		List<WorkoutStatisticsVO> list = ws.WorkoutStatisticsList(today);
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/UpdateWorkoutStatistics.do")
	public void WorkoutStatisticUpdate(int spentCal,int intakeCal,String today) throws Exception{
		System.out.println("UpdateWorkoutStatistics Controller load");
		ws.WorkoutStatisticsUpdate(spentCal,intakeCal,today);
		
	}
	@ResponseBody
	@RequestMapping("/InsertWorkoutStatistics.do")
	public String WorkoutStatisticInsert(String today) throws Exception{	
		String workoutStatisticsInsertMsg = ws.WorkoutStatisticsInsert(today);
		return workoutStatisticsInsertMsg;
	}
	

	@ResponseBody
	@RequestMapping("/workoutList.do")
	public List<WorkoutVO> workoutList(String userId) throws Exception{
		List<WorkoutVO> list = ws.workoutList();
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/workoutForm.do")
	public List<WorkoutSetVO> workoutForm (int workoutNo) throws Exception{
		List<WorkoutSetVO> setList = ws.workoutSetList(workoutNo);
		return setList;
	}
	@ResponseBody
	@RequestMapping("/workoutDateTest.do")
	public WorkoutDateTestVO workoutDateTest () throws Exception{
		WorkoutDateTestVO date = ws.workoutDateTest();
		return date;
	}
	
/*	@ResponseBody
	@RequestMapping("/wokroutRecodeTest.do")
	public void wokroutRecodeTest() throws Exception{
		
		
	}*/
	
/*	
	@RequestMapping("/workoutTypeA.do")
	public String workoutListTypeA (Model model,int workoutNo) throws Exception{
		
		System.out.println(workoutNo);
		System.out.println("workoutTypeA");
		List<WorkoutSetVO> setList = ws.workoutSetList(workoutNo);
		model.addAttribute("setList",setList);
		return "workout/workoutTypeA";
	}
	
	@RequestMapping("/workoutTypeB.do")
	public String workoutListTypeB (Model model,int workoutNo) throws Exception{
		System.out.println(workoutNo);
		System.out.println("workoutTypeB");
		List<WorkoutSetVO> setList = ws.workoutSetList(workoutNo);
		model.addAttribute("setList",setList);
		return "workout/workoutTypeB";
	}
	
	@RequestMapping("/workoutForm.do")
	public String workoutForm (Model model,int workoutNo) throws Exception{
		System.out.println(workoutNo);
		List<WorkoutSetVO> setList = ws.workoutSetList(workoutNo);
		model.addAttribute("setList",setList);
		return "workout/workoutForm";
	}
*/	
	@RequestMapping("/testhandlebars.do")
	public String testhandlebars (Model model) throws Exception{

		return "workout/testhandlebars";
	}
	
	@RequestMapping("/timerTest.do")
	public String TimerTest (Model model) throws Exception{
		
		return "workout/timerTest";
	}
	


}
