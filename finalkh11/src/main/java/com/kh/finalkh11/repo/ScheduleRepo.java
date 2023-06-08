package com.kh.finalkh11.repo;

import java.sql.Date;
import java.util.List;

import com.kh.finalkh11.dto.ScheduleDto;

public interface ScheduleRepo {
	int sequence();
	void insert(ScheduleDto scheduleDto);
	void insertSchedules(List<ScheduleDto> scheduleDtos);
	List<ScheduleDto> list();
	ScheduleDto detail(int scheduleNo);
	List<ScheduleDto> time(int groundNo);
	List<ScheduleDto> availableSchedules(Date reserveDate, int groundNo);
	boolean edit(ScheduleDto scheduleDto);
	boolean deleteSchedule(int scheduleNo);
}