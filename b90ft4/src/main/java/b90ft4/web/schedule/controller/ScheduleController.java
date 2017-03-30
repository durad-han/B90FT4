package b90ft4.web.schedule.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import b90ft4.web.repository.vo.ScheduleSearchVO;
import b90ft4.web.repository.vo.ScheduleVO;
import b90ft4.web.schedule.service.ScheduleService;

@RequestMapping("/schedule")
@Controller
public class ScheduleController {
	@Autowired
	private ScheduleService ss;

//----- 스케줄 조회 관련 -----------------------------------------------------------------------	
	@RequestMapping("/scheduleList.do")
	public Map<String, Object> retrieveScheduleList (ScheduleSearchVO ssVO) throws Exception{
		System.out.println("retrieveScheduleList");
		return ss.retrieveScheduleList(ssVO);
	}
	
	@RequestMapping("/rschedule.do")
	public void retrieveSchedule (/*int scheduleNo*/) throws Exception{
		System.out.println("retrieveSchedule");
//		ss.retrieveSchedule(scheduleNo);
	}
	
	@RequestMapping("/schedule.do")
	public String schedule (Model model) throws Exception{
		System.out.println("schedule");
		ScheduleSearchVO ssVO = new ScheduleSearchVO();
		
//		List<ScheduleVO> sList = (List<ScheduleVO>) retrieveScheduleList(ssVO).get("scheduleList");
//		ScheduleVO svo = sList.get(0);
//		System.out.println("--------------------------------");
//		System.out.println("title "+svo.getTitle());
//		System.out.println("content "+svo.getContent());
//		System.out.println("userId "+svo.getUserId());
//		System.out.println("--------------------------------");
		
		model.addAttribute("schedule", retrieveScheduleList(ssVO));
		return "schedule/schedule";
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
	@RequestMapping("/write.do")
	public void insertSchedule (ScheduleVO schedule) throws Exception{
		System.out.println("insertSchedule");
		ss.insertSchedule(schedule);
	}
	
	
	
	
	
	
}
