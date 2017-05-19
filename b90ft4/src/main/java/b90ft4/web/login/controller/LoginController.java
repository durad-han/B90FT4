package b90ft4.web.login.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import b90ft4.web.login.service.LoginService;
import b90ft4.web.repository.vo.UserVO;
import b90ft4.web.workout.controller.WorkoutController;
import b90ft4.web.workout.service.WorkoutService;

@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired
	private LoginService ls;
	@Autowired
	private WorkoutService ws;
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/user.do")
	public void user (String userId, HttpSession session) throws Exception{
		UserVO user = new UserVO();
		logger.debug("user side Id : "+userId);
		user.setUserId(userId);
		ls.userCheck(user);
		System.out.println(ws.workoutUserInfoSelect(userId));
//		session.setAttribute("userInfo", ws.workoutUserInfoSelect(userId));
	}
	
	@RequestMapping("/updateUser.do")
	public String updateUser () throws Exception{
		UserVO user = new UserVO();
		user.setUserId("Durad  Han");
		ls.userCheck(user);
		return "redirect:/login/user.do";
	}
	
	@RequestMapping("/loginPage.do")
	public void loginPage () throws Exception{
	}
	
	@RequestMapping("/login.do")
	public String login (String userId, Model model, HttpSession session) throws Exception{
		logger.debug("login controller");
		UserVO user = new UserVO();
		user.setUserId(userId);
		
		// 존재하는 user 인지 확인. 정보가 없다면 false -> regist, 존재한다면 true -> 정보 올려줌
		if(!ls.userCheck(user)) ls.regist(user);
		
		session.setAttribute("user", ls.login(user));
		return "redirect:/main/main.do";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/main/main.do";
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
	@RequestMapping("/nLogin.do")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
	public String nLoginCallback (){
		logger.debug("naver welcome.");
		return "login/nLoginCallback";
	}
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
