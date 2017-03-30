package b90ft4.web.workout.service;

import java.util.List;

import b90ft4.web.repository.vo.WorkoutVO;

public interface WorkoutService {
	List<WorkoutVO> workoutList() throws Exception;

}
