package com.kh.finalkh11.repo;

import java.util.List;

import com.kh.finalkh11.dto.StatsViewDto;

public interface StatsViewRepo {
	List<StatsViewDto> selecList();
	List<StatsViewDto> selecListTeam();
	List<StatsViewDto> selectListMemberLevel();
}
