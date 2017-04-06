package b90ft4.web.repository.vo;

public class SearchVO extends PageVO {

	private String userId;
	private String startDate;
	private String endDate;
	private int delNo;
	private int budgetCode;
	private int incomeCategoryNo;
	private int expenseCategoryNo;
	
	public int getIncomeCategoryNo() {
		return incomeCategoryNo;
	}
	public void setIncomeCategoryNo(int incomeCategoryNo) {
		this.incomeCategoryNo = incomeCategoryNo;
	}
	public int getExpenseCategoryNo() {
		return expenseCategoryNo;
	}
	public void setExpenseCategoryNo(int expenseCategoryNo) {
		this.expenseCategoryNo = expenseCategoryNo;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getDelNo() {
		return delNo;
	}
	public void setDelNo(int delNo) {
		this.delNo = delNo;
	}
	public int getBudgetCode() {
		return budgetCode;
	}
	public void setBudgetCode(int budgetCode) {
		this.budgetCode = budgetCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	
	
}
