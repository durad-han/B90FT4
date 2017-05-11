package b90ft4.web.repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import b90ft4.web.repository.vo.WorkoutDateTestVO;
import b90ft4.web.repository.vo.WorkoutSetVO;
import b90ft4.web.repository.vo.WorkoutStatisticsVO;
import b90ft4.web.repository.vo.WorkoutUserInfoVO;
import b90ft4.web.repository.vo.WorkoutVO;

@Repository
public interface WorkoutMapper {
	public List<WorkoutVO> retrieveWorkoutList() throws Exception; 
	public List<WorkoutSetVO> retrieveWorkoutSetList(int workoutNo) throws Exception; 
	public List<WorkoutStatisticsVO> retrieveWorkoutStatisticsList(@Param("today") String today,@Param("userId") String userId) throws Exception; 
	public void insertWorkoutStatisticsList(@Param("today") String today,@Param("userId") String userId) throws Exception; 
	public WorkoutDateTestVO retrieveWorkoutDateTestList() throws Exception;
	public String retrieveWorkoutUserInfoUserId(String userId) throws Exception;
	public WorkoutUserInfoVO retrieveWorkoutUserInfo(String userId) throws Exception;
	public void modifyWorkoutStatisticsList(
			@Param("spentCal") String spentCal,
			@Param("intakeCal") String intakeCal,
			@Param("today") String today,
			@Param("userId") String userId)throws Exception;
	public void insertWorkoutUserInfo(
			@Param("userId") String userId ,
			@Param("userGender") String userGender,
			@Param("userHeight") int userHeight,
			@Param("userWeight") int userWeight,
			@Param("userAge") int userAge) throws Exception;
	public void updateWorkoutUserInfo(
			@Param("userId") String userId ,
			@Param("userGender") String userGender,
			@Param("userHeight") int userHeight,
			@Param("userWeight") int userWeight,
			@Param("userAge") int userAge
			) throws Exception;
	public void deleteWorkoutUserInfo(String userId) throws Exception;
}
