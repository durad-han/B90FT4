package b90ft4.web.repository.mapper;

import java.util.List;

import b90ft4.web.repository.vo.ExpenseCategoryVO;
import b90ft4.web.repository.vo.ExpenseVO;
import b90ft4.web.repository.vo.IncomeCategoryVO;
import b90ft4.web.repository.vo.IncomeVO;

public interface AccBookMapper {
	
	public List<ExpenseCategoryVO> selectExpenseCtgy(String userId) throws Exception;
	public List<IncomeCategoryVO> selectIncomeCtgy(String userId) throws Exception;
	public List<IncomeCategoryVO> count() throws Exception;
	public void insertExpense(ExpenseVO expense) throws Exception;
	public void insertIncome(IncomeVO expense) throws Exception;

	
	
}
