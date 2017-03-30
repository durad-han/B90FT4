package b90ft4.web.repository.vo;

import java.util.Date;

public class ExpenseVO {
	
	private int expenseNo;
	private String userId;
	private int expenseCategoryId;
	private String expenseContent;
	private int expenseAmount;
	Date expenseDate;
	
	public int getExpenseNo() {
		return expenseNo;
	}
	public void setExpenseNo(int expenseNo) {
		this.expenseNo = expenseNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getExpenseCategoryId() {
		return expenseCategoryId;
	}
	public void setExpenseCategoryId(int expenseCategoryId) {
		this.expenseCategoryId = expenseCategoryId;
	}
	public String getExpenseContent() {
		return expenseContent;
	}
	public void setExpenseContent(String expenseContent) {
		this.expenseContent = expenseContent;
	}
	public int getExpenseAmount() {
		return expenseAmount;
	}
	public void setExpenseAmount(int expenseAmount) {
		this.expenseAmount = expenseAmount;
	}
	public Date getExpenseDate() {
		return expenseDate;
	}
	public void setExpenseDate(Date expenseDate) {
		this.expenseDate = expenseDate;
	}
	
}
