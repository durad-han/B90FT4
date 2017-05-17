package b90ft4.web.schedule.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import b90ft4.web.repository.vo.ScheduleSearchVO;
import b90ft4.web.repository.vo.ScheduleVO;
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
	public String retrieveScheduleList (String userId, Model model) throws Exception{
		logger.debug("retrieveScheduleList");
		ScheduleSearchVO ssVO = new ScheduleSearchVO();
		logger.debug(userId);
		ssVO.setUserId(userId);
		
		if(ss.retrieveScheduleList(ssVO) != null){ 
			model.addAttribute("scheduleMap", ss.retrieveScheduleList(ssVO));
		}
		return "schedule/schedule";
	}	
	//----- 스케줄 한달치 호출시 ---------------------------------------------------------
	@RequestMapping("/monthlyScheduleList.json")
	@ResponseBody
	public String monthlyScheduleList (String userId, String month, Model model) throws Exception{
		logger.debug("monthlyScheduleList");
		ScheduleSearchVO ssVO = new ScheduleSearchVO();
		ssVO.setUserId(userId);
		ssVO.setMonth(month);
		
		model.addAttribute("scheduleMap", ss.monthlyScheduleList(ssVO));
		return "schedule/schedule";
	}	

	//----- 스케줄 디테일 출력용 (ajax 호출) ----------------------------------------------------------
	@RequestMapping("/rschedule.json")
	@ResponseBody
	public ScheduleVO retrieveSchedule (int scheduleNo) throws Exception{
		logger.debug("retrieveSchedule json");
		
		return ss.retrieveSchedule(scheduleNo);
	}
	
	//----- 스케줄 캘린더 호출시 --------------------------------------------------------------------
	@RequestMapping("/scheduleCalendar.do")
	public void initScheduleCalendar () throws Exception{
		logger.debug("initiate ScheduleCalendar");
	}	
	
	//----- 스케줄 캘린더 값 주기 --------------------------------------------------------------------
	@RequestMapping("/scheduleCalendar.json")
	@ResponseBody
	public Map<String, Object> retrieveScheduleCalendar (String userId) throws Exception{
		logger.debug("retrieveScheduleCalendar");
		ScheduleSearchVO ssVO = new ScheduleSearchVO();
		ssVO.setUserId(userId);
		return ss.retrieveScheduleList(ssVO);
	}	
	
	//----- 스케줄 그래프 호출시 --------------------------------------------------------------------
	@RequestMapping("/scheduleGraph.do")
	public String retrieveScheduleGraph (Model model) throws Exception{
		logger.debug("retrieveScheduleGraph");
		ScheduleSearchVO ssVO = new ScheduleSearchVO();
		
		model.addAttribute("scheduleMap", ss.retrieveScheduleList(ssVO));
		return "schedule/scheduleGraph";
	}	
	
	
//----- 스케줄 수정, 삭제 관련 ------------------------------------------------------------------
	@RequestMapping("/modify.json")
	public String modifySchedule (ScheduleVO scheduleVO, RedirectAttributes attr) throws Exception{
		logger.debug("modifySchedule");
		
		ss.modifySchedule(scheduleVO);
		attr.addFlashAttribute("msg", "스케줄이 수정되었습니다");
		return "redirect:scheduleList";
	}
	
	@RequestMapping("/delete.json")
	public void deleteSchedule (int scheduleNo) throws Exception{
		logger.debug("deleteSchedule");
		logger.debug("scheduleNo : "+scheduleNo);
		ss.deleteSchedule(scheduleNo);
	}
	
	@RequestMapping("/test.do")
	public String test () throws Exception{
		return "schedule/schedule";
	}
	
	
//----- 스케줄 입력 관련 -----------------------------------------------------------------------
	@RequestMapping("/insertSchedule.do")
	public String insertSchedule (ScheduleVO scheduleVO, RedirectAttributes attr) throws Exception{
		logger.debug("insertSchedule");
		
		logger.debug("--------------------------------");
		logger.debug("scheduleVO 자동화 체크 : ");
		logger.debug("title "+scheduleVO.getTitle());
		logger.debug("content "+scheduleVO.getContent());
		logger.debug("start "+scheduleVO.getStart());
		logger.debug("end "+scheduleVO.getEnd());
		logger.debug("importance "+scheduleVO.getImportance());
		logger.debug("--------------------------------");
		
		if(scheduleVO.getTitle() != null)ss.insertSchedule(scheduleVO);
		attr.addFlashAttribute("msg", "스케줄이 입력되었습니다");
		return "redirect:scheduleList.do";
	}
	
	
	
	
}
