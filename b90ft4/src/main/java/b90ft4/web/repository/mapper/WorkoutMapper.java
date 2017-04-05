package b90ft4.web.repository.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import b90ft4.web.repository.vo.WorkoutSetVO;
import b90ft4.web.repository.vo.WorkoutVO;

@Repository
public interface WorkoutMapper {
	public List<WorkoutVO> retrieveWorkoutList() throws Exception; 
	public List<WorkoutSetVO> retrieveWorkoutSetList(int workoutNo) throws Exception; 
	
}
