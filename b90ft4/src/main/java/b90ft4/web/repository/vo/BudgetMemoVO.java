package b90ft4.web.repository.vo;

import java.util.Date;

public class BudgetMemoVO {
	private int memoNo;
	private String userId;
	private int posX;
	private int posY;
	private String content;
	private Date regDate;
	
	public int getMemoNo() {
		return memoNo;
	}
	public void setMemoNo(int memoNo) {
		this.memoNo = memoNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getPosX() {
		return posX;
	}
	public void setPosX(int posX) {
		this.posX = posX;
	}
	public int getPosY() {
		return posY;
	}
	public void setPosY(int posY) {
		this.posY = posY;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
}
