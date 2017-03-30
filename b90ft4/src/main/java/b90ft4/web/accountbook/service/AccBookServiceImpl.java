package b90ft4.web.accountbook.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import b90ft4.web.repository.mapper.AccBookMapper;

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
	
}
