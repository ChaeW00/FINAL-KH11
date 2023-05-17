package com.kh.finalkh11.repo;

import java.util.List;

import com.kh.finalkh11.dto.TeamDto;

public interface TeamRepo {
	int sequence();//team_no 시퀀스 번호 발행
	void insert(TeamDto teamDto); // 팀 생성
	List<TeamDto> selectList();
//	List<TeamDto> selecList(String column, String keyword);
	TeamDto selectOne(int no);
	boolean delete(int teamNo);
	boolean update(TeamDto teamdto);
//	void record(TeamDto teamdto);
//	void schedule(TeamDto teamdto);
}
