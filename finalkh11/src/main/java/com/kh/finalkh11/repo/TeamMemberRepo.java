package com.kh.finalkh11.repo;

import com.kh.finalkh11.dto.TeamMemberDto;

public interface TeamMemberRepo {
    int sequence();
    void insert(TeamMemberDto teamMemberDto);
    void insert2(TeamMemberDto teamMemberDto);
    TeamMemberDto findTeamMember(int teamMemberNo);
    void deleteTeamMember(int teamMemberNo);
}