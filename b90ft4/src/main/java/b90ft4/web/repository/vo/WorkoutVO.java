package b90ft4.web.repository.vo;

import java.util.Date;

public class WorkoutVO {
	private int workoutNo;
	private String userId;
	private Date workoutDay;
	private int isBasic;
	
	public int getWorkoutNo() {
		return workoutNo;
	}
	public void setWorkoutNo(int workoutNo) {
		this.workoutNo = workoutNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getWorkoutDay() {
		return workoutDay;
	}
	public void setWorkoutDay(Date workoutDay) {
		this.workoutDay = workoutDay;
	}
	public int getIsBasic() {
		return isBasic;
	}
	public void setIsBasic(int isBasic) {
		this.isBasic = isBasic;
	}
	
}
