package b90ft4.web.workout.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import b90ft4.web.repository.mapper.WorkoutMapper;
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
	public List<WorkoutStatisticsVO> WorkoutStatisticsList() throws Exception {
		// TODO Auto-generated method stub
		List<WorkoutStatisticsVO> list = wm.retrieveWorkoutStatisticsList();
		return list;
	}





}
