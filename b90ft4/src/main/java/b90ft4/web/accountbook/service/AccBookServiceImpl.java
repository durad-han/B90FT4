package b90ft4.web.accountbook.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import b90ft4.web.repository.mapper.AccBookMapper;
import b90ft4.web.repository.vo.ExpenseVO;
import b90ft4.web.repository.vo.IncomeVO;
import b90ft4.web.repository.vo.SearchVO;

@Service
public class AccBookServiceImpl implements AccBookService {

	@Autowired
	private AccBookMapper dao;
	
	public Map<String, Object> retrieveBudgetCtgy(String userId) 
			throws Exception{
		
		Map<String, Object> result = new HashMap<>();
		
		result.put("expenseCtgy", dao.selectExpenseCtgy(userId));
		result.put("incomeCtgy", dao.selectIncomeCtgy(userId));
		return result;
		
	}
	
	public void registerExpense(ExpenseVO expense) 
			throws Exception{
		dao.insertExpense(expense);
	}
	public void registerIncome(IncomeVO income) 
			throws Exception{
		dao.insertIncome(income);
	}

	public Map<String, Object> retrieveBudgetList(SearchVO search) 
			throws Exception{
		
		Map<String, Object> result = new HashMap<>();
		
		result.put("expense", dao.selectExpense(search));
		result.put("income", dao.selectIncome(search));
		return result;
	
	}

}
