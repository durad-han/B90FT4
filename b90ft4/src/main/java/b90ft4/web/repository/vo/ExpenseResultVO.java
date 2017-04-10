package b90ft4.web.repository.vo;

public class ExpenseResultVO {
	
	private String expenseCategoryName;
	private int eachSum;
	private int expenseCategoryNo;
	
	public int getExpenseCategoryNo() {
		return expenseCategoryNo;
	}
	public void setExpenseCategoryNo(int expenseCategoryNo) {
		this.expenseCategoryNo = expenseCategoryNo;
	}
	public String getExpenseCategoryName() {
		return expenseCategoryName;
	}
	public void setExpenseCategoryName(String expenseCategoryName) {
		this.expenseCategoryName = expenseCategoryName;
	}
	public int getEachSum() {
		return eachSum;
	}
	public void setEachSum(int eachSum) {
		this.eachSum = eachSum;
	}
	
}
