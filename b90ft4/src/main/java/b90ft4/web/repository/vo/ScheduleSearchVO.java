package b90ft4.web.repository.vo;

import java.util.Date;

public class ScheduleSearchVO extends SearchVO {
	private Date scheduleDate;
	private String userId;
	private String title;
	private int category;
	private int achieve;
	
	public Date getScheduleDate() {
		return scheduleDate;
	}
	public void setScheduleDate(Date scheduleDate) {
		this.scheduleDate = scheduleDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getAchieve() {
		return achieve;
	}
	public void setAchieve(int achieve) {
		this.achieve = achieve;
	}

}
