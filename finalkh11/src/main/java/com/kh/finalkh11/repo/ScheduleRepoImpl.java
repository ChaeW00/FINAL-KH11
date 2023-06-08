package com.kh.finalkh11.repo;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.ScheduleDto;

@Repository
public class ScheduleRepoImpl implements ScheduleRepo{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ScheduleDto> list() {
		return sqlSession.selectList("schedule.list");
	}

	@Override
	public ScheduleDto detail(int scheduleNo) {
		return sqlSession.selectOne("schedule.detail", scheduleNo);
	}

	@Override
	public void insert(ScheduleDto scheduleDto) {
		sqlSession.insert("schedule.insert", scheduleDto);
	}

	@Override
	public int sequence() {
		return sqlSession.selectOne("schedule.sequence");
	}
	
	@Override
	public List<ScheduleDto> time(int groundNo) {
		return sqlSession.selectList("schedule.time", groundNo);
	}

	@Override
	public List<ScheduleDto> availableSchedules(Date reserveDate, int groundNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("reserveDate", reserveDate);
		param.put("groundNo", groundNo);
		
		return sqlSession.selectList("schedule.availableSchedules", param);
	}

	@Override
	public boolean edit(ScheduleDto scheduleDto) {
		return sqlSession.update("schedule.edit", scheduleDto) > 0;
	}

	@Override
	public void insertSchedules(List<ScheduleDto> scheduleDtos) {
		sqlSession.insert("schedule.insertSchedules", scheduleDtos);
	}

	@Override
	public boolean deleteSchedule(int scheduleNo) {
		return sqlSession.delete("schedule.deleteSchedule", scheduleNo) > 0;
	}
}