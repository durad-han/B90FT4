package b90ft4.web.accountbook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import b90ft4.web.repository.mapper.AccBookMapper;

@Controller
@RequestMapping("/accountBook")
public class AccBookController {

	@Autowired
	AccBookMapper dao;
	
	@RequestMapping("/main.do")
	public String main() throws Exception{
		return "accountbook/main";
	}

	@RequestMapping("/budget.do")
	public String budget(Model model) throws Exception{
		model.addAttribute("budget","budget");
		return "accountbook/main";
	}
	
	@RequestMapping("/budgetRegi.do")
	public String budgetRegi(Model model) throws Exception{
		model.addAttribute("budget","budget");
		return "accountbook/main";
	}
	
	
	
}
