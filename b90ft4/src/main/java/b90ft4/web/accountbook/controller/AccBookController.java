package b90ft4.web.accountbook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import b90ft4.web.repository.mapper.AccBookMapper;

@Controller
@RequestMapping("/accBook")
public class AccBookController {

	@Autowired
	AccBookMapper dao;
	
	@RequestMapping("/main.do")
	public void test() throws Exception{
		System.out.println(dao.count());
		System.out.println("캬캬");
	}
	
	
}
