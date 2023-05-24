package com.kh.finalkh11.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalkh11.dto.TeamDto;
import com.kh.finalkh11.dto.TeamMemberDto;
import com.kh.finalkh11.repo.TeamMemberRepo;
import com.kh.finalkh11.repo.TeamRepo;

@Service
public class TeamServiceImpl implements TeamService {

    private final TeamRepo teamRepo;
    private final TeamMemberRepo teamMemberRepo;

    @Autowired
    public TeamServiceImpl(TeamRepo teamRepo, TeamMemberRepo teamMemberRepo) {
        this.teamRepo = teamRepo;
        this.teamMemberRepo = teamMemberRepo;
    }

    @Override
    public List<TeamDto> getTeamByTeamLeader(String memberId) {
        return teamRepo.selectTeamByLeaderId(memberId);  // 올바른 맵핑 ID를 호출
    }

    @Override
    public List<TeamDto> getTeamByMemberId(String memberId) {
        // 팀 리더로서의 팀 가져오기
        List<TeamDto> teamsAsLeader = teamRepo.selectTeamByLeaderId(memberId);
        // 팀 멤버로서의 팀 가져오기
        List<Integer> teamNosAsMember = teamMemberRepo.selectTeamByMemberId(memberId);
//        List<Integer> teamNosAsMember = teamMemberRepo.selectTeamNosByMemberId(memberId);
        List<TeamDto> teamsAsMember = new ArrayList<>();
        for (Integer teamNo : teamNosAsMember) {
            TeamDto teamDto = teamRepo.selectOne(teamNo);
            teamsAsMember.add(teamDto);
        }
//        // 두 목록을 합치기
//        List<TeamDto> allTeams = new ArrayList<>();
//        allTeams.addAll(teamsAsLeader);
//        allTeams.addAll(teamsAsMember);
//        return allTeams;
        
        // 중복된 팀 제거
        List<TeamDto> allTeams = new ArrayList<>();
        allTeams.addAll(teamsAsLeader);
        for (TeamDto teamDto : teamsAsMember) {
            if (!teamsAsLeader.contains(teamDto)) {
                allTeams.add(teamDto);
            }
        }
        return allTeams;
    }
}