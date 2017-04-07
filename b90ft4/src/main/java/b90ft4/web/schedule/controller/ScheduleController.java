package b90ft4.web.schedule.controller;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import b90ft4.web.repository.vo.ScheduleSearchVO;
import b90ft4.web.repository.vo.ScheduleVO;
import b90ft4.web.repository.vo.ScheduleVO2;
import b90ft4.web.schedule.service.ScheduleService;

@RequestMapping("/schedule")
@Controller
public class ScheduleController {
	@Autowired
	private ScheduleService ss;

//----- 스케줄 조회 관련 -----------------------------------------------------------------------	

	//----- 스케줄 리스트 호출시 (초기로딩 포함) ---------------------------------------------------------
	@RequestMapping("/scheduleList.do")
	public String retrieveScheduleList (Model model) throws Exception{
		System.out.println("retrieveScheduleList");
		ScheduleSearchVO ssVO = new ScheduleSearchVO();
//		List<ScheduleVO> sList = (List<ScheduleVO>) retrieveScheduleList(ssVO).get("scheduleList");
//		ScheduleVO svo = sList.get(0);
//		System.out.println("--------------------------------");
//		System.out.println("title "+svo.getTitle());
//		System.out.println("content "+svo.getContent());
//		System.out.println("userId "+svo.getUserId());
//		System.out.println("--------------------------------");
		
		model.addAttribute("scheduleMap", ss.retrieveScheduleList(ssVO));
		return "schedule/scheduleList";
	}	

	//----- 스케줄 디테일 출력용 (ajax 호출) ----------------------------------------------------------
	@RequestMapping("/rschedule.json")
	@ResponseBody
	public ScheduleVO retrieveSchedule (int scheduleNo) throws Exception{
		System.out.println("retrieveSchedule json");
//		System.out.println("scheduleNo : "+scheduleNo);
//		ScheduleVO svo = ss.retrieveSchedule(scheduleNo);
//		System.out.println("--------------------------------");
//		System.out.println("title "+svo.getTitle());
//		System.out.println("content "+svo.getContent());
//		System.out.println("userId "+svo.getUserId());
//		System.out.println("--------------------------------");
		
		return ss.retrieveSchedule(scheduleNo);
	}
	
	//----- 스케줄 캘린더 호출시 --------------------------------------------------------------------
	@RequestMapping("/scheduleCalendar.do")
	public String retrieveScheduleCalendar (Model model) throws Exception{
		System.out.println("retrieveScheduleCalendar");
		ScheduleSearchVO ssVO = new ScheduleSearchVO();
//		List<ScheduleVO> sList = (List<ScheduleVO>) retrieveScheduleList(ssVO).get("scheduleList");
//		ScheduleVO svo = sList.get(0);
//		System.out.println("--------------------------------");
//		System.out.println("title "+svo.getTitle());
//		System.out.println("content "+svo.getContent());
//		System.out.println("userId "+svo.getUserId());
//		System.out.println("--------------------------------");
		
		model.addAttribute("scheduleMap", ss.retrieveScheduleList(ssVO));
		return "schedule/scheduleCalendar";
	}	
	
	//----- 스케줄 그래프 호출시 --------------------------------------------------------------------
	@RequestMapping("/scheduleGraph.do")
	public String retrieveScheduleGraph (Model model) throws Exception{
		System.out.println("retrieveScheduleGraph");
		ScheduleSearchVO ssVO = new ScheduleSearchVO();
//		List<ScheduleVO> sList = (List<ScheduleVO>) retrieveScheduleList(ssVO).get("scheduleList");
//		ScheduleVO svo = sList.get(0);
//		System.out.println("--------------------------------");
//		System.out.println("title "+svo.getTitle());
//		System.out.println("content "+svo.getContent());
//		System.out.println("userId "+svo.getUserId());
//		System.out.println("--------------------------------");
		
		model.addAttribute("scheduleMap", ss.retrieveScheduleList(ssVO));
		return "schedule/scheduleGraph";
	}	
	
	
//----- 스케줄 수정, 삭제 관련 ------------------------------------------------------------------
	@RequestMapping("/modify.json")
	public void modifySchedule (ScheduleVO2 schedule2) throws Exception{
		System.out.println("modifySchedule");
		ScheduleVO sVO = new ScheduleVO();
		
		System.out.println(schedule2.getUserId());
		System.out.println(schedule2.getCategory());
		System.out.println(schedule2.getTitle());
		System.out.println(schedule2.getStart());
		System.out.println(schedule2.getEnd());
		System.out.println(schedule2.getImportance());
		System.out.println(schedule2.getContent());
		
		// 임시 떔빵
		sVO.setUserId		(schedule2.getUserId());
		sVO.setCategory		(schedule2.getCategory());
		sVO.setTitle		(schedule2.getTitle());
		sVO.setStart		(Date.valueOf(schedule2.getStart()));
		sVO.setEnd			(Date.valueOf(schedule2.getEnd()));
		sVO.setImportance	(schedule2.getImportance());
		sVO.setContent		(schedule2.getContent());
		
		ss.modifySchedule(sVO);
	}
	
	@RequestMapping("/delete.json")
	public void deleteSchedule (int scheduleNo) throws Exception{
		System.out.println("deleteSchedule");
		System.out.println("scheduleNo : "+scheduleNo);
		ss.deleteSchedule(scheduleNo);
	}
	
	
//----- 스케줄 입력 관련 -----------------------------------------------------------------------
	@RequestMapping("/insertSchedule.do")
	public String insertSchedule (HttpServletRequest req, ScheduleVO2 scheduleVO2) throws Exception{
		System.out.println("insertSchedule");
		
		System.out.println("--------------------------------");
		System.out.println("scheduleVO 자동화 체크 : ");
		System.out.println("title "+scheduleVO2.getTitle());
		System.out.println("content "+scheduleVO2.getContent());
		System.out.println("start "+scheduleVO2.getStart());
		System.out.println("end "+scheduleVO2.getEnd());
		System.out.println("importance "+scheduleVO2.getImportance());
		System.out.println("--------------------------------");
		
		System.out.println("--------------------------------");
		System.out.println("title "+req.getParameter("title"));
		System.out.println("content "+req.getParameter("content"));
		System.out.println("start "+req.getParameter("start"));
		System.out.println("end "+req.getParameter("end"));
		System.out.println("importance "+req.getParameter("importance"));
		System.out.println("--------------------------------");
		
		ScheduleVO sVO = new ScheduleVO();
		//임시 박아넣기
		sVO.setUserId("tester01");
		sVO.setCategory(1);
		
		sVO.setTitle(req.getParameter("title"));
		sVO.setStart(Date.valueOf(req.getParameter("start")));
		sVO.setEnd(Date.valueOf(req.getParameter("end")));
		sVO.setImportance(Integer.parseInt(req.getParameter("importance")));
		sVO.setContent(req.getParameter("content"));
		if(sVO.getTitle() != null)ss.insertSchedule(sVO);
		
		
//		
//		if(scheduleVO.getTitle() != null)ss.insertSchedule(scheduleVO);
		return "schedule/scheduleList";
	}
	
	
	
	
}
