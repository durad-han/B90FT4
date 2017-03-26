package b90ft4.web.repository.vo;

import java.util.Date;

public class ScheduleVO {
	private int scheduleSeq;
	private int userSeq;
	private Date schStart;
	private Date schEnd;	
	private String title;
	private String content;
	private int budget;	
	private int category;	
	private int importance;
	private int achieve;
	
	public int getScheduleSeq() {
		return scheduleSeq;
	}
	public void setScheduleSeq(int scheduleSeq) {
		this.scheduleSeq = scheduleSeq;
	}
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public Date getSchStart() {
		return schStart;
	}
	public void setSchStart(Date schStart) {
		this.schStart = schStart;
	}
	public Date getSchEnd() {
		return schEnd;
	}
	public void setSchEnd(Date schEnd) {
		this.schEnd = schEnd;
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
	public int getBudget() {
		return budget;
	}
	public void setBudget(int budget) {
		this.budget = budget;
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

