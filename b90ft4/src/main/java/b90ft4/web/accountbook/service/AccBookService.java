package b90ft4.web.accountbook.service;

import java.util.Map;

import b90ft4.web.repository.vo.DebtVO;
import b90ft4.web.repository.vo.ExpenseVO;
import b90ft4.web.repository.vo.IncomeVO;
import b90ft4.web.repository.vo.LoanVO;
import b90ft4.web.repository.vo.SearchVO;

public interface AccBookService {
	
	public Map<String, Object> retrieveBudgetCtgy(String userId) throws Exception;
	
	public void registerExpense(ExpenseVO expense) throws Exception;
	public void registerIncome(IncomeVO income) throws Exception;
	
	public Map<String, Object> retrieveBudgetList(SearchVO search) throws Exception;
	
	public void deleteBudget(SearchVO search) throws Exception;
	public void updateBudget(ExpenseVO expense,IncomeVO income) throws Exception;
	
	public void registerBond(LoanVO loan, DebtVO debt) throws Exception;
	
	public Map<String, Object> retrieveBondList(SearchVO search) throws Exception; 
	
	public void deleteBond(SearchVO search) throws Exception;
	
	public void updateBond(LoanVO loan,DebtVO debt) throws Exception;
	
	public void makeExcel(SearchVO search) throws Exception;
	
	
}
