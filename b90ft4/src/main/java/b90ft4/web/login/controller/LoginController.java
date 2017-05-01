package b90ft4.web.login.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import b90ft4.web.login.service.LoginService;
import b90ft4.web.repository.vo.UserVO;

@Controller
@RequestMapping("/login")
public class LoginController {
//	@Autowired
//	private LoginService ls;
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/loginPage.do")
	public void loginPage () throws Exception{
	}
	
	@RequestMapping("/login.do")
	public String login (UserVO user, Model model) throws Exception{
		logger.debug("login controller");
		
		model.addAttribute("user", user);
		return "main/main";
	}
	
	
	
//	case : naver --------------------------------------------------------------------
//	@RequestMapping("/nLoginForm.do")
//	public String nLoginPage (UserVO user, Model model) throws Exception{
//		logger.debug("naver welcome.");
//		
//		model.addAttribute("user", ls.nLogin(user));
//		return "login/nLogin";
//	}
//	
//	@RequestMapping("/nLogin.do")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
//	public String nLoginCallback (){
//		logger.debug("naver welcome.");
//		return "login/nLoginCallback";
//	}
//	
//	@RequestMapping("/nLogout.do")
//	public void nLogout (){
//		logger.debug("naver bye");
//	}
//
////	case : google -------------------------------------------------------------------
//	@RequestMapping("/gLoginForm.do")
//	public String gLoginPage (){
//		logger.debug("google welcome.");
//		return "login/naverLogin";
//	}
//	
//	@RequestMapping("/gLogin.do")
//	public String gLoginCallback (){
//		logger.debug("google welcome.");
//		return "login/naverLoginCallback";
//	}
//	
//	@RequestMapping("/gLogout.do")
//	public void gLogout (){
//		logger.debug("google bye");
//	}
	

}
