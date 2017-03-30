package b90ft4.web.repository.vo;

import java.util.Date;

public class DebtVO {

	private int debtNo;
	private String userId;
	private String moneyLender;
	private String debtContent;
	private int debtAmount;
	private Date debtDate;
	
	public int getDebtNo() {
		return debtNo;
	}
	public void setDebtNo(int debtNo) {
		this.debtNo = debtNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMoneyLender() {
		return moneyLender;
	}
	public void setMoneyLender(String moneyLender) {
		this.moneyLender = moneyLender;
	}
	public String getDebtContent() {
		return debtContent;
	}
	public void setDebtContent(String debtContent) {
		this.debtContent = debtContent;
	}
	public int getDebtAmount() {
		return debtAmount;
	}
	public void setDebtAmount(int debtAmount) {
		this.debtAmount = debtAmount;
	}
	public Date getDebtDate() {
		return debtDate;
	}
	public void setDebtDate(Date debtDate) {
		this.debtDate = debtDate;
	}
	
	
}
