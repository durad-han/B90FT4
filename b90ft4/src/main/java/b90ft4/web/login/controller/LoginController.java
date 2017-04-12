package b90ft4.web.login.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import b90ft4.web.login.service.LoginService;

@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired
	private LoginService ls;
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/loginForm.do")
	public String loginPage (){
		logger.debug("welcome.");
		return "login/naverLogin";
	}
	
	@RequestMapping("/login.do")
	public String loginCallback (){
		logger.debug("welcome.");
		return "login/naverLoginCallback";
	}
	@RequestMapping("/logout.do")
	public void options (){
		logger.debug("bye");
	}


}
