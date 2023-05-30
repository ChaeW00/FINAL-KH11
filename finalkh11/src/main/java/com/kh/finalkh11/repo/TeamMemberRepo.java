package com.kh.finalkh11.repo;

import java.util.List;

import com.kh.finalkh11.dto.TeamMemberDto;

public interface TeamMemberRepo {
    int sequence();
    void insert(TeamMemberDto teamMemberDto);
    void insert2(TeamMemberDto teamMemberDto);
    TeamMemberDto findTeamMember(int teamMemberNo);
    void deleteTeamMember(int teamMemberNo);
    List<Integer> selectTeamByMemberId(String memberId);
	int selectTeamMemberCount(int teamNo);
	List<TeamMemberDto> getTeamMemberList(int teamNo);
	boolean checkIfTeamMember(String memberId, int teamNo);
}