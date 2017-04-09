package b90ft4.web.repository.mapper;

import java.util.List;

import b90ft4.web.repository.vo.ExpenseCategoryVO;
import b90ft4.web.repository.vo.ExpenseResultVO;
import b90ft4.web.repository.vo.ExpenseVO;
import b90ft4.web.repository.vo.IncomeCategoryVO;
import b90ft4.web.repository.vo.IncomeResultVO;
import b90ft4.web.repository.vo.IncomeVO;
import b90ft4.web.repository.vo.SearchVO;

public interface AccBookMapper {
	
	public List<ExpenseCategoryVO> selectExpenseCtgy(String userId) throws Exception;
	public List<IncomeCategoryVO> selectIncomeCtgy(String userId) throws Exception;
	public List<IncomeCategoryVO> count() throws Exception;
	public void insertExpense(ExpenseVO expense) throws Exception;
	public void insertIncome(IncomeVO expense) throws Exception;
	public List<ExpenseVO> selectExpense(SearchVO search) throws Exception;
	public List<IncomeVO> selectIncome(SearchVO search) throws Exception;
	public void deleteExpense (SearchVO search) throws Exception;
	public void deleteIncome (SearchVO search) throws Exception;
	
	public void updateExpense (ExpenseVO expense) throws Exception;
	public void updateIncome (IncomeVO income) throws Exception;
	
	public String[] selectExpenpseEachDayCount (SearchVO search) throws Exception;
	public String[] selectIncomeEachDayCount (SearchVO search) throws Exception;
	
	public List<ExpenseResultVO> selectExpenseCtgySum (SearchVO search) throws Exception;
	public List<IncomeResultVO> selectIncomeCtgySum (SearchVO search) throws Exception;
	
	
	
}
