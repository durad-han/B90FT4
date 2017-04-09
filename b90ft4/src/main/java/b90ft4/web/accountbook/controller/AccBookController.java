package b90ft4.web.accountbook.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import b90ft4.web.accountbook.service.AccBookService;
import b90ft4.web.repository.vo.ExpenseVO;
import b90ft4.web.repository.vo.IncomeVO;
import b90ft4.web.repository.vo.SearchVO;

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
	
	// 지출/수입 카테고리 쏴주기
	@ResponseBody
	@RequestMapping("/budgetCtgy.do")
	public Map<String, Object> retrieveBudgetCtgy(String userId) throws Exception {
		return service.retrieveBudgetCtgy(userId);
	}
	
	// 지출 등록
	@ResponseBody
	@RequestMapping("/expenseRegi.do")
	public String registerExpense(ExpenseVO expense) 
			throws Exception {
		expense.setUserId("김현영");
		service.registerExpense(expense);
		return "ok";
	}
	
	// 수입 등록
	@ResponseBody
	@RequestMapping("/incomeRegi.do")
	public String registerIncome(IncomeVO income) 
			throws Exception {
		income.setUserId("김현영");
		service.registerIncome(income);
		return "ok";
	}
	
	// 지출/수입 리스트 
	@ResponseBody
	@RequestMapping("/budgetList.do")
	public Map<String, Object> retrieveBudgetList(SearchVO search) throws Exception{
		search.setUserId("김현영");

		Map<String, Object> result;
		
		if(search.getBudgetSearchCode()!=3){
			result = service.retrieveBudgetList(search);
		}else{
			result = service.retrieveBudgetList(search);
		}
		
//		Calendar c = Calendar.getInstance();
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		Date d = sdf.parse(search.getStartDate());
//		c.setTime(d);
//		System.out.println("몇주 차 ? : " + c.get(Calendar.WEEK_OF_MONTH));
		
		return result;
	}
	
	
	// 지출/수입 삭제
	@ResponseBody
	@RequestMapping("/deleteBudget.do")
	public String deleteBudget(SearchVO search) throws Exception{
		service.deleteBudget(search);
		return "ok";
	}
	
	// 지출/수입 수정
	@ResponseBody
	@RequestMapping("/updateBudget.do")
	public String updateBudget(ExpenseVO expense, IncomeVO income) throws Exception{
		// userId는 세션으로 받는다...
		service.updateBudget(expense, income);
		return "ok";
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








