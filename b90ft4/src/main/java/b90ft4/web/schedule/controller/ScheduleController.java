package b90ft4.web.schedule.controller;

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
		if(ss.retrieveScheduleList(ssVO) != null){ 
			model.addAttribute("scheduleMap", ss.retrieveScheduleList(ssVO));
		}
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
	public String modifySchedule (ScheduleVO scheduleVO, RedirectAttributes attr) throws Exception{
		logger.debug("modifySchedule");
		
		logger.debug(scheduleVO.getUserId());
//		logger.debug(scheduleVO.getCategory());
		logger.debug(scheduleVO.getTitle());
		logger.debug(scheduleVO.getStart());
		logger.debug(scheduleVO.getEnd());
//		logger.debug(scheduleVO.getImportance());
		logger.debug(scheduleVO.getContent());
		
		// 임시 떔빵
//		sVO.setUserId		(scheduleVO.getUserId());
//		sVO.setCategory		(scheduleVO.getCategory());
//		sVO.setTitle		(scheduleVO.getTitle());
//		sVO.setStart		(Date.valueOf(scheduleVO.getStart()));
//		sVO.setEnd			(Date.valueOf(scheduleVO.getEnd()));
//		sVO.setImportance	(scheduleVO.getImportance());
//		sVO.setContent		(scheduleVO.getContent());
		
		ss.modifySchedule(scheduleVO);
		attr.addFlashAttribute("msg", "스케줄이 수정되었습니다");
		return "redirect:scheduleList.do";
	}
	
	@RequestMapping("/delete.json")
	public String deleteSchedule (int scheduleNo, RedirectAttributes attr) throws Exception{
		logger.debug("deleteSchedule");
		logger.debug("scheduleNo : "+scheduleNo);
		ss.deleteSchedule(scheduleNo);
		attr.addFlashAttribute("msg", "스케줄이 삭제되었습니다");
		return "redirect:scheduleList.do";
	}
	
	
//----- 스케줄 입력 관련 -----------------------------------------------------------------------
	@RequestMapping("/insertSchedule.do")
	public String insertSchedule (ScheduleVO scheduleVO) throws Exception{
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
		return "redirect:scheduleList.do";
	}
	
	
	
	
}
