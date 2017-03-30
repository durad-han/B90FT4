package b90ft4.web.repository.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import b90ft4.web.repository.vo.WorkoutVO;

@Repository
public interface WorkoutMapper {
	public List<WorkoutVO> selectWorkoutList() throws Exception; 

}
