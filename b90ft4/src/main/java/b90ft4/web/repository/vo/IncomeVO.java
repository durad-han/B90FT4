package b90ft4.web.repository.vo;

public class IncomeVO {
	
	private int incomeNo;
	private String userId;
	private int incomeCategoryNo;
	private String incomeContent;
	private int incomeAmount;
	private String incomeDate;
	private String incomeCategoryName;
	
	public int getIncomeNo() {
		return incomeNo;
	}
	public String getIncomeCategoryName() {
		return incomeCategoryName;
	}
	public void setIncomeCategoryName(String incomeCategoryName) {
		this.incomeCategoryName = incomeCategoryName;
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
	
	public int getIncomeCategoryNo() {
		return incomeCategoryNo;
	}
	public void setIncomeCategoryNo(int incomeCategoryNo) {
		this.incomeCategoryNo = incomeCategoryNo;
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
	public String getIncomeDate() {
		return incomeDate;
	}
	public void setIncomeDate(String incomeDate) {
		this.incomeDate = incomeDate;
	}
	
	
}
