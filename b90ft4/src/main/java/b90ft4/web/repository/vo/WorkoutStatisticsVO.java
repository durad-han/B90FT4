package b90ft4.web.repository.vo;

import java.util.Date;

public class WorkoutStatisticsVO {
	private Date workoutDay;
	private int spentCal;
	private int intakeCal;
	
	public Date getWorkoutDay() {
		return workoutDay;
	}
	public void setWorkoutDay(Date workoutDay) {
		this.workoutDay = workoutDay;
	}
	public int getSpentCal() {
		return spentCal;
	}
	public void setSpentCal(int spentCal) {
		this.spentCal = spentCal;
	}
	public int getIntakeCal() {
		return intakeCal;
	}
	public void setIntakeCal(int intakeCal) {
		this.intakeCal = intakeCal;
	}
	
}
