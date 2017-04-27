package b90ft4.web.login.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import b90ft4.web.login.service.LoginService;
import b90ft4.web.repository.vo.UserVO;

@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired
	private LoginService ls;
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
//	case : naver --------------------------------------------------------------------
	@RequestMapping("/nLoginForm.do")
	public String nLoginPage (UserVO user){
		logger.debug("naver welcome.");
		ls.nLogin(user);
		return "login/naverLogin";
	}
	
	@RequestMapping("/nLogin.do")
	public String nLoginCallback (){
		logger.debug("naver welcome.");
		return "login/naverLoginCallback";
	}
	@RequestMapping("/nLogout.do")
	public void nLogout (){
		logger.debug("naver bye");
	}

//	case : google -------------------------------------------------------------------
	@RequestMapping("/gLoginForm.do")
	public String gLoginPage (){
		logger.debug("google welcome.");
		return "login/naverLogin";
	}
	
	@RequestMapping("/gLogin.do")
	public String gLoginCallback (){
		logger.debug("google welcome.");
		return "login/naverLoginCallback";
	}
	@RequestMapping("/gLogout.do")
	public void gLogout (){
		logger.debug("google bye");
	}
	
	
	
	

}
