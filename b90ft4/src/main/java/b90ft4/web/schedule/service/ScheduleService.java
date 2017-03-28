package b90ft4.web.schedule.service;

import java.util.Map;

import b90ft4.web.repository.vo.ScheduleSearchVO;
import b90ft4.web.repository.vo.ScheduleVO;

public interface ScheduleService {

	Map<String, Object> retrieveScheduleList(ScheduleSearchVO ssVO) throws Exception;

	ScheduleVO retrieveSchedule(int scheduleNo) throws Exception;

	void modifySchedule(ScheduleVO schedule) throws Exception;

	void deleteSchedule(int scheduleNo) throws Exception;

	void insertSchedule(ScheduleVO schedule) throws Exception;

}
