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
import b90ft4.web.repository.vo.WorkoutUserInfoVO;
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
	@RequestMapping("/workoutCal.do")
	public String workoutCal(Model model) throws Exception{//jsp에 뿌려줄 데이터를 모델 객체에 담는다
		
		List<WorkoutVO> list = ws.workoutList();

		model.addAttribute("list",list);
		
		return "workout/workoutCal";
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
	@RequestMapping("/selectWorkoutUserInfo.do")
	public WorkoutUserInfoVO selectWorkoutUserInfo(String userId) throws Exception{
		System.out.println(userId);
		WorkoutUserInfoVO list = ws.workoutUserInfoSelect(userId);
		return list;
	}

	@ResponseBody
	@RequestMapping("/updateWorkoutUserInfo.do")
	public void updateWorkoutUserInfo(String userId, int userHeight, int userWeight, int userAge, String userGender) throws Exception{
		// 매치되는 userId가 없는 경우에 대한 insert 처리도 해줘야 함..
		//셀렉트 쿼리 실행뒤 나온 스트링값을 넣어줌
		//System.out.println("update userId : " + userId);
		String checkUserId = ws.workoutUserInfoSelectUserId(userId);
		//System.out.println(checkUserId);
		if(checkUserId.equals("null")){
			System.out.println("insert");
			//매치되는 값이 없을 경우
			ws.workoutUserInfoInsert(userId, userHeight, userWeight, userAge, userGender);
		
			
		}
		else{
			System.out.println("update");
			//매치되는 경우
			ws.workoutUserInfoUpdate(userId, userHeight, userWeight, userAge, userGender);
			
			}
		
		//이 서비스가 실패하는 경우 굳이 실패 메세지를 넘겨줄 필요 없이 html단에서 var로 실패했다는 메세지 심어넣어놨다가 정상적으로 값이 넘어오지 않을 경우 그 메세지를 보여주면 됨.
	}
	
	@ResponseBody
	@RequestMapping("/deleteWorkoutUserInfo.do")
	public void deleteWorkoutUserInfo(String userId) throws Exception{
		System.out.println(userId);
		ws.workoutUserInfoDelete(userId);
	}

	@ResponseBody
	@RequestMapping("/selectWorkoutStatisticsList.do")
	public List<WorkoutStatisticsVO> WorkoutStatisticsList(String today , String userId) throws Exception{	
		List<WorkoutStatisticsVO> list = ws.workoutStatisticsList(today , userId);
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/UpdateWorkoutStatistics.do")
	public void WorkoutStatisticUpdate(int spentCal,int intakeCal,String today , String userId) throws Exception{
		System.out.println("UpdateWorkoutStatistics Controller load");
		ws.workoutStatisticsUpdate(spentCal,intakeCal,today,userId);
		
	}
	@ResponseBody
	@RequestMapping("/InsertWorkoutStatistics.do")
	public String WorkoutStatisticInsert(String today,String userId) throws Exception{
		/*System.out.println("InsertWorkoutStatistics load");
		System.out.println("today :" + today + ",userId : " + userId );*/
		String workoutStatisticsInsertMsg = ws.workoutStatisticsInsert(today,userId);
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
	
	@RequestMapping("/testhandlebars.do")
	public String testhandlebars (Model model) throws Exception{

		return "workout/testhandlebars";
	}
	
	@RequestMapping("/timerTest.do")
	public String TimerTest (Model model) throws Exception{
		
		return "workout/timerTest";
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



}
