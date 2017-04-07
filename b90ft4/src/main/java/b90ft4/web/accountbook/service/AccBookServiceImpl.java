package b90ft4.web.accountbook.service;

import java.util.Arrays;
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
		
		if(search.getBudgetSearchCode()==3){
			System.out.println(search.getUserId());
			System.out.println(search.getStartDate());
			System.out.println(search.getEndDate());
			result.put("monthBudget",dao.selectExpenseCtgySum(search));
			return result;
		}
		
		
		result.put("expense", dao.selectExpense(search));
		result.put("income", dao.selectIncome(search));
		
		String[] temp = dao.selectExpenpseEachDayCount(search);
		int[] temp2 = new int[temp.length];
		for(int i=0;i<temp.length;i++) {
			temp2[i] = Integer.parseInt(temp[i]);
		}
		result.put("expenseEachDayCount", temp2);
		
		temp = dao.selectIncomeEachDayCount(search);
		temp2 = new int[temp.length];
		for(int i=0;i<temp.length;i++) {
			temp2[i] = Integer.parseInt(temp[i]);
		}
		result.put("incomeEachDayCount", temp2);
		
		return result;
	
	}
	
	public void deleteBudget(SearchVO search) throws Exception{
		if(search.getBudgetCode()==0){
			dao.deleteExpense(search);
		}else {
			dao.deleteIncome(search);
		}
	}
	
	public void updateBudget(ExpenseVO expense,IncomeVO income) 
			throws Exception{
		
		if(expense.getExpenseNo()!=0){
			dao.updateExpense(expense);
		}
		
		if(income.getIncomeNo()!=0){
			dao.updateIncome(income);
		}
		
	}
	

}
