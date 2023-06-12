package com.kh.finalkh11.repo;

import java.util.List;

import com.kh.finalkh11.dto.TeamMemberDto;
import com.kh.finalkh11.vo.TeamInMemberInfoVO;
import com.kh.finalkh11.vo.TeamMemberVO;

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
	List<TeamInMemberInfoVO> teamMemberInfo(int teamNo);
	
	List<TeamMemberVO> selectMemberwithVO(int teamNo);
	List<TeamMemberVO> selectTeamListwithVO(String memberId);
	List<TeamInMemberInfoVO> searchTeamMembers(int teamNo, String keyword);
	void updateTeamMemberLevel(int teamMemberNo, String teamMemberLevel);

}