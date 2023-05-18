package com.kh.finalkh11.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalkh11.dto.MemberDto;
import com.kh.finalkh11.dto.TeamDto;
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
    public String showinsertForm(Model model) {
        // 팀 생성 폼을 보여주는 로직 구현
        // 필요한 데이터를 Model에 추가하여 JSP로 전달
        return "insert"; // 팀 생성 페이지의 JSP 파일 이름을 반환
    }

    @PostMapping("/insert")
    public String insertTeam(@ModelAttribute TeamDto teamDto, @ModelAttribute MemberDto memberDto) {
        // 팀 생성 로직 구현
        // TeamDto에는 팀 정보가, MemberDto에는 팀장 정보가 담겨 전달됨
        // 팀 생성 관련 서비스를 호출하여 팀 생성 수행

        // 팀장 정보를 DB에 등록하는 로직
        // memberDto에는 팀장의 정보가 담겨 전달됨
        // 회원 등록 관련 서비스를 호출하여 팀장 정보 등록 수행

        return "redirect:/team/list"; // 팀 목록 페이지로 리다이렉트
    }

    @GetMapping("/list")
    public String showTeamList(Model model) {
        // 팀 목록을 조회하여 Model에 추가하여 JSP로 전달
        return "teamList"; // 팀 목록 페이지의 JSP 파일 이름을 반환
    }

    @GetMapping("/{teamNo}")
    public String showTeamDetails(@PathVariable int teamNo, Model model) {
        // 특정 팀의 상세 정보 조회
        // teamNo에 해당하는 팀의 정보를 조회하여 Model에 추가하여 JSP로 전달
        return "teamDetails"; // 팀 상세 페이지의 JSP 파일 이름을 반환
    }

    @GetMapping("/{teamNo}/edit")
    public String showEditForm(@PathVariable int teamNo, Model model) {
        // 특정 팀의 수정 폼을 보여주는 로직 구현
        // teamNo에 해당하는 팀의 정보를 조회하여 Model에 추가하여 JSP로 전달
        return "editTeam"; // 팀 수정 페이지의 JSP 파일 이름을 반환
    }

    @PostMapping("/{teamNo}/edit")
    public String editTeam(@PathVariable int teamNo, @ModelAttribute TeamDto teamDto) {
        // 팀 수정 로직 구현
        // teamNo에 해당하는 팀의 정보를 수정함
        // 팀 수정 관련 서비스를 호출하여 팀 수정 수행
        return "redirect:/team/" + teamNo; // 팀 상세 페이지로 리다이렉트
    }

    @PostMapping("/{teamNo}/delete")
    public String deleteTeam(@PathVariable int teamNo) {
        // 팀 삭제 로직 구현
        // teamNo에 해당하는 팀을 삭제함
        // 팀 삭제 관련 서비스를 호출하여 팀 삭제 수행
        return "redirect:/team/list"; // 팀 목록 페이지로 리다이렉트
    }
}