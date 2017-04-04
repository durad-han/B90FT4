package b90ft4.web.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import b90ft4.web.login.service.LoginService;

@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired
	private LoginService ls;
	
	@RequestMapping("/login.do")
	public void loginPage (){
		System.out.println("welcome.");
	}
	
	@RequestMapping("/logout.do")
	public void options (){
		System.out.println("bye");
	}


}
