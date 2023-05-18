package com.kh.finalkh11.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalkh11.dto.TeamDto;
import com.kh.finalkh11.dto.TeamMemberDto;
import com.kh.finalkh11.repo.TeamMemberRepo;
import com.kh.finalkh11.repo.TeamRepo;

@Controller
@RequestMapping("/team")
public class TeamController {

    @Autowired
    private TeamRepo teamRepo;

    @Autowired
    private TeamMemberRepo teamMemberRepo;

    @GetMapping("/insert")
    public String showInsertTeamForm(Model model) {
        model.addAttribute("teamDto", new TeamDto());
        return "insert"; // 이것은 팀 생성 폼을 위한 jsp 파일 이름이어야 합니다.
    }

    @PostMapping("/insert")
    public String insertTeam(@ModelAttribute TeamDto teamDto, @RequestParam String memberId) {
        int teamNo = teamRepo.sequence();
        teamDto.setTeamNo(teamNo);
        teamDto.setTeamLeader(memberId);
        teamRepo.insert(teamDto);

        // Set member as team leader
        TeamMemberDto leader = new TeamMemberDto();
        leader.setTeamMemberNo(teamMemberRepo.sequence());
        leader.setTeamNo(teamNo);
        leader.setMemberId(memberId);
        leader.setTeamMemberLevel("팀장");
        teamMemberRepo.insert(leader);

        return "redirect:/team/insertFinish";
    }
    @GetMapping("/list")
    public String listTeams(Model model) {
        List<TeamDto> teamList = teamRepo.selectList();
        model.addAttribute("teamList", teamList);
        return "team/list"; // update this with your actual list view
    }

    @GetMapping("/detail/{no}")
    public String detailTeam(@PathVariable("no") int teamNo, Model model) {
        TeamDto teamDto = teamRepo.selectOne(teamNo);
        model.addAttribute("team", teamDto);
        return "team/detail"; // update this with your actual detail view
    }

    @PostMapping("/update")
    public String updateTeam(@ModelAttribute TeamDto teamDto) {
        boolean result = teamRepo.update(teamDto);
        if (result) {
            return "redirect:/team/detail/" + teamDto.getTeamNo();
        } else {
            // handle error
            return "redirect:/team/detail/" + teamDto.getTeamNo();
        }
    }

    @PostMapping("/delete/{no}")
    public String deleteTeam(@PathVariable("no") int teamNo) {
        boolean result = teamRepo.delete(teamNo);
        if (result) {
            return "redirect:/team/list";
        } else {
            // handle error
            return "redirect:/team/detail/" + teamNo;
        }
    }
}