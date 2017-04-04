package b90ft4.web.repository.vo;

import java.util.Date;

public class ExpenseVO {
	
	private int expenseNo;
	private String userId;
	private int expenseCategoryNo;
	private String expenseCategoryName;
	private String expenseContent;
	private int expenseAmount;
	private String expenseDate;
	
	public String getExpenseCategoryName() {
		return expenseCategoryName;
	}
	public void setExpenseCategoryName(String expenseCategoryName) {
		this.expenseCategoryName = expenseCategoryName;
	}
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
	
	public int getExpenseCategoryNo() {
		return expenseCategoryNo;
	}
	public void setExpenseCategoryNo(int expenseCategoryNo) {
		this.expenseCategoryNo = expenseCategoryNo;
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
	public String getExpenseDate() {
		return expenseDate;
	}
	public void setExpenseDate(String expenseDate) {
		this.expenseDate = expenseDate;
	}
	
	
}
