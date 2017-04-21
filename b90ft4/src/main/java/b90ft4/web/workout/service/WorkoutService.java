package b90ft4.web.workout.service;

import java.util.List;

import b90ft4.web.repository.vo.WorkoutSetVO;
import b90ft4.web.repository.vo.WorkoutStatisticsVO;
import b90ft4.web.repository.vo.WorkoutVO;

public interface WorkoutService {
	List<WorkoutVO> workoutList() throws Exception;
	List<WorkoutSetVO> workoutSetList(int workoutNo) throws Exception;
	List<WorkoutStatisticsVO> WorkoutStatisticsList() throws Exception;
}
