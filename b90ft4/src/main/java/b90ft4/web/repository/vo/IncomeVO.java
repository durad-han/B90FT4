package b90ft4.web.repository.vo;

import java.util.Date;

public class IncomeVO {
	
	private int incomeNo;
	private String userId;
	private int incomeCategoryId;
	private String incomeContent;
	private int incomeAmount;
	Date incomeDate;
	
	public int getIncomeNo() {
		return incomeNo;
	}
	public void setIncomeNo(int incomeNo) {
		this.incomeNo = incomeNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getIncomeCategoryId() {
		return incomeCategoryId;
	}
	public void setIncomeCategoryId(int incomeCategoryId) {
		this.incomeCategoryId = incomeCategoryId;
	}
	public String getIncomeContent() {
		return incomeContent;
	}
	public void setIncomeContent(String incomeContent) {
		this.incomeContent = incomeContent;
	}
	public int getIncomeAmount() {
		return incomeAmount;
	}
	public void setIncomeAmount(int incomeAmount) {
		this.incomeAmount = incomeAmount;
	}
	public Date getIncomeDate() {
		return incomeDate;
	}
	public void setIncomeDate(Date incomeDate) {
		this.incomeDate = incomeDate;
	}

	
}
