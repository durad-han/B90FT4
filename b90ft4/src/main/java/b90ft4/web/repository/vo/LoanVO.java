package b90ft4.web.repository.vo;

public class LoanVO {

	private int loanNo;
	private String userId;
	private String debtor;
	private String loanContent;
	private int loanAmount;
	private String loanDate;
	
	
	public int getLoanNo() {
		return loanNo;
	}
	public void setLoanNo(int loanNo) {
		this.loanNo = loanNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getDebtor() {
		return debtor;
	}
	public void setDebtor(String debtor) {
		this.debtor = debtor;
	}
	public String getLoanContent() {
		return loanContent;
	}
	public void setLoanContent(String loanContent) {
		this.loanContent = loanContent;
	}
	public int getLoanAmount() {
		return loanAmount;
	}
	public void setLoanAmount(int loanAmount) {
		this.loanAmount = loanAmount;
	}
	public String getLoanDate() {
		return loanDate;
	}
	public void setLoanDate(String loanDate) {
		this.loanDate = loanDate;
	}

}
