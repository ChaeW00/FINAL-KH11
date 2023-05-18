package com.kh.finalkh11.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalkh11.dto.TeamMemberDto;
import com.kh.finalkh11.repo.TeamMemberRepo;

@Controller
@RequestMapping("/team/member")
public class TeamMemberController {

    @Autowired
    private TeamMemberRepo teamMemberRepo;

    @PostMapping("/join")
    public String joinTeam(@ModelAttribute TeamMemberDto teamMemberDto) {
        // 팀 가입 로직 구현
        // teamMemberDto에 팀 가입 관련 정보가 담겨 전달됨
        // 팀 가입 관련 서비스를 호출하여 팀 가입 수행
        return "redirect:/team/" + teamMemberDto.getTeamNo(); // 팀 상세 페이지로 리다이렉트
    }

    @PostMapping("/leave")
    public String leaveTeam(@RequestParam("teamMemberNo") int teamMemberNo) {
        // 팀 탈퇴 로직 구현
        // teamMemberNo에 해당하는 팀 멤버를 탈퇴시킴
        // 팀 탈퇴 관련 서비스를 호출하여 팀 탈퇴 수행
        return "redirect:/team/list"; // 팀 목록 페이지로 리다이렉트
    }

    @PostMapping("/{teamMemberNo}/edit")
    public String editTeamMember(@PathVariable int teamMemberNo, @ModelAttribute TeamMemberDto teamMemberDto) {
        // 팀 멤버 수정 로직 구현
        // teamMemberNo에 해당하는 팀 멤버의 정보를 수정함
        // 팀 멤버 수정 관련 서비스를 호출하여 팀 멤버 수정 수행
        return "redirect:/team/" + teamMemberDto.getTeamNo(); // 팀 상세 페이지로 리다이렉트
    }
}