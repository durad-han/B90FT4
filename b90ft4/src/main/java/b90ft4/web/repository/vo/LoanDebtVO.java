package b90ft4.web.repository.vo;

import java.util.Date;

public class LoanDebtVO {
	private int loanDebtNo;
	private String userId;
	private String partner;
	private String content;
	private int amount;
	private Date debtDate;
	
	public int getLoanDebtNo() {
		return loanDebtNo;
	}
	public void setLoanDebtNo(int loanDebtNo) {
		this.loanDebtNo = loanDebtNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPartner() {
		return partner;
	}
	public void setPartner(String partner) {
		this.partner = partner;
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
	public Date getDebtDate() {
		return debtDate;
	}
	public void setDebtDate(Date debtDate) {
		this.debtDate = debtDate;
	}
	
}
