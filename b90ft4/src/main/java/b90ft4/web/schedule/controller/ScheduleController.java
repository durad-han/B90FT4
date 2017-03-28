package b90ft4.web.schedule.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public void retrieveScheduleList (ScheduleSearchVO ssVO) throws Exception{
		System.out.println("retrieveScheduleList");
		ss.retrieveScheduleList(ssVO);
	}
	
	@RequestMapping("/schedule.do")
	public void retrieveSchedule (int scheduleNo) throws Exception{
		System.out.println("retrieveSchedule");
		ss.retrieveSchedule(scheduleNo);
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
