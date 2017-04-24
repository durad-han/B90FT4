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
	
//	case : naver --------------------------------------------------------------------
	@RequestMapping("/nloginForm.do")
	public String nLoginPage (){
		logger.debug("naver welcome.");
		return "login/naverLogin";
	}
	
	@RequestMapping("/nlogin.do")
	public String nLoginCallback (){
		logger.debug("naver welcome.");
		return "login/naverLoginCallback";
	}
	@RequestMapping("/nlogout.do")
	public void nLogout (){
		logger.debug("naver bye");
	}

//	case : google -------------------------------------------------------------------
	@RequestMapping("/gloginForm.do")
	public String gLoginPage (){
		logger.debug("google welcome.");
		return "login/naverLogin";
	}
	
	@RequestMapping("/glogin.do")
	public String gLoginCallback (){
		logger.debug("google welcome.");
		return "login/naverLoginCallback";
	}
	@RequestMapping("/glogout.do")
	public void gLogout (){
		logger.debug("google bye");
	}
	
	
	
	

}
