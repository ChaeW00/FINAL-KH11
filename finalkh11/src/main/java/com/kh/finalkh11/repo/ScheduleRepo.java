package com.kh.finalkh11.repo;

import java.sql.Date;
import java.util.List;

import com.kh.finalkh11.dto.ScheduleDto;

public interface ScheduleRepo {
	int sequence();
	void insert(ScheduleDto scheduleDto);
	List<ScheduleDto> list();
	ScheduleDto detail(int scheduleNo);
	List<ScheduleDto> time(int groundNo);
	List<ScheduleDto> completedSchedules(Date reserveDate, int groundNo);
}