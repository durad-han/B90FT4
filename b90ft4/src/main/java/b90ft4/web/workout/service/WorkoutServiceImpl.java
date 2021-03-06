package b90ft4.web.workout.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import b90ft4.web.repository.mapper.WorkoutMapper;
import b90ft4.web.repository.vo.WorkoutDateTestVO;
import b90ft4.web.repository.vo.WorkoutFoodNutritionFactVO;
import b90ft4.web.repository.vo.WorkoutSetVO;
import b90ft4.web.repository.vo.WorkoutStatisticsVO;
import b90ft4.web.repository.vo.WorkoutUserInfoVO;
import b90ft4.web.repository.vo.WorkoutVO;
@Service
public class WorkoutServiceImpl implements WorkoutService {

	@Autowired
	private WorkoutMapper wm;
	//워크아웃 리스트 조회

	@Override
	public List<WorkoutVO> workoutList() throws Exception {
	//	System.out.println("workoutListService");
		List<WorkoutVO> list = wm.retrieveWorkoutList();
		//	System.out.println("workoutListService done");
		return list;
	}
	@Override
	public List<WorkoutSetVO> workoutSetList(int workoutNo) throws Exception {
		// TODO Auto-generated method stub
		List<WorkoutSetVO> list = wm.retrieveWorkoutSetList(workoutNo);
		return list;
	}

	@Override
	public List<WorkoutStatisticsVO> workoutStatisticsList(String today,String userId) throws Exception {
		// TODO Auto-generated method stub
		List<WorkoutStatisticsVO> list = wm.retrieveWorkoutStatisticsList(today,userId);
		return list;
	}
	@Override
	public List<WorkoutStatisticsVO> workoutStatisticsListWeek(String userId) throws Exception {
		// TODO Auto-generated method stub
		List<WorkoutStatisticsVO> list = wm.retrieveWorkoutStatisticsListWeek(userId);
		return list;
	}
	@Override
	public String workoutStatisticsInsert(String today,String userId) throws Exception {
		// TODO Auto-generated method stub
		//System.out.println("workoutStatisticsInsert load");
		//System.out.println("today :" + today + ",userId : " + userId);
		String workoutStatisticsInsertMsg = "";
		List<WorkoutStatisticsVO> list = wm.retrieveWorkoutStatisticsList(today,userId);
		if(list.size() <= 0){
			
			wm.insertWorkoutStatisticsList(today,userId);
			workoutStatisticsInsertMsg = "오늘 운동 칼로리 컬럼 추가됨.";
		}
		else{
			
			workoutStatisticsInsertMsg = "오늘 운동 칼로리 컬럼 생성 확인.";
		}
		
		return workoutStatisticsInsertMsg;
	}
	
	@Override
	public void workoutStatisticsUpdate(int spentCal,int intakeCal,String today,String userId) throws Exception {
		// TODO Auto-generated method stub
		String tempVal = spentCal+""; 
		String tempVal2 = intakeCal+""; 
		/*
		System.out.println("spentCal : " + spentCal);
		System.out.println("intakeCal : " + intakeCal);
		System.out.println("today : " + today.getClass().getName());
		*/
		wm.modifyWorkoutStatisticsList(tempVal , tempVal2 , today , userId);
	
	}
	@Override
	public void workoutStatisticsUpdateByWorkoutCal(int spentCal, int intakeCal, String today, String userId)
			throws Exception {
		// TODO Auto-generated method stub
		String tempVal = spentCal+""; 
		String tempVal2 = intakeCal+""; 
		wm.modifyWorkoutStatisticsListByWorkoutCal(tempVal , tempVal2 , today , userId);
	}
	@Override
	public List<WorkoutDateTestVO> workoutDateTest() throws Exception {
		// TODO Auto-generated method stub
		List<WorkoutDateTestVO> date = wm.retrieveWorkoutDateTestList();
		
		return date;
	}
	
	@Override
	public String workoutUserInfoSelectUserId(String userId) throws Exception {
		// TODO Auto-generated method stub
		
//		System.out.println("workoutUserInfoSelectUserId : " + userId);
//		System.out.println(""+wm.retrieveWorkoutUserInfoUserId(userId));
		String userIdResult = "";
		if(wm.retrieveWorkoutUserInfoUserId(userId)==null){
			userIdResult = "null";
		}
		else{
			userIdResult = wm.retrieveWorkoutUserInfoUserId(userId);
		}
		System.out.println(userIdResult);
		return userIdResult;
	}
	
	@Override
	public WorkoutUserInfoVO workoutUserInfoSelect(String userId) throws Exception {
		// TODO Auto-generated method stub
		WorkoutUserInfoVO workoutUserInfo = wm.retrieveWorkoutUserInfo(userId);
		return workoutUserInfo;
	}
	
	@Override
	public void workoutUserInfoUpdate(String userId, int userHeight, int userWeight, int userAge, String userGender)
			throws Exception {
		// TODO Auto-generated method stub
		wm.updateWorkoutUserInfo(userId, userGender, userHeight, userWeight, userAge);
	}
	
	@Override
	public void workoutUserInfoDelete(String userId) throws Exception {
		// TODO Auto-generated method stub
		wm.deleteWorkoutUserInfo(userId);
	}
	
	@Override
	public void workoutUserInfoInsert(String userId, int userHeight, int userWeight, int userAge, String userGender)
			throws Exception {
		// TODO Auto-generated method stub
		wm.insertWorkoutUserInfo(userId, userGender, userHeight, userWeight, userAge);
	}
	@Override
	public List<WorkoutFoodNutritionFactVO> workoutFoodNutritionFactList(String foodValue) throws Exception {
		// TODO Auto-generated method stub
		//System.out.println("imp까지 옴");
		List<WorkoutFoodNutritionFactVO> list = wm.selectWorkoutFoodNutritionFactList(foodValue);
		//System.out.println("imp리턴받음");
		return list;
	}


	
}
