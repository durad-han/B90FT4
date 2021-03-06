package b90ft4.web.schedule.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import b90ft4.web.repository.mapper.ScheduleMapper;
import b90ft4.web.repository.vo.PageResultVO;
import b90ft4.web.repository.vo.ScheduleSearchVO;
import b90ft4.web.repository.vo.ScheduleVO;
import b90ft4.web.repository.vo.ScheduleVO;

@Service
public class ScheduleServiceImpl implements ScheduleService {
	@Autowired
	private ScheduleMapper sm;

//	ScheduleSearchVO 에 조회할 스케줄 날짜, 유저 아이디를 넣어서 검색하도록 한다
	@Override
	public Map<String, Object> retrieveScheduleList(ScheduleSearchVO ssVO) throws Exception {
		System.out.println("retrieveScheduleList Service");
		Map<String, Object> sMap = new HashMap<>();
		
		ssVO.setPageNo(1);
		
		if(sm.selectScheduleList(ssVO) == null) return null;
		
		sMap.put("scheduleList", sm.selectScheduleList(ssVO));
		sMap.put("pageResult", new PageResultVO(ssVO.getPageNo(), sm.selectScheduleCount(ssVO)));
		
		return sMap;
	}
	
	@Override
	public List<ScheduleVO> monthlyScheduleList(ScheduleSearchVO ssVO) throws Exception {
		return sm.selectMonthly(ssVO);
	}
	

//	PK인 scheduleNo 로 해당 스케줄 검색
	@Override
	public ScheduleVO retrieveSchedule(int scheduleNo) throws Exception {
		System.out.println("retrieveSchedule Service");
		return sm.selectScheduleNo(scheduleNo);
	}

	@Override
	public void modifySchedule(ScheduleVO schedule) throws Exception {
		System.out.println("modifySchedule Service");
		sm.updateSchedule(schedule);
		
	}

	@Override
	public void deleteSchedule(int scheduleNo) throws Exception {
		System.out.println("deleteSchedule Service");
		sm.deleteSchedule(scheduleNo);
		
	}

	@Override
	public void insertSchedule(ScheduleVO schedule) throws Exception {
		System.out.println("insertSchedule Service");
		sm.insertSchedule(schedule);
		
	}
	
	
}
