package b90ft4.web.common.path;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path = { "/diary", "/accountbook","/main","/repository","/schedule","/workout" })
public class Path {
	@RequestMapping("/path.do")
	public String path(HttpServletRequest request){
		String path = request.getContextPath();
		return path; 
	}

}
