package com.kh.finalkh11.controller;

import javax.servlet.http.HttpSession;

import com.kh.finalkh11.dto.MemberDto;
import com.kh.finalkh11.dto.TeamMemberDto;
import com.kh.finalkh11.repo.TeamMemberRepo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/teamMember")
public class TeamMemberController {
    @Autowired
    private TeamMemberRepo teamMemberRepo;
    
    @PostMapping("/join")
    public String joinTeam(HttpSession session, @RequestParam int teamNo){
        String memberId = ((MemberDto)session.getAttribute("mdto")).getMemberId();
        int teamMemberNo = teamMemberRepo.sequence();
        TeamMemberDto teamMemberDto = new TeamMemberDto(teamMemberNo, teamNo, memberId, "일반회원");
        teamMemberRepo.insert(teamMemberDto);
        return "redirect:/";
    }

    @GetMapping("/info/{teamMemberNo}")
    public ModelAndView teamMemberInfo(@PathVariable int teamMemberNo) {
        ModelAndView mv = new ModelAndView("teamMember/info");
        TeamMemberDto teamMemberDto = teamMemberRepo.findTeamMember(teamMemberNo);
        mv.addObject("teamMemberDto", teamMemberDto);
        return mv;
    }

    @DeleteMapping("/delete")
    public String deleteTeamMember(HttpSession session, @RequestParam int teamNo) {
        String memberId = ((MemberDto)session.getAttribute("mdto")).getMemberId();
        TeamMemberDto teamMemberDto = new TeamMemberDto();
        teamMemberDto.setMemberId(memberId);
        teamMemberDto.setTeamNo(teamNo);
        teamMemberRepo.deleteTeamMember(teamMemberDto.getTeamMemberNo());
        return "redirect:/";
    }
}