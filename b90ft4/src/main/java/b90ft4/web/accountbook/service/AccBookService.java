package b90ft4.web.accountbook.service;

import java.util.Map;

import b90ft4.web.repository.vo.ExpenseVO;
import b90ft4.web.repository.vo.IncomeVO;
import b90ft4.web.repository.vo.SearchVO;

public interface AccBookService {
	
	public Map<String, Object> retrieveBudgetCtgy(String userId) throws Exception;
	
	public void registerExpense(ExpenseVO expense) throws Exception;
	public void registerIncome(IncomeVO income) throws Exception;
	
	public Map<String, Object> retrieveBudgetList(SearchVO search) throws Exception;
	
}
