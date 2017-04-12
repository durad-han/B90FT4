package b90ft4.web.repository.vo;

public class WorkoutSetVO {
	private int workoutSetNo;
	private int workoutNo;
	private int typeACount;
	private String typeBTime;
	private int spentCal;
	private String intervalTime;
	private String workoutDescription;
	private char WorkoutType;
	public char getWorkoutType() {
		return WorkoutType;
	}
	public void setWorkoutType(char workoutType) {
		WorkoutType = workoutType;
	}
	public int getWorkoutSetNo() {
		return workoutSetNo;
	}
	public void setWorkoutSetNo(int workoutSetNo) {
		this.workoutSetNo = workoutSetNo;
	}
	public int getWorkoutNo() {
		return workoutNo;
	}
	public void setWorkoutNo(int workoutNo) {
		this.workoutNo = workoutNo;
	}
	public int getTypeACount() {
		return typeACount;
	}
	public void setTypeACount(int typeACount) {
		this.typeACount = typeACount;
	}
	public String getTypeBTime() {
		return typeBTime;
	}
	public void setTypeBTime(String typeBTime) {
		this.typeBTime = typeBTime;
	}
	public int getSpentCal() {
		return spentCal;
	}
	public void setSpentCal(int spentCal) {
		this.spentCal = spentCal;
	}
	public String getIntervalTime() {
		return intervalTime;
	}
	public void setIntervalTime(String intervalTime) {
		this.intervalTime = intervalTime;
	}
	public String getWorkoutDescription() {
		return workoutDescription;
	}
	public void setWorkoutDescription(String workoutDescription) {
		this.workoutDescription = workoutDescription;
	}

}
