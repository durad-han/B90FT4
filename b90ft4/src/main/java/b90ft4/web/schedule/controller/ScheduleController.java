package b90ft4.web.schedule.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import b90ft4.web.repository.vo.ScheduleSearchVO;
import b90ft4.web.repository.vo.ScheduleVO;
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
	@RequestMapping("/update.do")
	public void modifySchedule (ScheduleVO schedule) throws Exception{
		System.out.println("modifySchedule");
		ss.modifySchedule(schedule);
	}
	
	@RequestMapping("/delete.do")
	public void deleteSchedule (int scheduleNo) throws Exception{
		System.out.println("deleteSchedule");
		ss.deleteSchedule(scheduleNo);
	}
	
	
//----- 스케줄 입력 관련 -----------------------------------------------------------------------
	@RequestMapping("/scheduleForm.do")
	public void insertSchedule (ScheduleVO schedule) throws Exception{
		System.out.println("insertSchedule");
		ss.insertSchedule(schedule);
	}
	
	
	
	
	
	
}
