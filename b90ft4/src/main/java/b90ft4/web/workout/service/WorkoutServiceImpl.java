package b90ft4.web.workout.service;

import java.util.List;

import org.aspectj.weaver.ast.Instanceof;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.org.apache.bcel.internal.generic.INSTANCEOF;

import b90ft4.web.repository.mapper.WorkoutMapper;
import b90ft4.web.repository.vo.WorkoutDateTestVO;
import b90ft4.web.repository.vo.WorkoutSetVO;
import b90ft4.web.repository.vo.WorkoutStatisticsVO;
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
	public List<WorkoutStatisticsVO> WorkoutStatisticsList(String today) throws Exception {
		// TODO Auto-generated method stub
		List<WorkoutStatisticsVO> list = wm.retrieveWorkoutStatisticsList(today);
		return list;
	}
	
	@Override
	public String WorkoutStatisticsInsert(String today) throws Exception {
		// TODO Auto-generated method stub
		
		String workoutStatisticsInsertMsg = "";
		List<WorkoutStatisticsVO> list = wm.retrieveWorkoutStatisticsList(today);
		if(list.size() <= 0){
			
			wm.insertWorkoutStatisticsList(today);
			workoutStatisticsInsertMsg = "오늘 운동 칼로리 컬럼 추가됨.";
		}
		else{
			
			workoutStatisticsInsertMsg = "오늘 운동 칼로리 컬럼 생성 확인.";
		}
		
		return workoutStatisticsInsertMsg;
	}
	
	@Override
	public void WorkoutStatisticsUpdate(int spentCal,int intakeCal,String today) throws Exception {
		// TODO Auto-generated method stub
		String tempVal = spentCal+""; 
		String tempVal2 = intakeCal+""; 
		System.out.println("spentCal : " + spentCal);
		System.out.println("intakeCal : " + intakeCal);
		System.out.println("today : " + today.getClass().getName());
		wm.modifyWorkoutStatisticsList(tempVal , tempVal2 , today);
	
	}
	@Override
	public WorkoutDateTestVO workoutDateTest() throws Exception {
		// TODO Auto-generated method stub
		WorkoutDateTestVO date = wm.retrieveWorkoutDateTestList();
		System.out.println(date.getWorkoutDay().toString());
		return date;
	}





}
