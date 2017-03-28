package b90ft4.web.repository.vo;

import java.util.Date;

public class ScheduleVO {
	private int scheduleNo;
	private String userId;
	private Date start;
	private Date end;
	private String title;
	private String content;
	private int category;
	private int importance;
	private int achieve;
	
	public int getScheduleNo() {
		return scheduleNo;
	}
	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getStart() {
		return start;
	}
	public void setStart(Date start) {
		this.start = start;
	}
	public Date getEnd() {
		return end;
	}
	public void setEnd(Date end) {
		this.end = end;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getImportance() {
		return importance;
	}
	public void setImportance(int importance) {
		this.importance = importance;
	}
	public int getAchieve() {
		return achieve;
	}
	public void setAchieve(int achieve) {
		this.achieve = achieve;
	}
	
}
