package com.kh.finalkh11.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
//	@PostMapping("/insert")
//	public String 
	
	//팀 게시판 목록
	@GetMapping("/recruit-member")
	public String recruitMember(Model model) {
		List<TeamDto> list = teamRepo.selectList();
		model.addAttribute("TeamList", list);
		return "team/recruit-member";
	}
}
  