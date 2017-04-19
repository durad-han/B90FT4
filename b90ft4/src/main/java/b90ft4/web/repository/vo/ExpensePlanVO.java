package b90ft4.web.repository.vo;

public class ExpensePlanVO {

	private String expensePlanDate ;	
	private int expenseGoal;
	private String userId;
	private char planStatus;
	
	public String getExpensePlanDate() {
		return expensePlanDate;
	}
	public void setExpensePlanDate(String expensePlanDate) {
		this.expensePlanDate = expensePlanDate;
	}
	public int getExpenseGoal() {
		return expenseGoal;
	}
	public void setExpenseGoal(int expenseGoal) {
		this.expenseGoal = expenseGoal;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public char getPlanStatus() {
		return planStatus;
	}
	public void setPlanStatus(char planStatus) {
		this.planStatus = planStatus;
	}
	
}
