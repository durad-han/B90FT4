package b90ft4.web.repository.mapper;

import java.util.List;

import b90ft4.web.repository.vo.ExpenseCategoryVO;
import b90ft4.web.repository.vo.IncomeCategoryVO;

public interface AccBookMapper {
	
	public List<ExpenseCategoryVO> selectExpenseCtgy(String userId) throws Exception;
	public List<IncomeCategoryVO> selectIncomeCtgy(String userId) throws Exception;
	public List<IncomeCategoryVO> count() throws Exception;

	
}
