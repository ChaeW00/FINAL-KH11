package com.kh.finalkh11.repo;

import java.util.List;

import com.kh.finalkh11.dto.TeamDto;

public interface TeamRepo {
	void insert(TeamDto teamDto);
	List<TeamDto> selectList();
	List<TeamDto> selecList(String column, String keyword);
	TeamDto selectOne(int no);
	boolean delete(int teamNo);
	boolean update(TeamDto teamdto);
}
