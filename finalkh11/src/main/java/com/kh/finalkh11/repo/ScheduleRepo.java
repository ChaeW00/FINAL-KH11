package com.kh.finalkh11.repo;

import java.util.List;

import com.kh.finalkh11.dto.ScheduleDto;

public interface ScheduleRepo {
	List<ScheduleDto> selectList(int groundNo);
}
