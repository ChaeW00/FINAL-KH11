package com.kh.finalkh11.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalkh11.dto.TeamDto;
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

//    @Override
//    public List<TeamDto> getTeamByMemberId(String memberId) {
//        // 팀 리더로서의 팀 가져오기
//        List<TeamDto> teamsAsLeader = teamRepo.selectTeamByLeaderId(memberId);
//        // 팀 멤버로서의 팀 가져오기
//        List<Integer> teamNosAsMember = teamMemberRepo.selectTeamByMemberId(memberId);
////        List<Integer> teamNosAsMember = teamMemberRepo.selectTeamNosByMemberId(memberId);
//        List<TeamDto> teamsAsMember = new ArrayList<>();
//        for (Integer teamNo : teamNosAsMember) {
//            TeamDto teamDto = teamRepo.selectOne(teamNo);
//            int memberCount = teamMemberRepo.selectTeamMemberCount(teamNo); // 팀원의 총 수 조회
//            teamDto.setTeamMemberCount(memberCount); // 팀원의 총 수 설정
//            teamsAsMember.add(teamDto);
//        }
////        // 두 목록을 합치기
////        List<TeamDto> allTeams = new ArrayList<>();
////        allTeams.addAll(teamsAsLeader);
////        allTeams.addAll(teamsAsMember);
////        return allTeams;
//        
//        // 중복된 팀 제거
//        List<TeamDto> allTeams = new ArrayList<>();
//        allTeams.addAll(teamsAsLeader);
//        for (TeamDto teamDto : teamsAsMember) {
//        	if (!teamsAsLeader.stream().anyMatch(t -> t.getTeamNo() == teamDto.getTeamNo())) {
//                allTeams.add(teamDto);
//            }
//        }
//        return allTeams;
//    }
    @Override
    public List<TeamDto> getTeamByMemberId(String memberId) {
        // 팀 리더로서의 팀 가져오기
        List<TeamDto> teamsAsLeader = teamRepo.selectTeamByLeaderId(memberId);
        // 팀 멤버로서의 팀 가져오기
        List<Integer> teamNosAsMember = teamMemberRepo.selectTeamByMemberId(memberId);
        List<TeamDto> teamsAsMember = new ArrayList<>();
        for (Integer teamNo : teamNosAsMember) {
            TeamDto teamDto = teamRepo.selectOne(teamNo);
            int memberCount = teamMemberRepo.selectTeamMemberCount(teamNo); // 팀원의 총 수 조회
            teamDto.setTeamMemberCount(memberCount); // 팀원의 총 수 설정
            teamsAsMember.add(teamDto);
        }
        
        // 중복된 팀 제거 및 팀 리더의 팀에 중복 팀원 정보 추가
        List<TeamDto> allTeams = new ArrayList<>();
        Set<Integer> addedTeamNos = new HashSet<>();
        for (TeamDto teamDto : teamsAsLeader) {
            if (addedTeamNos.contains(teamDto.getTeamNo())) {
                continue; // 이미 추가된 팀은 건너뛰기
            }
            addedTeamNos.add(teamDto.getTeamNo());
            allTeams.add(teamDto);
            TeamDto teamWithMembers = teamsAsMember.stream().filter(t -> t.getTeamNo() == teamDto.getTeamNo()).findFirst().orElse(null);
            if (teamWithMembers != null) {
                teamDto.setTeamMemberCount(teamWithMembers.getTeamMemberCount());
            }
        }
        
        for (TeamDto teamDto : teamsAsMember) {
            if (!addedTeamNos.contains(teamDto.getTeamNo())) {
                allTeams.add(teamDto);
                addedTeamNos.add(teamDto.getTeamNo());
            }
        }
        
        return allTeams;
    }
}