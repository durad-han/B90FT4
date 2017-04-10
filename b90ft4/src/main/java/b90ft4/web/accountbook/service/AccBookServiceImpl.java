package b90ft4.web.accountbook.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import b90ft4.web.repository.mapper.AccBookMapper;
import b90ft4.web.repository.vo.DebtVO;
import b90ft4.web.repository.vo.ExpenseVO;
import b90ft4.web.repository.vo.IncomeVO;
import b90ft4.web.repository.vo.LoanVO;
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
			result.put("expenseMonthBudget",dao.selectExpenseCtgySum(search));
			result.put("incomeMonthBudget", dao.selectIncomeCtgySum(search));
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
			return;
		}
		
		if(income.getIncomeNo()!=0){
			dao.updateIncome(income);
			return;
		}
	}
	
	// 대입금 , 차입금 파트.
	
	public void registerBond(LoanVO loan, DebtVO debt) 
			throws Exception {
		
		if(loan.getDebtor() != null){
			dao.insertLoan(loan);
			return;
		}
		
		if(debt.getMoneyLender() != null) {
			dao.insertDebt(debt);
			return;
		}
	}
	
	
	public Map<String, Object> retrieveBondList(SearchVO search) 
			throws Exception{

		Map<String, Object> result = new HashMap<>();
		
		result.put("loan", dao.selectLoan(search));
		result.put("debt", dao.selectDebt(search));
		
		return result;
		
	}
	
	public void deleteBond(SearchVO search) 
			throws Exception{
		
		if(search.getBondCode()==0){
			dao.deleteLoan(search);
		}else {
			dao.deleteDebt(search);
		}
		
	}
	
	public void updateBond(LoanVO loan,DebtVO debt) 
			throws Exception{
		
		if(loan.getLoanNo()!=0){
			dao.updateLoan(loan);
			return;
		}
		
		if(debt.getDebtNo()!=0){
			dao.updateeDebt(debt);
			return;
		}
	}
	

}














