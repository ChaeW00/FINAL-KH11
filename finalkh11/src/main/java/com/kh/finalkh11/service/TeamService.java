package com.kh.finalkh11.service;

import java.util.List;

import com.kh.finalkh11.dto.TeamDto;

public interface TeamService {
    List<TeamDto> getTeamByTeamLeader(String memberId);
    List<TeamDto> getTeamByMemberId(String memberId);
}