package b90ft4.web.accountbook.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import b90ft4.web.accountbook.service.AccBookService;
import b90ft4.web.repository.mapper.AccBookMapper;
import b90ft4.web.repository.vo.ExpenseVO;
import b90ft4.web.repository.vo.IncomeVO;

@Controller
@RequestMapping("/accountBook")
public class AccBookController {

	@Autowired
	private AccBookService service;
	
	@RequestMapping("/main.do")
	public void main(Model model) throws Exception{
		model.addAttribute("subMenu","전체");
	}
	@RequestMapping("/budget.do")
	public void budget(Model model) throws Exception{
		model.addAttribute("subMenu","지출/수입");
	}
	
	@ResponseBody
	@RequestMapping("/budgetCtgy.do")
	public Map<String, Object> retrieveBudgetCtgy(String userId) throws Exception {
		return service.retrieveBudgetCtgy(userId);
	}
	
	@ResponseBody
	@RequestMapping("/expenseRegi.do")
	public String registerExpense(ExpenseVO expense) 
			throws Exception {
		
		expense.setUserId("tester03");
		service.registerExpense(expense);
		return "ok";
	}
	
	@ResponseBody
	@RequestMapping("/incomeRegi.do")
	public String registerIncome(IncomeVO income) 
			throws Exception {

		income.setUserId("tester03");
		service.registerIncome(income);
		return "ok";
	}
	
	@ResponseBody
	@RequestMapping("/budgetList.do")
	public Map<String, Object> budgetList(){

		return null;
	}
	
	
}


































//System.out.println("지출 등록");
//System.out.println(expense.getExpenseAmount());
//System.out.println(expense.getExpenseCategoryNo());
//System.out.println(expense.getExpenseContent());
//System.out.println(expense.getExpenseDate());
//System.out.println("소득 등록");
//System.out.println(income.getIncomeAmount());
//System.out.println(income.getIncomeCategoryNo());
//System.out.println(income.getIncomeContent());
//System.out.println(income.getIncomeDate());








