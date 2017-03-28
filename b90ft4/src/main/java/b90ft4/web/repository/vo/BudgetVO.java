package b90ft4.web.repository.vo;

import java.util.Date;

public class BudgetVO {
	private int budgetNo;
	private String userId;
	private int budgetCategoryNo;
	private String content;
	private int amount;
	private Date budgetDate;
	
	public int getBudgetNo() {
		return budgetNo;
	}
	public void setBudgetNo(int budgetNo) {
		this.budgetNo = budgetNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getBudgetCategoryNo() {
		return budgetCategoryNo;
	}
	public void setBudgetCategoryNo(int budgetCategoryNo) {
		this.budgetCategoryNo = budgetCategoryNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Date getBudgetDate() {
		return budgetDate;
	}
	public void setBudgetDate(Date budgetDate) {
		this.budgetDate = budgetDate;
	}

}
