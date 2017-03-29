package b90ft4.web.workout.service;

import org.springframework.beans.factory.annotation.Autowired;

import b90ft4.web.repository.mapper.WorkoutMapper;
import b90ft4.web.repository.vo.WorkoutVO;

public class WorkoutServiceImpl implements WorkoutService {

	@Autowired
	private WorkoutMapper wm;
	//워크아웃 리스트 조회

	@Override
	public WorkoutVO workoutList(WorkoutVO workoutVO) throws Exception {
		
		return null;
	}




}
