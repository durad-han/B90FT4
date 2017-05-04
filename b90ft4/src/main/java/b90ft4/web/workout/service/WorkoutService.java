package b90ft4.web.workout.service;

import java.util.List;

import b90ft4.web.repository.vo.WorkoutDateTestVO;
import b90ft4.web.repository.vo.WorkoutSetVO;
import b90ft4.web.repository.vo.WorkoutStatisticsVO;
import b90ft4.web.repository.vo.WorkoutUserInfoVO;
import b90ft4.web.repository.vo.WorkoutVO;

public interface WorkoutService {
	List<WorkoutVO> workoutList() throws Exception;
	List<WorkoutSetVO> workoutSetList(int workoutNo) throws Exception;
	List<WorkoutStatisticsVO> workoutStatisticsList(String today) throws Exception;
	void workoutStatisticsUpdate(int spentCal,int intakeCal,String today) throws Exception;
	WorkoutDateTestVO workoutDateTest() throws Exception;
	String workoutStatisticsInsert(String today) throws Exception;
	WorkoutUserInfoVO workoutUserInfoSelect(String userId) throws Exception;
	String workoutUserInfoSelectUserId(String userId) throws Exception;
	void workoutUserInfoUpdate(String userId, int userHeight, int userWeight, int userAge, String userGender) throws Exception;
	void workoutUserInfoInsert(String userId, int userHeight, int userWeight, int userAge, String userGender) throws Exception;
	void workoutUserInfoDelete(String userId) throws Exception;

}
