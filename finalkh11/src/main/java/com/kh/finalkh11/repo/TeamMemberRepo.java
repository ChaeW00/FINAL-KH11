package com.kh.finalkh11.repo;

import java.util.List;

import com.kh.finalkh11.dto.MemberDto;
import com.kh.finalkh11.dto.TeamMemberDto;

public interface TeamMemberRepo {
	List<TeamMemberDto> selectTeamMember(int teamNo);
	TeamMemberDto findTeam(String memberId);
}
