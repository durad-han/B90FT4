package b90ft4.web.repository.vo;

public class SearchVO extends PageVO {

	private String userId;
	private String startDate;
	private int delNo;
	private int budgetCode;
	
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
