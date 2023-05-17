package com.kh.finalkh11.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalkh11.dto.MemberDto;
import com.kh.finalkh11.dto.TeamDto;
import com.kh.finalkh11.repo.TeamRepo;

@Controller
@RequestMapping("/team")
public class TeamController {
	
	@Autowired
	private TeamRepo teamRepo;
	
	@GetMapping("/insert")
	public String insert() {
		return "team/insert";
	}
	
	@PostMapping("/insert")
	private String insert(
			@ModelAttribute TeamDto teamDto,
			@ModelAttribute MemberDto memberDto,
			@ModelAttribute TeamMemberDto TeamMemberDto,
//			@RequestParam MultipartFile attachment,
			RedirectAttributes attr,
			HttpSession session) throws IllegalStateException, IOException {
		String teamLeader = (String)session.getAttribute("loginId");

		teamDto.setTeamLeader(teamLeader);
		//AhzitService에서 번호를 미리 생성 후 등록, 첨부파일 업로드(저장)까지 처리
		int teamNo = teamService.insert(teamDto, teamMemberDto, teamLeader);
//		int teamNo = teamService.insert(teamDto, teamMemberDto,  attachment, teamLeader);
	
		return "redirect:/team_in/" + teamNo;
	}
}
  