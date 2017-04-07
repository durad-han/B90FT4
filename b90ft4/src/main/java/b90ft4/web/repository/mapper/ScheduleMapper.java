package b90ft4.web.repository.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import b90ft4.web.repository.vo.ScheduleSearchVO;
import b90ft4.web.repository.vo.ScheduleVO;
import b90ft4.web.repository.vo.ScheduleVO2;

@Repository
public interface ScheduleMapper {

	public List<ScheduleVO> selectScheduleList(ScheduleSearchVO ssVO) throws Exception;
	
	public int selectScheduleCount(ScheduleSearchVO ssVO) throws Exception;
	
	public ScheduleVO selectScheduleNo(int scheduleNo) throws Exception;
	
	public void updateSchedule(ScheduleVO schedule) throws Exception;
	
	public void deleteSchedule(int scheduleNo) throws Exception;
	
	public void insertSchedule(ScheduleVO schedule) throws Exception;

}
