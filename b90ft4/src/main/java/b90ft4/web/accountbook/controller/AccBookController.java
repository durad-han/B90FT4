package b90ft4.web.accountbook.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import b90ft4.web.accountbook.service.AccBookService;
import b90ft4.web.repository.vo.DebtVO;
import b90ft4.web.repository.vo.ExpensePlanVO;
import b90ft4.web.repository.vo.ExpenseVO;
import b90ft4.web.repository.vo.IncomeVO;
import b90ft4.web.repository.vo.LoanVO;
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
	
	/* 대입금 / 차입금 파트 */
	
	@RequestMapping("/loanDept.do")
	public void loanDept() {
		
	}
	
	@ResponseBody
	@RequestMapping("/bondList.do")
	public Map<String, Object> bondList(SearchVO search) throws Exception {
		search.setUserId("김현영");
		System.out.println(search.getStartDate());
		return service.retrieveBondList(search);
	}
	
	
	@ResponseBody
	@RequestMapping("/regiBond.do")
	public String regiLoanDebt(LoanVO loan,DebtVO debt) throws Exception {
		loan.setUserId("김현영");
		debt.setUserId("김현영");
		service.registerBond(loan, debt);
		return "ok";
	}
	
	
	@ResponseBody
	@RequestMapping("/deleteBond.do")
	public String deleteBond(SearchVO search) throws Exception {
		service.deleteBond(search);
		return "ok";
	}
	
	@ResponseBody
	@RequestMapping("/updateBond.do")
	public String deleteBond(LoanVO loan,DebtVO debt) throws Exception {
		
		System.out.println(debt.getMoneyLender());
		System.out.println(debt.getDebtContent());
		System.out.println(debt.getDebtNo());
		System.out.println(debt.getDebtAmount());
		
		service.updateBond(loan, debt);
		return "ok";
	}
	
	@RequestMapping("/setting.do")
	public void setting() {
	}
	
	@ResponseBody
	@RequestMapping("/makeExcel.do")
	public void makeExcel(SearchVO search,
							HttpServletRequest request, 
							HttpServletResponse response) throws Exception {
		
		String filePath = "C:/accountBookFile/"+UUID.randomUUID().toString()+".csv";
		search.setExcelFileName(filePath);
		search.setUserId("김현영");
		service.makeExcel(search);
		
		File f = new File(filePath);
		
		response.setHeader("Content-Type", "application/octetstream; charset=utf-8");
		// 다운로드 파일 이름 헤더 설정
		response.setHeader(
				"Content-Disposition", "attachment;filename=" + new String((search.getUserId()+" 가계부.csv").getBytes("UTF-8"), "8859_1"));
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Content-Length", String.valueOf(f.length()));
		
		FileInputStream fis = new FileInputStream(f);
		BufferedInputStream bis = new BufferedInputStream(fis);
		
		OutputStream out = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(out);
		
		
		bos.write(0xEF);
		bos.write(0xBB);
		bos.write(0xBF);
		String 	str = "번호,이름,분류,내용,금액,날짜\n"
				+ " ";
		bos.write(str.getBytes("utf-8"));
		bos.write(32);
		
		while (true) {
			int ch = bis.read();
			
			if (ch == -1) break;
			bos.write(ch);
		}
		
		bis.close();
		fis.close();
		bos.close();
		out.close();
		
		if(f.delete()){
			System.out.println("파일 삭제");
		}else{
			System.out.println("파일 삭제 실패");
		}
	}
	
	@ResponseBody
	@RequestMapping("/regiPlan.do")
	public String regiPlan(ExpensePlanVO plan) throws Exception{
		plan.setUserId("김현영");
		service.regiPlan(plan);
		return "ok";
	}
	
	@ResponseBody
	@RequestMapping("/expensePlan.do")
	public ExpensePlanVO expensePlan(ExpensePlanVO plan) throws Exception{
		return service.expensePlan(plan);
	}
	
}










//		System.out.println(plan.getExpensePlanDate());
//		System.out.println(plan.getExpenseGoal());
//		System.out.println(plan.getPlanStatus());

//		System.out.println(loan.getDebtor());
//		System.out.println(loan.getLoanAmount());
//		System.out.println(loan.getLoanContent());
//		System.out.println(loan.getUserId());
//		System.out.println(loan.getLoanDate());
//		System.out.println("--------------------------");
//		System.out.println(debt.getMoneyLender());
//		System.out.println(debt.getDebtAmount());
//		System.out.println(debt.getDebtContent());
//		System.out.println(debt.getUserId());
//		System.out.println(debt.getDebtDate());
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








