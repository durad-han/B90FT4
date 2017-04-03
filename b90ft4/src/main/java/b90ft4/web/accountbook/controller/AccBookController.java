package b90ft4.web.accountbook.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import b90ft4.web.accountbook.service.AccBookService;
import b90ft4.web.repository.mapper.AccBookMapper;

@Controller
@RequestMapping("/accountBook")
public class AccBookController {

	@Autowired
	private AccBookService service;
	@Autowired
	private AccBookMapper dao;
	
	@RequestMapping("/main.do")
	public String main(Model model) throws Exception{
		model.addAttribute("subMenu","전체");
		return "accountbook/main";
	}
	@RequestMapping("/budget.do")
	public String budget(Model model) throws Exception{
		model.addAttribute("subMenu","지출/수입");
		return "accountbook/main";
	}
	
	@ResponseBody
	@RequestMapping("/budgetCtgy.do")
	public Map<String, Object> retrieveBudgetCtgy(String userId) throws Exception {
		return service.retrieveBudgetCtgy(userId);
	}

//	@RequestMapping("/budget.do")
//	public String budget(Model model) throws Exception{
//		model.addAttribute("budget","budget");
//		return "accountbook/main";
//	}
	
	
	
	
}
