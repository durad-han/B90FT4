package b90ft4.web.schedule.controller;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	
	private final Logger logger = LoggerFactory.getLogger(getClass());

//----- 스케줄 조회 관련 -----------------------------------------------------------------------	

	//----- 스케줄 리스트 호출시 (초기로딩 포함) ---------------------------------------------------------
	@RequestMapping("/scheduleList.do")
	public String retrieveScheduleList (Model model) throws Exception{
		logger.debug("retrieveScheduleList");
		ScheduleSearchVO ssVO = new ScheduleSearchVO();
//		List<ScheduleVO> sList = (List<ScheduleVO>) retrieveScheduleList(ssVO).get("scheduleList");
//		ScheduleVO svo = sList.get(0);
//		logger.debug("--------------------------------");
//		logger.debug("title "+svo.getTitle());
//		logger.debug("content "+svo.getContent());
//		logger.debug("userId "+svo.getUserId());
//		logger.debug("--------------------------------");
		
		model.addAttribute("scheduleMap", ss.retrieveScheduleList(ssVO));
		return "schedule/scheduleList";
	}	

	//----- 스케줄 디테일 출력용 (ajax 호출) ----------------------------------------------------------
	@RequestMapping("/rschedule.json")
	@ResponseBody
	public ScheduleVO retrieveSchedule (int scheduleNo) throws Exception{
		logger.debug("retrieveSchedule json");
//		logger.debug("scheduleNo : "+scheduleNo);
//		ScheduleVO svo = ss.retrieveSchedule(scheduleNo);
//		logger.debug("--------------------------------");
//		logger.debug("title "+svo.getTitle());
//		logger.debug("content "+svo.getContent());
//		logger.debug("userId "+svo.getUserId());
//		logger.debug("--------------------------------");
		
		return ss.retrieveSchedule(scheduleNo);
	}
	
	//----- 스케줄 캘린더 호출시 --------------------------------------------------------------------
	@RequestMapping("/scheduleCalendar.do")
	public String retrieveScheduleCalendar (Model model) throws Exception{
		logger.debug("retrieveScheduleCalendar");
		ScheduleSearchVO ssVO = new ScheduleSearchVO();
//		List<ScheduleVO> sList = (List<ScheduleVO>) retrieveScheduleList(ssVO).get("scheduleList");
//		ScheduleVO svo = sList.get(0);
//		logger.debug("--------------------------------");
//		logger.debug("title "+svo.getTitle());
//		logger.debug("content "+svo.getContent());
//		logger.debug("userId "+svo.getUserId());
//		logger.debug("--------------------------------");
		
		model.addAttribute("scheduleMap", ss.retrieveScheduleList(ssVO));
		return "schedule/scheduleCalendar";
	}	
	
	//----- 스케줄 그래프 호출시 --------------------------------------------------------------------
	@RequestMapping("/scheduleGraph.do")
	public String retrieveScheduleGraph (Model model) throws Exception{
		logger.debug("retrieveScheduleGraph");
		ScheduleSearchVO ssVO = new ScheduleSearchVO();
//		List<ScheduleVO> sList = (List<ScheduleVO>) retrieveScheduleList(ssVO).get("scheduleList");
//		ScheduleVO svo = sList.get(0);
//		logger.debug("--------------------------------");
//		logger.debug("title "+svo.getTitle());
//		logger.debug("content "+svo.getContent());
//		logger.debug("userId "+svo.getUserId());
//		logger.debug("--------------------------------");
		
		model.addAttribute("scheduleMap", ss.retrieveScheduleList(ssVO));
		return "schedule/scheduleGraph";
	}	
	
	
//----- 스케줄 수정, 삭제 관련 ------------------------------------------------------------------
	@RequestMapping("/modify.json")
	public void modifySchedule (ScheduleVO2 schedule2) throws Exception{
		logger.debug("modifySchedule");
		ScheduleVO sVO = new ScheduleVO();
		
		logger.debug(schedule2.getUserId());
//		logger.debug(schedule2.getCategory());
		logger.debug(schedule2.getTitle());
		logger.debug(schedule2.getStart());
		logger.debug(schedule2.getEnd());
//		logger.debug(schedule2.getImportance());
		logger.debug(schedule2.getContent());
		
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
	public String deleteSchedule (int scheduleNo) throws Exception{
		logger.debug("deleteSchedule");
		logger.debug("scheduleNo : "+scheduleNo);
		ss.deleteSchedule(scheduleNo);
		return "schedule/scheduleList";
	}
	
	
//----- 스케줄 입력 관련 -----------------------------------------------------------------------
	@RequestMapping("/insertSchedule.do")
	public String insertSchedule (HttpServletRequest req, ScheduleVO2 scheduleVO2) throws Exception{
		logger.debug("insertSchedule");
		
		logger.debug("--------------------------------");
		logger.debug("scheduleVO 자동화 체크 : ");
		logger.debug("title "+scheduleVO2.getTitle());
		logger.debug("content "+scheduleVO2.getContent());
		logger.debug("start "+scheduleVO2.getStart());
		logger.debug("end "+scheduleVO2.getEnd());
		logger.debug("importance "+scheduleVO2.getImportance());
		logger.debug("--------------------------------");
		
		logger.debug("--------------------------------");
		logger.debug("title "+req.getParameter("title"));
		logger.debug("content "+req.getParameter("content"));
		logger.debug("start "+req.getParameter("start"));
		logger.debug("end "+req.getParameter("end"));
		logger.debug("importance "+req.getParameter("importance"));
		logger.debug("--------------------------------");
		
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
